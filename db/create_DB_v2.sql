/*
* Clear DB
*/
IF OBJECT_ID('dbo.filters', 'U') IS NOT NULL 
  DROP TABLE dbo.filters; 
  
IF OBJECT_ID('dbo.imported', 'U') IS NOT NULL 
  DROP TABLE dbo.imported; 
  
IF OBJECT_ID('dbo.pairs', 'U') IS NOT NULL 
  DROP TABLE dbo.pairs; 
  
IF OBJECT_ID('dbo.parts', 'U') IS NOT NULL 
  DROP TABLE dbo.parts; 

IF OBJECT_ID('dbo.laptops', 'U') IS NOT NULL 
  DROP TABLE dbo.laptops; 
  
IF OBJECT_ID('dbo.params', 'U') IS NOT NULL 
  DROP TABLE dbo.params; 

  
/*
* Create Tables
*/
CREATE TABLE imported
(
  file_hash VARCHAR(100) NOT NULL,
  import_date datetime NOT NULL,
  PRIMARY KEY (file_hash)
);

CREATE TABLE filters
(
  use_count INT NOT NULL
);

CREATE TABLE params
(
  id_param INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  parameter_name VARCHAR(50) NOT NULL,
  has_pair BIT NOT NULL,
  is_part BIT NOT NULL
);

CREATE TABLE parts
(
  id_part INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  id_param INT NOT NULL,
  FOREIGN KEY (id_param) REFERENCES params(id_param)
);

CREATE TABLE pairs
(
  id_part_ref INT NOT NULL,
  id_part_val INT NOT NULL,
  FOREIGN KEY (id_part_ref) REFERENCES parts(id_part),
  FOREIGN KEY (id_part_val) REFERENCES parts(id_part)
);

CREATE TABLE laptops
(
  id_ltp INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(10) NOT NULL,
  screen VARCHAR(10),
  screen_f INT,
  resolution VARCHAR(20),
  resolution_f INT,
  resolution_name VARCHAR(20),
  resolution_name_f INT,
  cpu VARCHAR(50),
  cpu_f INT,
  cores INT,
  cores_f INT,
  ram_type VARCHAR(20),
  ram_type_f INT,
  ram_speed VARCHAR(20),
  ram_speed_f INT,
  ram_cap INT,
  ram_cap_f INT,
  os VARCHAR(30),
  os_f INT,
  hdd_cap INT,
  hdd_cap_f INT,
  hdd_type VARCHAR(20),
  hdd_type_f INT,
  gpu VARCHAR(50),
  gpu_f INT,
  color VARCHAR(20),
  color_f INT,
  high FLOAT,
  high_f INT,
  wide FLOAT,
  wide_f INT,
  deep FLOAT,
  deep_f INT,
  weight FLOAT,
  weight_f INT,
  has_part_error bit NOT NULL,
  has_pair_error bit NOT NULL,
  has_duplicity_error bit NOT NULL
);

/* 
* Fill parameters
*/
INSERT INTO params(parameter_name,has_pair, is_part) 
VALUES
('screen_size', 0, 1),
('resolution', 1, 1),
('resolution_name', 0, 1),
('cpu', 1, 1),
('cpu_cores', 0, 1),
('ram_type', 0, 1),
('ram_speed', 0, 1),
('ram_capacity', 0, 1),
('os', 0, 1),
('hdd_capacity', 0, 0),
('hdd_type', 0, 1),
('gpu', 0, 1),
('color', 0, 1),
('height', 0, 0),
('width', 0, 0),
('depth', 0, 0),
('weight', 0, 0);

