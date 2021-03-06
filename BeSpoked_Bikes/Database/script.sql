USE [master]
GO
/****** Object:  Database [BeSpoked_Bikes]    Script Date: 11/21/2021 7:05:25 PM ******/
CREATE DATABASE [BeSpoked_Bikes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeSpoked_Bikes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeSpoked_Bikes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeSpoked_Bikes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeSpoked_Bikes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeSpoked_Bikes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeSpoked_Bikes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeSpoked_Bikes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeSpoked_Bikes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeSpoked_Bikes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeSpoked_Bikes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeSpoked_Bikes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET RECOVERY FULL 
GO
ALTER DATABASE [BeSpoked_Bikes] SET  MULTI_USER 
GO
ALTER DATABASE [BeSpoked_Bikes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeSpoked_Bikes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeSpoked_Bikes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeSpoked_Bikes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeSpoked_Bikes] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeSpoked_Bikes', N'ON'
GO
ALTER DATABASE [BeSpoked_Bikes] SET QUERY_STORE = OFF
GO
USE [BeSpoked_Bikes]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[pk_customer] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](20) NOT NULL,
	[start_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[pk_discount] [int] IDENTITY(1,1) NOT NULL,
	[fk_product] [int] NOT NULL,
	[begin_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[discount_percentage] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[pk_product] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[manufacturer] [nvarchar](100) NOT NULL,
	[style] [nvarchar](100) NULL,
	[purchase_price] [decimal](10, 2) NOT NULL,
	[sale_price] [decimal](10, 2) NOT NULL,
	[available_qty] [int] NOT NULL,
	[commission_percentage] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[pk_sales] [int] IDENTITY(1,1) NOT NULL,
	[fk_product] [int] NOT NULL,
	[fk_sales_person] [int] NOT NULL,
	[fk_customer] [int] NOT NULL,
	[sales_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_sales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_person]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_person](
	[pk_sales_person] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](20) NOT NULL,
	[start_date] [date] NOT NULL,
	[termination_date] [date] NULL,
	[fk_manager] [int] NULL,
	[is_manager] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pk_sales_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (1, N'Tara', N'Bay', N'7207 Helen Ave.
Kalispell, MT 59901', N'6665554443', CAST(N'2021-11-01' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (2, N'Isha', N'Pat', N'798 Wayne Drive
North Wales, PA 19454', N'6566566765', CAST(N'2021-11-03' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (5, N'Harry', N'Pot', N'873 S. Trout St.
Lilburn, GA 30047', N'6667778888', CAST(N'2021-10-01' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (7, N'Peter', N'Park', N'347 Oak Meadow Avenue
Livingston, NJ 07039', N'6665554443', CAST(N'2021-11-10' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (8, N'Stan', N'Hardy', N'833 Rockwell Lane
Elkhart, IN 46514', N'1112223334', CAST(N'2021-02-10' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (10, N'Mary', N'Stacy', N'9729 Brewery Drive
Venice, FL 34293', N'8765437654', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[customer] ([pk_customer], [first_name], [last_name], [address], [phone], [start_date]) VALUES (12, N'Liz', N'Watson', N'701 239th Way SE
Sammamish, Washington(WA), 98074', N'1234567899', CAST(N'2021-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (1, N'Berry', N'M1', N'S1', CAST(9.99 AS Decimal(10, 2)), CAST(10.99 AS Decimal(10, 2)), 0, CAST(1.22 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (6, N'Zeus', N'M', N'S', CAST(19.99 AS Decimal(10, 2)), CAST(29.99 AS Decimal(10, 2)), 4, CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (8, N'Bonnie', N'M2', N'S2', CAST(99.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 2, CAST(0.11 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (10, N'Raven', N'm3', N's3', CAST(22.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), 1, CAST(1.78 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (13, N'Pegasus', N'm4', N's4', CAST(88.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 2, CAST(0.89 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (16, N'Bumblebee', N'm5', N's5', CAST(94.22 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 10, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (18, N'Black Panther', N'm5', N's5', CAST(94.22 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 8, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (19, N'Dracarys', N'm5', N's5', CAST(94.22 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 7, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (22, N'Speedliner', N'm5', N's5', CAST(94.22 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 8, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (23, N'Blackhawk', N'm5', N's5', CAST(94.22 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 10, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (24, N'Lolita', N'M1', N'S1', CAST(49.99 AS Decimal(10, 2)), CAST(59.99 AS Decimal(10, 2)), 2, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (25, N'Siren', N'M11', N'S11', CAST(99.99 AS Decimal(10, 2)), CAST(199.99 AS Decimal(10, 2)), 3, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (26, N'Archie', N'M11', N'S11', CAST(99.99 AS Decimal(10, 2)), CAST(199.99 AS Decimal(10, 2)), 4, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (27, N'Patriot', N'm13', N's13', CAST(299.99 AS Decimal(10, 2)), CAST(399.99 AS Decimal(10, 2)), 5, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (28, N'Rocketman', N'm13', N's13', CAST(299.99 AS Decimal(10, 2)), CAST(399.99 AS Decimal(10, 2)), 5, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (29, N'Audrey', N'M15', N'Style 15', CAST(30.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 10, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (30, N'Tequila', N'M15', N'S15', CAST(30.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 8, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (31, N'The Tank', N'M15', N'S15', CAST(30.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 9, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (32, N'Silver Bullet', N'm19', N's18', CAST(88.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 18, CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (34, N'Stiletto', N'm19', N's19', CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 2, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (35, N'Ebony', N'm20', N's20', CAST(40.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), 7, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (36, N'Jet', N'Manufacture 1', N'Style 1', CAST(99.99 AS Decimal(10, 2)), CAST(199.99 AS Decimal(10, 2)), 18, CAST(13.00 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (37, N'Shotgun ', N'BeSpoked', NULL, CAST(999.99 AS Decimal(10, 2)), CAST(1299.99 AS Decimal(10, 2)), 18, CAST(5.50 AS Decimal(5, 2)))
INSERT [dbo].[product] ([pk_product], [name], [manufacturer], [style], [purchase_price], [sale_price], [available_qty], [commission_percentage]) VALUES (38, N'Blue Sky', N'Manu', NULL, CAST(299.99 AS Decimal(10, 2)), CAST(399.99 AS Decimal(10, 2)), 2, CAST(12.50 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[sales] ON 

INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (1, 1, 3, 12, CAST(N'2021-11-20' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (2, 18, 1, 8, CAST(N'2021-11-22' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (3, 24, 5, 5, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (4, 25, 2, 8, CAST(N'2021-09-30' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (5, 31, 1, 1, CAST(N'2021-10-07' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (6, 22, 5, 10, CAST(N'2021-11-03' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (7, 26, 1, 7, CAST(N'2021-11-11' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (8, 36, 6, 10, CAST(N'2021-11-04' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (9, 18, 2, 12, CAST(N'2021-07-08' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (10, 10, 1, 8, CAST(N'2021-07-08' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (11, 13, 7, 10, CAST(N'2021-05-06' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (12, 19, 4, 1, CAST(N'2021-04-09' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (13, 30, 9, 10, CAST(N'2021-03-19' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (14, 19, 3, 12, CAST(N'2021-02-26' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (15, 37, 3, 5, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (16, 24, 4, 1, CAST(N'2021-01-31' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (17, 19, 4, 1, CAST(N'2020-01-02' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (18, 32, 4, 10, CAST(N'2020-03-01' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (19, 37, 7, 12, CAST(N'2019-05-05' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (20, 25, 1, 5, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (21, 22, 1, 1, CAST(N'2018-02-02' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (22, 32, 2, 8, CAST(N'2020-08-08' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (23, 30, 3, 8, CAST(N'2020-12-12' AS Date))
INSERT [dbo].[sales] ([pk_sales], [fk_product], [fk_sales_person], [fk_customer], [sales_date]) VALUES (24, 38, 6, 12, CAST(N'2020-06-06' AS Date))
SET IDENTITY_INSERT [dbo].[sales] OFF
GO
SET IDENTITY_INSERT [dbo].[sales_person] ON 

INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (1, N'Hastik', N'Vaghasiya', NULL, N'1231231231', CAST(N'2021-11-20' AS Date), NULL, NULL, 1)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (2, N'John', N'Gibs', N'XYZ', N'9879879879', CAST(N'2021-11-20' AS Date), NULL, 1, 0)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (3, N'Rick', N'Kin', N'123 street xyz, 
Atlanta, 
Georgia', N'7778889999', CAST(N'2021-11-01' AS Date), NULL, 1, 1)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (4, N'Nick', N'Joy', NULL, N'6778876678', CAST(N'2021-11-10' AS Date), NULL, 3, 0)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (5, N'George', N'Goodman', N'123 peachtree road,
Atlanta,
GA', N'9999999999', CAST(N'2021-11-12' AS Date), NULL, 3, 1)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (6, N'Elizabeth', N'Joy', NULL, N'8765438765', CAST(N'2021-10-04' AS Date), NULL, 3, 0)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (7, N'Nancy', N'Nice', NULL, N'8987789767', CAST(N'2021-11-22' AS Date), NULL, 5, 0)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (8, N'Don', N'Hap', NULL, N'1188223399', CAST(N'2020-03-11' AS Date), NULL, 5, 0)
INSERT [dbo].[sales_person] ([pk_sales_person], [first_name], [last_name], [address], [phone], [start_date], [termination_date], [fk_manager], [is_manager]) VALUES (9, N'Jimmy', N'Red', NULL, N'2223332332', CAST(N'2021-02-03' AS Date), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[sales_person] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [product_name]    Script Date: 11/21/2021 7:05:26 PM ******/
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [product_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[discount]  WITH CHECK ADD FOREIGN KEY([fk_product])
REFERENCES [dbo].[product] ([pk_product])
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD FOREIGN KEY([fk_customer])
REFERENCES [dbo].[customer] ([pk_customer])
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD FOREIGN KEY([fk_product])
REFERENCES [dbo].[product] ([pk_product])
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD FOREIGN KEY([fk_sales_person])
REFERENCES [dbo].[sales_person] ([pk_sales_person])
GO
/****** Object:  StoredProcedure [dbo].[P_GenerateCommission_Report]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GenerateCommission_Report]
	@year INT,
	@quarter INT
AS
BEGIN
	SET NOCOUNT ON;
	
	--Quarterly total results variable
	DECLARE @total AS DECIMAL(20,2)
	
	--Calculate the commission per product
	SELECT p.pk_product,
	       CAST(
	           ((p.sale_price * p.commission_percentage) / 100) AS DECIMAL(10, 2)
	       ) AS commission INTO 
	       #temp_Product FROM dbo.product p
	
	--Calculate the total quarterly.
	SELECT @total = SUM(p.commission)
	FROM   dbo.sales s
	       JOIN dbo.#temp_product p
	            ON  p.pk_product = s.fk_product
	WHERE  YEAR(s.sales_date) = @year
	       AND DATEPART(q, s.sales_date) = @quarter
	
	--Calculate salespersons commision report quarterly.	
	SELECT CONCAT(sp.first_name, ' ', sp.last_name) AS [name],
	       SUM(p.commission) AS commission
	FROM   dbo.sales s
	       JOIN dbo.#temp_product p
	            ON  p.pk_product = s.fk_product
	       JOIN dbo.sales_person sp
	            ON  sp.pk_sales_person = s.fk_sales_person
	WHERE  YEAR(s.sales_date) = @year
	       AND DATEPART(q, s.sales_date) = @quarter
	GROUP BY
	       sp.first_name,
	       sp.last_name
	UNION ALL
	SELECT 'Total'  AS [name],
	       @total   AS commission WHERE @total > 0.00
	
	
	DROP TABLE #temp_Product
END
GO
/****** Object:  StoredProcedure [dbo].[P_Get_Manager_List]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_Get_Manager_List]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT sp.pk_sales_person AS id,
	       sp.first_name + ' ' + sp.last_name AS [name]
	FROM   dbo.sales_person sp
	WHERE sp.is_manager = 1
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetCustomer_List]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GetCustomer_List]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT c.pk_customer,
	       c.first_name,
	       c.last_name,
	       CONCAT(c.first_name, ' ', c.last_name) AS [name],
	       c.[address],
	       c.phone,
	       c.[start_date]
	FROM   dbo.customer c
	ORDER BY c.[start_date]
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetProduct_List]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GetProduct_List]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT p.pk_product,
	       p.[name],
	       p.manufacturer,
	       p.style,
	       p.purchase_price,
	       p.sale_price,
	       p.available_qty,
	       p.commission_percentage
	FROM   dbo.product p 
	ORDER BY p.[name]
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetSales_List]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GetSales_List]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT p.pk_product,
	       p.sale_price,
	       p.[name],
	       CAST(
	           ((p.sale_price * p.commission_percentage) / 100) AS DECIMAL(10, 2)
	       ) AS commission INTO 
	       #temp_Product FROM dbo.product p
	
	
	SELECT s.pk_sales,
	       p.[name]      AS product,
	       CONCAT(c.first_name, ' ', c.last_name) AS customer,
	       s.sales_date,
	       p.sale_price  AS price,
	       CONCAT(sp.first_name, ' ', sp.last_name) AS sales_person,
	       p.commission
	FROM   dbo.sales s
	       JOIN dbo.#temp_product p
	            ON  p.pk_product = s.fk_product
	       JOIN dbo.sales_person sp
	            ON  sp.pk_sales_person = s.fk_sales_person
	       JOIN dbo.customer c
	            ON  c.pk_customer = s.fk_customer
	
	DROP TABLE #temp_Product
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetSalesPersons_List]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GetSalesPersons_List]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT sp.pk_sales_person,
	       sp.first_name,
	       sp.last_name,
	       CONCAT(sp.first_name, ' ' , sp.last_name) AS [name],
	       sp.[address],
	       sp.phone,
	       sp.[start_date],
	       sp.termination_date,
	       CONCAT(mng.first_name, ' ', mng.last_name) AS manager,
	       (CASE WHEN sp.is_manager = 1 THEN 'Yes' ELSE 'No' END) AS is_manager
	FROM   dbo.sales_person sp
	       LEFT JOIN dbo.sales_person mng
	            ON  mng.pk_sales_person = sp.fk_manager
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetYear_from_Sales]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GetYear_from_Sales]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT YEAR(s.sales_date)  AS [year]
	FROM   dbo.sales              s
	GROUP BY
	       YEAR(s.sales_date)
	ORDER BY
	       [year] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[P_InsertProduct]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_InsertProduct]
	@name NVARCHAR(200),
	@manufacturer NVARCHAR(100),
	@style NVARCHAR(100),
	@purchase_price DECIMAL(10, 2),
	@sale_price DECIMAL(10, 2),
	@available_qty INT,
	@commission_percentage DECIMAL(5, 2)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO dbo.product
	  (
	    [name],
	    manufacturer,
	    style,
	    purchase_price,
	    sale_price,
	    available_qty,
	    commission_percentage
	  )
	VALUES
	  (
	    @name,
	    @manufacturer,
	    @style,
	    @purchase_price,
	    @sale_price,
	    @available_qty,
	    @commission_percentage
	  );
	
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[P_InsertSales]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_InsertSales]
	@fk_product INT,
	@fk_sales_person INT,
	@fk_customer INT,
	@start_date date
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO dbo.sales
	  (
	    -- pk_sales -- this column value is auto-generated
	    fk_product,
	    fk_sales_person,
	    fk_customer,
	    sales_date
	  )
	VALUES
	  (
	    @fk_product,
	    @fk_sales_person,
	    @fk_customer,
	    @start_date
	  )
	
	UPDATE dbo.product
	SET    available_qty     = available_qty - 1
	WHERE  pk_product        = @fk_product
END
GO
/****** Object:  StoredProcedure [dbo].[P_InsertSalesPerson]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_InsertSalesPerson]
	@first_name NVARCHAR(50),
	@last_name NVARCHAR(50),
	@address NVARCHAR(200),
	@phone VARCHAR(20),
	@start_date date,
	@termination_date date,
	@fk_manager INT,
	@is_manager TINYINT
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO dbo.sales_person
	  (
	    first_name,
	    last_name,
	    [address],
	    phone,
	    [start_date],
	    termination_date,
	    fk_manager,
	    is_manager
	  )
	VALUES
	  (
	    @first_name,
	    @last_name,
	    @address,
	    @phone,
	    @start_date,
	    @termination_date,
	    @fk_manager,
	    @is_manager
	  )
	
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[P_ProductName_Exists]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_ProductName_Exists]
	@name NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT CAST(CASE WHEN EXISTS(
	                         SELECT 1
	                         FROM   dbo.product p
	                         WHERE  p.[name] = @name
	                     ) THEN 1
	                ELSE 0
	           END 
	           AS BIT
	       )
END
GO
/****** Object:  StoredProcedure [dbo].[P_ProductSelectByPK]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_ProductSelectByPK]
	@pk_product INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT p.pk_product,
	       p.name,
	       p.manufacturer,
	       p.style,
	       p.purchase_price,
	       p.sale_price,
	       p.available_qty,
	       p.commission_percentage
	FROM   dbo.product p
	WHERE  p.pk_product = @pk_product
END
GO
/****** Object:  StoredProcedure [dbo].[P_ProductUpdate]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_ProductUpdate]
	@pk_product INT,
	@name NVARCHAR(200),
	@manufacturer NVARCHAR(100),
	@style NVARCHAR(100),
	@purchase_price DECIMAL(10, 2),
	@sale_price DECIMAL(10, 2),
	@available_qty INT,
	@commission_percentage DECIMAL(5, 2)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE dbo.[product]
	SET    [name]                    = @name,
	       manufacturer              = @manufacturer,
	       style                     = @style,
	       purchase_price            = @purchase_price,
	       sale_price                = @sale_price,
	       available_qty             = @available_qty,
	       commission_percentage     = @commission_percentage
	WHERE  pk_product                = @pk_product
END
GO
/****** Object:  StoredProcedure [dbo].[P_SalesPerson_Name_Exists]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_SalesPerson_Name_Exists]
	@first_name NVARCHAR(50),
	@last_name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT CAST(CASE WHEN EXISTS(
	                         SELECT 1
	                         FROM   dbo.sales_person sp
	                         WHERE  sp.first_name = @first_name
	                                AND sp.last_name = @last_name
	                     ) THEN 1
	                ELSE 0
	           END 
	           AS BIT
	       )
END
GO
/****** Object:  StoredProcedure [dbo].[P_SalesPersonSelectByPK]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_SalesPersonSelectByPK]
	@pk_sales_person INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT sp.pk_sales_person,
	       sp.first_name,
	       sp.last_name,
	       sp.[address],
	       sp.phone,
	       sp.[start_date],
	       sp.termination_date,
	       sp.fk_manager,
	       sp.is_manager
	FROM   dbo.sales_person sp
	WHERE  sp.pk_sales_person = @pk_sales_person
END
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateSalesPerson]    Script Date: 11/21/2021 7:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_UpdateSalesPerson]
@pk_sales_person INT,
	@first_name NVARCHAR(50),
	@last_name NVARCHAR(50),
	@address NVARCHAR(200),
	@phone VARCHAR(20),
	@start_date date,
	@termination_date date,
	@fk_manager INT,
	@is_manager TINYINT
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE dbo.sales_person
	SET
		-- pk_sales_person -- this column value is auto-generated
		first_name = @first_name,
		last_name = @last_name,
		[address] = @address,
		phone = @phone,
		[start_date] = @start_date,
		termination_date = @termination_date,
		fk_manager = @fk_manager,
		is_manager = @is_manager
	WHERE pk_sales_person = @pk_sales_person
END
GO
USE [master]
GO
ALTER DATABASE [BeSpoked_Bikes] SET  READ_WRITE 
GO
