USE [master]
GO
/****** Object:  Database [RDB2017_v2]    Script Date: 22.5.2017 12:56:34 ******/
CREATE DATABASE [RDB2017_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RDB2017_v2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RDB2017_v2.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RDB2017_v2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RDB2017_v2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RDB2017_v2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RDB2017_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RDB2017_v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RDB2017_v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RDB2017_v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RDB2017_v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RDB2017_v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [RDB2017_v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RDB2017_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RDB2017_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RDB2017_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RDB2017_v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RDB2017_v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RDB2017_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RDB2017_v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RDB2017_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RDB2017_v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RDB2017_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RDB2017_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RDB2017_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RDB2017_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RDB2017_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RDB2017_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RDB2017_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RDB2017_v2] SET RECOVERY FULL 
GO
ALTER DATABASE [RDB2017_v2] SET  MULTI_USER 
GO
ALTER DATABASE [RDB2017_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RDB2017_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RDB2017_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RDB2017_v2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RDB2017_v2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RDB2017_v2', N'ON'
GO
USE [RDB2017_v2]
GO
/****** Object:  User [Simon]    Script Date: 22.5.2017 12:56:34 ******/
CREATE USER [Simon] FOR LOGIN [Simon] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  Table [dbo].[filters]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filters](
	[use_count] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[imported]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[imported](
	[file_hash] [varchar](100) NOT NULL,
	[import_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[file_hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[laptops]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[laptops](
	[id_ltp] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
	[screen] [varchar](10) NULL,
	[screen_f] [int] NULL,
	[resolution] [varchar](20) NULL,
	[resolution_name] [varchar](20) NULL,
	[resolution_f] [int] NULL,
	[resolution_name_f] [int] NULL,
	[cpu] [varchar](50) NULL,
	[cpu_f] [int] NULL,
	[cores] [int] NULL,
	[cores_f] [int] NULL,
	[ram_type] [varchar](20) NULL,
	[ram_type_f] [int] NULL,
	[ram_speed] [varchar](20) NULL,
	[ram_speed_f] [int] NULL,
	[ram_cap] [int] NULL,
	[ram_cap_f] [int] NULL,
	[os] [varchar](30) NULL,
	[os_f] [int] NULL,
	[hdd_cap] [int] NULL,
	[hdd_cap_f] [int] NULL,
	[hdd_type] [varchar](20) NULL,
	[hdd_type_f] [int] NULL,
	[gpu] [varchar](50) NULL,
	[gpu_f] [int] NULL,
	[color] [varchar](20) NULL,
	[color_f] [int] NULL,
	[high] [float] NULL,
	[high_f] [int] NULL,
	[wide] [float] NULL,
	[wide_f] [int] NULL,
	[deep] [float] NULL,
	[deep_f] [int] NULL,
	[weight] [float] NULL,
	[weight_f] [int] NULL,
	[has_part_error] [bit] NOT NULL,
	[has_pair_error] [bit] NOT NULL,
	[has_duplicity_error] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ltp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pairs]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pairs](
	[id_part_ref] [int] NOT NULL,
	[id_part_val] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[params]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[params](
	[id_param] [int] IDENTITY(1,1) NOT NULL,
	[parameter_name] [varchar](50) NOT NULL,
	[has_pair] [bit] NOT NULL,
	[is_part] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parts]    Script Date: 22.5.2017 12:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parts](
	[id_part] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[id_param] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_part] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
GO
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
GO
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
GO
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
GO
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
INSERT [dbo].[filters] ([use_count]) VALUES (1)
SET IDENTITY_INSERT [dbo].[laptops] ON 

INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (43, N'WVYJB', N'13.3', 0, N'1280 x 800', N'Full HD', 0, 0, N'Intel Core i5(Broadwell / 5. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'1.666', 0, 8, 0, N'Windows 8.1', 0, 872, 0, N'SSD', 0, N'NVIDIA GeForce GTX 960M', 0, N'silver', 0, 38, 0, 288, 0, 243, 0, 2, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (44, N'ZCS-3', N'13.3', 0, N'1920 x 1080', N'WQHD', 10, 10, N'Intel Core M3(Kaby Lake / 7. generace)', 0, 4, 0, N'LPDDR4', 0, N'2.400', 0, 32, 0, N'UHD 4K0', 0, 173, 0, N'HDD', 0, N'NVIDIA GeForce GTX 1070', 0, N'silver', 0, 13, 0, 309, 0, 284, 0, 5, 0, 0, 1, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (45, N'39Z19', N'17.3', 0, N'2560 x 1440', N'WQHD', 0, 0, N'Intel Core M3(Kaby Lake / 7. generace)', 0, 2, 0, N'LPDDR4', 0, N'2.133', 0, 12, 0, N'Windows 8.1', 0, 1196, 0, N'HDD', 0, N'NVIDIA Quadro M1000M', 0, N'grey', 0, 20, 0, 326, 0, 325, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (46, N'6QSR0', N'15.6', 0, N'2560 x 1440', N'QHD +', 10, 10, N'Intel Core M3(Kaby Lake / 7. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'1.666', 0, 32, 0, N'UHD 4K0', 0, 983, 0, N'SSHD', 0, N'NVIDIA Quadro M1000M', 0, N'grey', 0, 36, 0, 348, 0, 365, 0, 4, 0, 0, 1, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (47, N'99Z4S', N'14', 0, N'3200 x 1800', N'QHD +', 0, 0, N'Intel Core i3(Skylake / 6. generace)', 0, 4, 0, N'DDR4 SODIMM', 0, N'2.400', 0, 16, 0, N'Windows 7', 0, 1521, 0, N'HDD', 0, N'NVIDIA GeForce GTX 1050', 0, N'grey', 0, 43, 0, 369, 0, 258, 0, 2, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (48, N'B4SUY', N'14', 0, N'1366 x 768', N'HD', 0, 0, N'Intel Core i3(Skylake / 6. generace)', 0, 4, 0, N'LPDDR4', 0, N'2.400', 0, 12, 0, N'no OS', 0, 1307, 0, N'HDD', 0, N'NVIDIA GeForce GTX 1070', 0, N'grey', 0, 10, 0, 391, 0, 299, 0, 3, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (49, N'FLZLP', N'15.6', 0, N'3200 x 1800', N'WXGA', 0, 0, N'Intel Core i4(Skylake / 6. generace)', 100, 4, 0, N'DDR4 SODIMM', 0, N'1.666', 0, 8, 0, N'Windows 7', 0, 1760, 0, N'SSHD', 0, N'NVIDIA GeForce GTX 960M', 0, N'grey', 0, 26, 0, 413, 0, 339, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (50, N'I4TYH', N'17.3', 0, N'3840 x 2160', N'WXGA', 0, 0, N'Intel Core i3(Skylake / 6. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'2.400', 0, 64, 0, N'Windows 8.1', 0, 149, 0, N'HDD', 0, N'NVIDIA GeForce 940MX', 0, N'grey', 0, 33, 0, 435, 0, 232, 0, 4, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (51, N'I4TYH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'red', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (52, N'I4TYH', NULL, NULL, N'1920 x 1080', N'QHD +', 11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (53, N'SZ066', N'13.3', 0, N'3200 x 1800', N'HD', 0, 0, N'Intel Core i5(Kaby Lake / 7. generace)', 0, 2, 0, N'LPDDR4', 0, N'2.400', 0, 12, 0, N'no OS', 0, 494, 0, N'SSD', 0, N'AMD Radeon R5 M430', 0, N'red', 0, 32, 0, 299, 0, 354, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (54, N'VU7IY', N'17.3', 0, N'2560 x 1440', N'QHD +', 0, 0, N'Intel Core i3(Kaby Lake / 7. generace) ', 0, 4, 0, N'DDR4 SODIMM', 0, N'2.400', 0, 8, 0, N'Windows 7', 0, 499, 0, N'SSD', 0, N'NVIDIA GeForce 940MX', 0, N'silver', 0, 39, 0, 320, 0, 247, 0, 2, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (55, N'YC0-4', N'17.3', 0, N'1366 x 768', N'WQHD', 0, 0, N'Intel Core i3(Haswell / 4. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'1.666', 0, 64, 0, N'Windows 7', 0, 818, 0, N'SSD', 0, N'NVIDIA GeForce GTX 1050', 0, N'black', 0, 14, 0, 342, 0, 287, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (56, N'2U80V', N'14', 0, N'3840 x 2160', N'WQHD', 0, 0, N'Intel Core i7(Crystal Well / 4. generace)', 0, 4, 0, N'DDR4 SODIMM', 0, N'1.666', 0, 32, 0, N'Linux', 0, 605, 0, N'SSD', 0, N'NVIDIA GeForce GTX 1060', 0, N'black', 0, 22, 0, 364, 0, 328, 0, 3, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (57, N'5Q1QN', N'14', 0, N'1920 x 1080', N'Full HD', 0, 0, N'Intel Core i7(Crystal Well / 4. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'1.666', 0, 12, 0, N'Linux', 0, 1145, 0, N'SSHD', 0, N'AMD Radeon R7 M445', 0, N'black', 0, 29, 0, 386, 0, 221, 0, 5, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (58, N'8884S', N'15.6', 0, N'1920 x 1080', N'Full HD', 0, 0, N'Intel Core i7(Broadwell / 5. generace)', 0, 2, 0, N'LPDDR4', 0, N'2.400', 0, 12, 0, N'UHD 4K0', 0, 929, 0, N'HDD', 0, N'NVIDIA GeForce GTX 960M', 0, N'black', 0, 45, 0, 407, 0, 261, 0, 2, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (59, N'AP1UK', N'13.3', 0, N'2560 x 1440', N'WQHD', 0, 0, N'Intel Core i7(Broadwell / 5. generace)', 0, 4, 0, N'DDR4 SODIMM', 0, N'1.666', 0, 64, 0, N'Windows 7', 0, 895, 0, N'SSHD', 0, N'NVIDIA GeForce GTX 1070', 0, N'red', 0, 11, 0, 429, 0, 302, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (60, N'EL8KC', N'17.3', 0, N'3200 x 1800', N'QHD +', 0, 0, N'Intel Core i7(Broadwell / 5. generace)', 0, 2, 0, N'LPDDR4', 0, N'2.400', 0, 64, 0, N'no OS', 0, 1254, 0, N'SSHD', 0, N'NVIDIA GeForce GTX 960M', 0, N'red', 0, 27, 0, 250, 0, 343, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (61, N'H31BH', N'13.3', 0, N'1920 x 1080', N'QHD +', 0, 0, N'Intel Core i3(Broadwell / 5. generace)', 0, 4, 0, N'DDR3 SODIMM', 0, N'2.133', 0, 32, 0, N'Windows 7', 0, 1937, 0, N'HDD', 0, N'AMD Radeon R7 M445', 0, N'white', 0, 35, 0, 272, 0, 235, 0, 5, 0, 0, 0, 0)
INSERT [dbo].[laptops] ([id_ltp], [name], [screen], [screen_f], [resolution], [resolution_name], [resolution_f], [resolution_name_f], [cpu], [cpu_f], [cores], [cores_f], [ram_type], [ram_type_f], [ram_speed], [ram_speed_f], [ram_cap], [ram_cap_f], [os], [os_f], [hdd_cap], [hdd_cap_f], [hdd_type], [hdd_type_f], [gpu], [gpu_f], [color], [color_f], [high], [high_f], [wide], [wide_f], [deep], [deep_f], [weight], [weight_f], [has_part_error], [has_pair_error], [has_duplicity_error]) VALUES (62, N'H31BH', NULL, NULL, NULL, NULL, NULL, NULL, N'Intel Core i5(Skylake / 6. generace)', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[laptops] OFF
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (1, 18)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (2, 19)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (3, 20)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (4, 21)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (5, 22)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (6, 23)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (7, 24)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (8, 25)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (9, 26)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (10, 27)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (11, 28)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (12, 29)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (13, 30)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (14, 31)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (15, 32)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (16, 33)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (17, 34)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (39, 45)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (40, 46)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (41, 47)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (42, 48)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (43, 49)
INSERT [dbo].[pairs] ([id_part_ref], [id_part_val]) VALUES (44, 50)
SET IDENTITY_INSERT [dbo].[params] ON 

INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (1, N'screen_size', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (2, N'resolution', 1, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (3, N'resolution_name', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (4, N'cpu', 1, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (5, N'cpu_cores', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (6, N'ram_type', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (7, N'ram_speed', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (8, N'ram_capacity', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (9, N'os', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (10, N'hdd_capacity', 0, 0)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (11, N'hdd_type', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (12, N'gpu', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (13, N'color', 0, 1)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (14, N'height', 0, 0)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (15, N'width', 0, 0)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (16, N'depth', 0, 0)
INSERT [dbo].[params] ([id_param], [parameter_name], [has_pair], [is_part]) VALUES (17, N'weight', 0, 0)
SET IDENTITY_INSERT [dbo].[params] OFF
SET IDENTITY_INSERT [dbo].[parts] ON 

INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (1, N'Intel Core i3(Broadwell ); 5. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (2, N'Intel Core i3(Haswell ); 4. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (3, N'Intel Core i3(Kaby Lake ); 7. generace) ', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (4, N'Intel Core i3(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (5, N'Intel Core i5(Broadwell ); 5. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (6, N'Intel Core i5(Haswell ); 4. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (7, N'Intel Core i5(Kaby Lake ); 7. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (8, N'Intel Core i5(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (9, N'Intel Core i7(Broadwell ); 5. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (10, N'Intel Core i7(Crystal Well ); 4. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (11, N'Intel Core i7(Haswell ); 4. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (12, N'Intel Core i7(Kaby Lake ); 7. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (13, N'Intel Core i7(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (14, N'Intel Core M3(Kaby Lake ); 7. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (15, N'Intel Core M3(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (16, N'Intel Core M5(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (17, N'Intel Core M7(Skylake ); 6. generace)', 4)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (18, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (19, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (20, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (21, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (22, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (23, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (24, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (25, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (26, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (27, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (28, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (29, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (30, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (31, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (32, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (33, N'2', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (34, N'4', 5)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (35, N'17.3', 1)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (36, N'14', 1)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (37, N'15.6', 1)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (38, N'13.3', 1)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (39, N'1920 x 1080', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (40, N'2560 x 1440', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (41, N'3200 x 1800', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (42, N'1366 x 768', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (43, N'1280 x 800', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (44, N'3840 x 2160', 2)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (45, N'Full HD', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (46, N'WQHD', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (47, N'QHD +', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (48, N'HD', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (49, N'WXGA', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (50, N'UHD 4K0', 3)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (51, N'DDR3 SODIMM', 6)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (52, N'DDR4 SODIMM', 6)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (53, N'LPDDR4', 6)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (54, N'1.666', 7)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (55, N'2.133', 7)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (56, N'2.400', 7)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (57, N'8', 8)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (58, N'12', 8)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (59, N'16', 8)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (60, N'32', 8)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (61, N'64', 8)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (62, N'Linux', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (63, N'no OS', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (64, N'Windows 8.1', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (65, N'Windows 10', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (66, N'Windows 7', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (67, N'UHD 4K0', 9)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (68, N'AMD Radeon R5 M430', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (69, N'AMD Radeon R7 M445', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (70, N'NVIDIA GeForce 940MX', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (71, N'NVIDIA GeForce GTX 960M', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (72, N'NVIDIA GeForce GTX 1050', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (73, N'NVIDIA GeForce GTX 1070', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (74, N'NVIDIA GeForce GTX 1060', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (75, N'NVIDIA Quadro M1000M', 12)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (76, N'HDD', 11)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (77, N'SSHD', 11)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (78, N'SSD', 11)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (79, N'black', 13)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (80, N'silver', 13)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (81, N'red', 13)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (82, N'white', 13)
INSERT [dbo].[parts] ([id_part], [name], [id_param]) VALUES (83, N'grey', 13)
SET IDENTITY_INSERT [dbo].[parts] OFF
ALTER TABLE [dbo].[pairs]  WITH CHECK ADD FOREIGN KEY([id_part_ref])
REFERENCES [dbo].[parts] ([id_part])
GO
ALTER TABLE [dbo].[pairs]  WITH CHECK ADD FOREIGN KEY([id_part_val])
REFERENCES [dbo].[parts] ([id_part])
GO
ALTER TABLE [dbo].[parts]  WITH CHECK ADD FOREIGN KEY([id_param])
REFERENCES [dbo].[params] ([id_param])
GO
USE [master]
GO
ALTER DATABASE [RDB2017_v2] SET  READ_WRITE 
GO