/* 
* Fill parts
*/
INSERT INTO parts(id_param,name) 
VALUES
(4, 'Intel Core i3(Broadwell / 5. generace)'),
(4, 'Intel Core i3(Haswell / 4. generace)'),
(4, 'Intel Core i3(Kaby Lake / 7. generace) '),
(4, 'Intel Core i3(Skylake / 6. generace)'),
(4, 'Intel Core i5(Broadwell / 5. generace)'),
(4, 'Intel Core i5(Haswell / 4. generace)'),
(4, 'Intel Core i5(Kaby Lake / 7. generace)'),
(4, 'Intel Core i5(Skylake / 6. generace)'),
(4, 'Intel Core i7(Broadwell / 5. generace)'),
(4, 'Intel Core i7(Crystal Well / 4. generace)'),
(4, 'Intel Core i7(Haswell / 4. generace)'),
(4, 'Intel Core i7(Kaby Lake / 7. generace)'),
(4, 'Intel Core i7(Skylake / 6. generace)'),
(4, 'Intel Core M3(Kaby Lake / 7. generace)'),
(4, 'Intel Core M3(Skylake / 6. generace)'),
(4, 'Intel Core M5(Skylake / 6. generace)'),
(4, 'Intel Core M7(Skylake / 6. generace)');

INSERT INTO parts(id_param,name) 
VALUES
(5, '2'),
(5, '4'),
(5, '4'),
(5, '4'),
(5, '2'),
(5, '2'),
(5, '2'),
(5, '2'),
(5, '2'),
(5, '4'),
(5, '2'),
(5, '4'),
(5, '4'),
(5, '2'),
(5, '4'),
(5, '2'),
(5, '4');

INSERT INTO parts(id_param,name) 
VALUES
(1, '17.3'),
(1, '14'),
(1, '15.6'),
(1, '13.3');

INSERT INTO parts(id_param,name) 
VALUES
(2, '1920 x 1080'),
(2, '2560 x 1440'),
(2, '3200 x 1800'),
(2, '1366 x 768'),
(2, '1280 x 800'),
(2, '3840 x 2160');

INSERT INTO parts(id_param,name) 
VALUES
(3, 'Full HD'),
(3, 'WQHD'),
(3, 'QHD +'),
(3, 'HD'),
(3, 'WXGA'),
(3, 'UHD 4K0');

INSERT INTO parts(id_param,name) 
VALUES
(6, 'DDR3 SODIMM'),
(6, 'DDR4 SODIMM'),
(6, 'LPDDR4');

INSERT INTO parts(id_param,name) 
VALUES
(7, '1.666'),
(7, '2.133'),
(7, '2.400');

INSERT INTO parts(id_param,name) 
VALUES
(8, '8'),
(8, '12'),
(8, '16'),
(8, '32'),
(8, '64');

INSERT INTO parts(id_param,name) 
VALUES
(9, 'Linux'),
(9, 'no OS'),
(9, 'Windows 8.1'),
(9, 'Windows 10'),
(9, 'Windows 7'),
(9, 'UHD 4K0');

INSERT INTO parts(id_param,name) 
VALUES
(12, 'AMD Radeon R5 M430'),
(12, 'AMD Radeon R7 M445'),
(12, 'NVIDIA GeForce 940MX'),
(12, 'NVIDIA GeForce GTX 960M'),
(12, 'NVIDIA GeForce GTX 1050'),
(12, 'NVIDIA GeForce GTX 1070'),
(12, 'NVIDIA GeForce GTX 1060'),
(12, 'NVIDIA Quadro M1000M');

INSERT INTO parts(id_param,name) 
VALUES
(11, 'HDD'),
(11, 'SSHD'),
(11, 'SSD');

INSERT INTO parts(id_param,name) 
VALUES
(13, 'black'),
(13, 'silver'),
(13, 'red'),
(13, 'white'),
(13, 'grey' );


/* 
* Fill parts
*/
INSERT INTO pairs(id_part_ref,id_part_val) 
VALUES
(1, 18),
(2, 19),
(3, 20),
(4, 21),
(5, 22),
(6, 23),
(7, 24),
(8, 25),
(9, 26),
(10, 27),
(11, 28),
(12, 29),
(13, 30),
(14, 31),
(15, 32),
(16, 33),
(17, 34),
(39, 45),
(40, 46),
(41, 47),
(42, 48),
(43, 49),
(44, 50);







