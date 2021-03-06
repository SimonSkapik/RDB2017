USE [RDB2017_v2]
GO
/****** Object:  Trigger [dbo].[import_laptop]    Script Date: 22.5.2017 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Simon Skapik
-- Create date: 17.5.2017
-- Description:	Import 
-- =============================================
ALTER TRIGGER [dbo].[import_laptop]
   ON  [dbo].[laptops]
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for trigger here
	DECLARE @name VARCHAR(50); SET @name = (SELECT name FROM inserted);
	DECLARE @ltp_part_err INT; SET @ltp_part_err = (SELECT has_part_error FROM inserted);
	DECLARE @ltp_pair_err INT; SET @ltp_pair_err = (SELECT has_pair_error FROM inserted);
	DECLARE @ltp_duplicity_err INT; SET @ltp_duplicity_err = (SELECT has_duplicity_error FROM inserted);
	DECLARE @new_screen VARCHAR(50); SET @new_screen = (SELECT screen FROM inserted);
	DECLARE @new_screen_f INT; SET @new_screen_f = 0;
	DECLARE @new_resolution VARCHAR(50); SET @new_resolution = (SELECT resolution FROM inserted);
	DECLARE @new_resolution_f INT; SET @new_resolution_f = 0;
	DECLARE @new_resolution_name VARCHAR(50); SET @new_resolution_name = (SELECT resolution_name FROM inserted);
	DECLARE @new_resolution_name_f INT; SET @new_resolution_name_f = 0;
	DECLARE @new_cpu VARCHAR(50); SET @new_cpu = (SELECT cpu FROM inserted);
	DECLARE @new_cpu_f INT; SET @new_cpu_f = 0;
	DECLARE @new_cores INT; SET @new_cores = (SELECT cores FROM inserted);
	DECLARE @new_cores_f INT; SET @new_cores_f = 0;
	DECLARE @new_ram_type  VARCHAR(50); SET @new_ram_type = (SELECT ram_type FROM inserted);
	DECLARE @new_ram_type_f INT; SET @new_ram_type_f = 0;
	DECLARE @new_ram_speed  VARCHAR(50); SET @new_ram_speed = (SELECT ram_speed FROM inserted);
	DECLARE @new_ram_speed_f INT; SET @new_ram_speed_f = 0;
	DECLARE @new_ram_cap INT; SET @new_ram_cap = (SELECT ram_cap FROM inserted);
	DECLARE @new_ram_cap_f INT; SET @new_ram_cap_f = 0;
	DECLARE @new_os VARCHAR(50); SET @new_os = (SELECT os FROM inserted);
	DECLARE @new_os_f INT; SET @new_os_f = 0;
	DECLARE @new_hdd_cap INT; SET @new_hdd_cap = (SELECT hdd_cap FROM inserted);
	DECLARE @new_hdd_cap_f INT; SET @new_hdd_cap_f = 0;
	DECLARE @new_hdd_type VARCHAR(50); SET @new_hdd_type = (SELECT hdd_type FROM inserted);
	DECLARE @new_hdd_type_f INT; SET @new_hdd_type_f = 0;
	DECLARE @new_gpu VARCHAR(50); SET @new_gpu = (SELECT gpu FROM inserted);
	DECLARE @new_gpu_f INT; SET @new_gpu_f = 0;
	DECLARE @new_color VARCHAR(50); SET @new_color = (SELECT color FROM inserted);
	DECLARE @new_color_f INT; SET @new_color_f = 0;
	DECLARE @new_high INT; SET @new_high = (SELECT high FROM inserted);
	DECLARE @new_high_f INT; SET @new_high_f = 0;
	DECLARE @new_wide INT; SET @new_wide = (SELECT wide FROM inserted);
	DECLARE @new_wide_f INT; SET @new_wide_f = 0;
	DECLARE @new_deep INT; SET @new_deep = (SELECT deep FROM inserted);
	DECLARE @new_deep_f INT; SET @new_deep_f = 0;
	DECLARE @new_weight INT; SET @new_weight = (SELECT weight FROM inserted);
	DECLARE @new_weight_f INT; SET @new_weight_f = 0;

	DECLARE @check_pair INT; SET @check_pair = 0;
	DECLARE @ref_id INT;
	DECLARE @second_id INT;
	
	IF (EXISTS (SELECT L.id_ltp FROM dbo.laptops L, inserted I Where L.name = I.name))
		INSERT INTO filters (use_count) VALUES (1);
	ELSE
		-- Vlozeni noveho zaznamu
		BEGIN
			-- Kontrola Dat:
			-- Rozliseni
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.resolution)
				BEGIN
					SET @new_resolution_f += 100;
					SET @ltp_part_err = 1;
				END
			ELSE
				SET @check_pair += 1;
			IF NOT EXISTS (SELECT id_part FROM dbo.parts P, inserted I WHERE P.name = I.resolution_name)
				BEGIN
					SET @new_resolution_name_f += 100;
					SET @ltp_part_err = 1;
				END
			ELSE
				SET @check_pair += 1;
			IF @check_pair = 2
				BEGIN
					SET @ref_id = (SELECT TOP 1 id_part FROM parts P, inserted I WHERE P.name = I.resolution);
					SET @second_id = (SELECT TOP 1 id_part FROM parts P, inserted I WHERE P.name = I.resolution_name);
					IF NOT EXISTS (SELECT id_part_ref FROM dbo.pairs P WHERE P.id_part_ref = @ref_id AND P.id_part_val = @second_id)
						BEGIN
							SET @new_resolution_f += 10;
							SET @new_resolution_name_f += 10;
							SET @ltp_pair_err = 1;
						END
				END
			-- CPU
			SET @check_pair += 0;
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.cpu)
				BEGIN
					SET @new_cpu_f += 100;
					SET @ltp_part_err = 1;
				END
			ELSE
				SET @check_pair += 1;
			IF NOT EXISTS (SELECT id_part FROM dbo.parts P, inserted I WHERE P.name = I.cores)
				BEGIN
					SET @new_cores_f += 100;
					SET @ltp_part_err = 1;
				END
			ELSE
				SET @check_pair += 1;
			IF @check_pair = 2
				BEGIN
					SET @ref_id = (SELECT TOP 1 id_part FROM parts P, inserted I WHERE P.name = I.cpu);
					SET @second_id = (SELECT TOP 1 id_part FROM parts P, inserted I WHERE P.name = I.cores);
					IF NOT EXISTS (SELECT id_part_ref FROM dbo.pairs P WHERE P.id_part_ref = @ref_id AND P.id_part_val = @second_id)
						BEGIN
							SET @new_cpu_f += 10;
							SET @new_cores_f += 10;
							SET @ltp_pair_err = 1;
						END
				END
			-- RAM Type
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.ram_type)
				BEGIN
					SET @new_ram_type_f += 100;
					SET @ltp_part_err = 1;
				END
			-- RAM Speed
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.ram_speed)
				BEGIN
					SET @new_ram_speed_f += 100;
					SET @ltp_part_err = 1;
				END
			-- OS
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.os)
				BEGIN
					SET @new_os_f += 100;
					SET @ltp_part_err = 1;
				END
			-- HDD Type
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.hdd_type)
				BEGIN
					SET @new_hdd_type_f += 100;
					SET @ltp_part_err = 1;
				END
			-- GPU
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.gpu)
				BEGIN
					SET @new_gpu_f += 100;
					SET @ltp_part_err = 1;
				END
			-- Color
			IF NOT EXISTS (SELECT id_part FROM dbo.parts, inserted I WHERE parts.name = I.color)
				BEGIN
					SET @new_color_f += 100;
					SET @ltp_part_err = 1;
				END
			-- Vlozeni zpracovanych dat
			INSERT INTO laptops (name, screen, screen_f, resolution, resolution_f, resolution_name, resolution_name_f,
						 cpu, cpu_f, cores, cores_f, ram_type, ram_type_f, ram_speed, ram_speed_f,
						 ram_cap, ram_cap_f, os, os_f, hdd_cap, hdd_cap_f, hdd_type, hdd_type_f, gpu, gpu_f, color, color_f,
						 high, high_f, wide, wide_f, deep, deep_f, weight, weight_f,
						 has_part_error, has_pair_error, has_duplicity_error)  
				  VALUES (@name, @new_screen, @new_screen_f, @new_resolution, @new_resolution_f, @new_resolution_name, @new_resolution_name_f,
						 @new_cpu, @new_cpu_f,@new_cores, @new_cores_f, @new_ram_type, @new_ram_type_f, @new_ram_speed, @new_ram_speed_f,
						 @new_ram_cap, @new_ram_cap_f, @new_os, @new_os_f, @new_hdd_cap, @new_hdd_cap_f, @new_hdd_type, @new_hdd_type_f, @new_gpu, @new_gpu_f, @new_color, @new_color_f,
						 @new_high, @new_high_f, @new_wide, @new_wide_f, @new_deep, @new_deep_f, @new_weight, @new_weight_f,
						 @ltp_part_err, @ltp_pair_err, @ltp_duplicity_err);
		END
END
