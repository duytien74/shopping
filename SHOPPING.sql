USE [master]
GO
/****** Object:  Database [SHOPPING]    Script Date: 05/03/23 8:57:14 PM ******/
CREATE DATABASE [SHOPPING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOPPING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\SHOPPING.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SHOPPING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\SHOPPING_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SHOPPING] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOPPING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOPPING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOPPING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOPPING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOPPING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOPPING] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOPPING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOPPING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOPPING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOPPING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOPPING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOPPING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOPPING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOPPING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOPPING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOPPING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SHOPPING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOPPING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOPPING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOPPING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOPPING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOPPING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOPPING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOPPING] SET RECOVERY FULL 
GO
ALTER DATABASE [SHOPPING] SET  MULTI_USER 
GO
ALTER DATABASE [SHOPPING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOPPING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOPPING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOPPING] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SHOPPING] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SHOPPING] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOPPING', N'ON'
GO
ALTER DATABASE [SHOPPING] SET QUERY_STORE = OFF
GO
USE [SHOPPING]
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[billID] [bigint] IDENTITY(1,1) NOT NULL,
	[billdate] [date] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[customerID] [varchar](50) NULL,
	[staffID] [varchar](50) NULL,
	[promotionID] [varchar](10) NULL,
	[statusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILLDETAIL]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILLDETAIL](
	[billID] [bigint] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[totalprice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[categoryID] [varchar](50) NOT NULL,
	[categoryName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[customerID] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[customerName] [nvarchar](250) NOT NULL,
	[gender] [bit] NOT NULL,
	[dateofbirth] [date] NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[addresss] [nvarchar](max) NOT NULL,
	[images] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANUFACTURER]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUFACTURER](
	[manufacturerID] [varchar](50) NOT NULL,
	[manufacturerName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[manufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[productID] [varchar](50) NOT NULL,
	[productName] [nvarchar](250) NOT NULL,
	[categoryID] [varchar](50) NOT NULL,
	[manufacturerID] [varchar](50) NOT NULL,
	[dateofstart] [date] NOT NULL,
	[price] [float] NOT NULL,
	[images] [nvarchar](259) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROMOTION]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOTION](
	[promotionID] [varchar](10) NOT NULL,
	[promotionName] [nvarchar](250) NOT NULL,
	[promotiondateofend] [date] NOT NULL,
	[discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFF]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFF](
	[staffID] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[staffName] [nvarchar](250) NOT NULL,
	[gender] [bit] NOT NULL,
	[dateofbirth] [date] NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[addresss] [nvarchar](max) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[images] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUSBILL]    Script Date: 05/03/23 8:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUSBILL](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BILL] ON 

INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (9, CAST(N'2022-06-07' AS Date), 11970000, N'TienPro', N'NV_Bao', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (10, CAST(N'2022-06-07' AS Date), 11970000, N'TienPro', N'NV_Bao', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (11, CAST(N'2022-06-07' AS Date), 8779000, N'TruongPro', N'NV_Bao', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (12, CAST(N'2022-06-07' AS Date), 3990000, N'TruongPro', N'NV_Teo', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (13, CAST(N'2022-06-07' AS Date), 2599000, N'TruongPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (14, CAST(N'2022-06-07' AS Date), 11278000, N'TienPro', N'NV_Teo', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (17, CAST(N'2022-06-07' AS Date), 3311700, N'TienPro', NULL, N'SHT2022_4', 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (18, CAST(N'2022-06-07' AS Date), 3311700, N'TienPro', N'NV_Huy', N'SHT2022_4', 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (19, CAST(N'2022-06-08' AS Date), 1817700, N'TienPro', N'NV_Bao', N'SHT2022_4', 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (20, CAST(N'2022-06-08' AS Date), 3990000, N'NgocYen', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (22, CAST(N'2022-06-09' AS Date), 2950000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (23, CAST(N'2022-06-09' AS Date), 3540000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (24, CAST(N'2022-06-09' AS Date), 63390000, N'TienPro', N'NV_Teo', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (25, CAST(N'2022-06-09' AS Date), 57800000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (26, CAST(N'2022-06-09' AS Date), 6570000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (27, CAST(N'2022-06-09' AS Date), 18193000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (28, CAST(N'2022-06-09' AS Date), 15960000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (29, CAST(N'2022-06-09' AS Date), 10950000, N'TienPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (30, CAST(N'2022-06-09' AS Date), 42197200, N'TienPro', NULL, N'SHT2022_4', 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (32, CAST(N'2022-08-23' AS Date), 21720000, N'HungPro', N'NV_Bao', NULL, 1)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (33, CAST(N'2022-08-23' AS Date), 2890000, N'HungPro', NULL, NULL, 0)
INSERT [dbo].[BILL] ([billID], [billdate], [totalPrice], [customerID], [staffID], [promotionID], [statusID]) VALUES (34, CAST(N'2022-08-23' AS Date), 2790000, N'HungPro', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BILL] OFF
GO
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (9, N'AK_12', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (9, N'AK_14', 2, 3990000, 7980000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (10, N'AK_12', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (10, N'AK_14', 2, 3990000, 7980000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (11, N'AK_1', 1, 2599000, 2599000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (11, N'AK_11', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (11, N'AK_16', 1, 2190000, 2190000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (12, N'AK_10', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (13, N'AK_1', 1, 2599000, 2599000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (14, N'AK_1', 2, 2599000, 5198000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (14, N'AK_12', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (14, N'AK_17', 1, 2090000, 2090000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (17, N'AK_10', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (18, N'AK_12', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (19, N'AK_16', 1, 2190000, 2190000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (20, N'AK_10', 1, 3990000, 3990000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (22, N'DU_1', 5, 590000, 2950000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (23, N'DU_1', 6, 590000, 3540000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (24, N'AK_23', 20, 2790000, 55800000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (24, N'DU_5', 10, 759000, 7590000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (25, N'CM_1', 20, 2890000, 57800000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (26, N'HX_5', 3, 2190000, 6570000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (27, N'AK_1', 7, 2599000, 18193000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (28, N'AK_10', 4, 3990000, 15960000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (29, N'AK_16', 5, 2190000, 10950000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (30, N'AK_10', 6, 3990000, 23940000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (30, N'AK_12', 5, 3990000, 19950000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (30, N'DU_10', 5, 1390000, 6950000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (32, N'AS_12', 1, 4380000, 4380000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (32, N'CM_1', 6, 2890000, 17340000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (33, N'CM_1', 1, 2890000, 2890000)
INSERT [dbo].[BILLDETAIL] ([billID], [productID], [quantity], [price], [totalprice]) VALUES (34, N'AK_23', 1, 2790000, 2790000)
GO
INSERT [dbo].[CATEGORY] ([categoryID], [categoryName]) VALUES (N'0', N'Bàn phím đa phương tiện')
INSERT [dbo].[CATEGORY] ([categoryID], [categoryName]) VALUES (N'1', N'Bàn phím cơ')
INSERT [dbo].[CATEGORY] ([categoryID], [categoryName]) VALUES (N'2', N'Bàn phím không dây')
INSERT [dbo].[CATEGORY] ([categoryID], [categoryName]) VALUES (N'3', N'Bàn phím USB')
GO
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'HungPro', N'123', N'Trần Phạm Phi Hùng', 1, CAST(N'2002-03-01' AS Date), N'0987543579', N'hung@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 13', N'hung.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'NgocYen', N'123', N'Lê Trần Ngọc Yên', 0, CAST(N'2002-08-04' AS Date), N'0942343242', N'ngocyen@gmail.com', N'phường 7, quận Gò Vấp, TP HCM', N'121823369_2835914183360763_4408187344853259977_o.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'NhaPro', N'123', N'Võ Thanh Nhã', 1, CAST(N'2002-01-15' AS Date), N'092345667', N'nha@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', N'nha.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'PhiPro', N'123', N'Lê Tấn Phi', 1, CAST(N'2002-02-20' AS Date), N'0967897654', N'phi@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', N'phi.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'TienDZ', N'123', N'Tiến Nguyễn', 0, CAST(N'2022-06-07' AS Date), N'0942343243', N'huynhkhacduy@gmail.com', N'123', N'n.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'TienPro', N'hightechshop123', N'Nguyễn Lê Duy Tiến', 1, CAST(N'2002-10-10' AS Date), N'0978454575', N'ritiennn@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 13', N'tien.jpg')
INSERT [dbo].[CUSTOMER] ([customerID], [pass], [customerName], [gender], [dateofbirth], [phone], [email], [addresss], [images]) VALUES (N'TruongPro', N'123', N'Phan Nguyễn Đăng Trường', 0, CAST(N'2002-01-01' AS Date), N'0998645675', N'truong@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 13', N'truong.jpg')
GO
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'0', N'Akko')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'1', N'Asus')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'2', N'Cooler Master')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'3', N'DareU')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'4', N'Ducky')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'5', N'FL-Esports')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'6', N'Glorious')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'7', N'HyperX')
INSERT [dbo].[MANUFACTURER] ([manufacturerID], [manufacturerName]) VALUES (N'8', N'IKBC')
GO
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_1', N'AKKO 3298S One Piece (Hotswap / RGB / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2022-01-01' AS Date), 2599000, N'AK_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_10', N'AKKO Designer Studio – MOD008 - Space Gray', N'2', N'0', CAST(N'2021-01-01' AS Date), 3990000, N'AK_10.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_11', N'AKKO Designer Studio – MOD008 - Sky Blue', N'2', N'0', CAST(N'2017-01-01' AS Date), 3990000, N'AK_11.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_12', N'AKKO Designer Studio – MOD008 - Pearl White', N'2', N'0', CAST(N'2018-01-01' AS Date), 3990000, N'AK_12.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_13', N'AKKO Designer Studio – MOD008 - Midnight Blue', N'2', N'0', CAST(N'2019-01-01' AS Date), 3990000, N'AK_13.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_14', N'AKKO Designer Studio – MOD008 - Classic Red', N'2', N'0', CAST(N'2022-01-01' AS Date), 3990000, N'AK_14.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_15', N'AKKO ACR Pro Alice Plus (RGB / Hotswap / AKKO CS Crystal / Gasket Mount)', N'2', N'0', CAST(N'2021-01-01' AS Date), 2890000, N'AK_15.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_16', N'AKKO 3084B Plus World Tour Tokyo R2 (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2020-01-01' AS Date), 2190000, N'AK_16.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_17', N'AKKO 3084B Plus Black Pink (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2019-01-01' AS Date), 2090000, N'AK_17.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_18', N'AKKO 3068B Multi-modes Prunus Lannesiana (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2019-01-01' AS Date), 1890000, N'AK_18.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_19', N'AKKO 3068B Multi-modes Black Gold (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2019-01-01' AS Date), 1890000, N'AK_19.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_2', N'AKKO 3098B Multi-modes Doll of the Princess (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly switch)', N'2', N'0', CAST(N'2022-01-01' AS Date), 2190000, N'AK_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_20', N'AKKO ACR75 (Hotswap / RGB / Foam tiêu âm / Gasket Mount)', N'2', N'0', CAST(N'2018-01-01' AS Date), 3990000, N'AK_20.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_21', N'AKKO 5108S Sailor Moon Crystal (RGB / Foam tiêu âm / AKKO CS Jelly Switch)', N'2', N'0', CAST(N'2019-01-01' AS Date), 2490000, N'AK_21.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_22', N'AKKO PC75B Plus Bluetooth 5.0 Blue on White', N'2', N'0', CAST(N'2021-01-01' AS Date), 2490000, N'AK_22.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_23', N'AKKO PC75B Plus Bluetooth 5.0 Year of Tiger', N'2', N'0', CAST(N'2022-01-01' AS Date), 2790000, N'AK_23.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_24', N'Akko 5087B Multi-modes Bluetooth 5.0 Dracula Castle', N'2', N'0', CAST(N'2020-01-01' AS Date), 2790000, N'AK_24.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_25', N'Akko 5087B Multi-modes Bluetooth 5.0 World Tour London', N'2', N'0', CAST(N'2022-01-01' AS Date), 2790000, N'AK_25.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_26', N'AKKO 3087 Silent (Akko switch)', N'2', N'0', CAST(N'2022-01-01' AS Date), 1290000, N'AK_26.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_27', N'AKKO 5108S Honkai Impact 3rd – Bronya Zaychik (Hotswap / RGB / Foam tiêu âm / AKKO CS Jelly Switch)', N'2', N'0', CAST(N'2019-01-01' AS Date), 2890000, N'AK_27.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_28', N'AKKO ACR64 White (Hotswap / RGB / Foam tiêu âm / Gasket Mount)', N'2', N'0', CAST(N'2021-01-01' AS Date), 1590000, N'AK_28.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_29', N'AKKO ACR64 Black (Hotswap / RGB / Foam tiêu âm / Gasket Mount)', N'2', N'0', CAST(N'2021-01-01' AS Date), 1590000, N'AK_29.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_3', N'AKKO 3098B Multi-modes 9009 (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly switch)', N'2', N'0', CAST(N'2021-01-01' AS Date), 2190000, N'AK_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_30', N'AKKO ACR61 Pink (Hotswap / RGB / AKKO CS sw Jelly Pink)', N'2', N'0', CAST(N'2020-01-01' AS Date), 2090000, N'AK_30.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_4', N'AKKO 3098B Multi-modes Black & Cyan (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly switch)', N'2', N'0', CAST(N'2019-01-01' AS Date), 2099000, N'AK_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_5', N'AKKO 3084B Plus Black & Gold (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', N'2', N'0', CAST(N'2018-01-01' AS Date), 2199000, N'AK_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_6', N'AKKO Designer Studio – MOD007v2 - Space Gray', N'2', N'0', CAST(N'2021-01-01' AS Date), 4290000, N'AK_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_7', N'AKKO Designer Studio – MOD007v2 - Sky Blue', N'2', N'0', CAST(N'2022-01-01' AS Date), 4290000, N'AK_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_8', N'AKKO Designer Studio – MOD007v2 - Pearl White', N'2', N'0', CAST(N'2022-01-01' AS Date), 4790000, N'AK_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AK_9', N'AKKO Designer Studio – MOD007v2 - Midnight Blue', N'2', N'0', CAST(N'2022-01-01' AS Date), 4290000, N'AK_9.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_1', N'Asus ROG Strix Scope NX TKL Moonlight White', N'1', N'1', CAST(N'2020-01-01' AS Date), 3090000, N'AS_1.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_10', N'Asus Strix Scope TKL DELUXE', N'1', N'1', CAST(N'2021-03-02' AS Date), 3000000, N'AS_10.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_11', N'Asus ROG Strix Scope PBT', N'1', N'1', CAST(N'2022-11-21' AS Date), 3210000, N'AS_11.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_12', N'ROG Strix Flare Pink Edition', N'1', N'1', CAST(N'2020-10-02' AS Date), 4380000, N'AS_12.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_13', N'Asus ROG Strix Scope RGB', N'1', N'1', CAST(N'2020-06-12' AS Date), 3890000, N'AS_13.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_14', N'Asus ROG Strix Flare', N'1', N'1', CAST(N'2022-07-13' AS Date), 3990000, N'AS_14.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_15', N'Asus ROG Claymore Core', N'1', N'1', CAST(N'2021-08-28' AS Date), 4000000, N'AS_15.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_16', N'Asus ROG Claymore', N'1', N'1', CAST(N'2021-02-03' AS Date), 2900000, N'AS_16.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_2', N'Asus ROG Strix Scope NX Deluxe', N'1', N'1', CAST(N'2021-06-22' AS Date), 2990000, N'AS_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_3', N'Asus ROG Strix Scope NX', N'1', N'1', CAST(N'2022-03-11' AS Date), 1890000, N'AS_3.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_4', N'Asus ROG Strix Scope TKL', N'1', N'1', CAST(N'2021-02-05' AS Date), 4590000, N'AS_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_5', N'Asus ROG Strix Scope', N'1', N'1', CAST(N'2022-06-10' AS Date), 5990000, N'AS_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_6', N'ASUS ROG Claymore II', N'1', N'1', CAST(N'2021-01-15' AS Date), 6390000, N'AS_6.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_7', N'Asus ROG Strix Scope TKL Gundam Edition', N'1', N'1', CAST(N'2020-09-18' AS Date), 7200000, N'AS_7.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_8', N'ASUS ROG Falchion Gaming Keyboard – 65%, Asus ROG NX switch, Wireless', N'1', N'1', CAST(N'2022-05-09' AS Date), 8090000, N'AS_8.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'AS_9', N'Asus ROG Strix Scope TKL Electro Punk', N'1', N'1', CAST(N'2022-04-05' AS Date), 9490000, N'AS_9.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_1', N'Cooler Master SK622 - Silver', N'1', N'2', CAST(N'2021-01-01' AS Date), 2890000, N'CM_1.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_2', N'Cooler Master SK622 - Space Gray', N'1', N'2', CAST(N'2022-01-01' AS Date), 2490000, N'CM_2.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_3', N'Cooler Master SK631 - Bluetooth', N'2', N'2', CAST(N'2022-01-01' AS Date), 3990000, N'CM_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_4', N'Cooler Master SK630 - White', N'1', N'2', CAST(N'2019-01-01' AS Date), 2590000, N'CM_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_5', N'Cooler Master MK730', N'3', N'2', CAST(N'2019-01-01' AS Date), 4290000, N'CM_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_6', N'Cooler Master SK630 - Black', N'3', N'2', CAST(N'2021-01-01' AS Date), 2590000, N'CM_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_7', N'Cooler Master SK621 Bluetooth - White', N'2', N'2', CAST(N'2020-01-01' AS Date), 2890000, N'CM_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'CM_8', N'Cooler Master SK621 Bluetooth - Black', N'2', N'2', CAST(N'2020-01-01' AS Date), 2490000, N'CM_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_1', N'Ducky ONE 2 Mini RGB', N'2', N'4', CAST(N'2022-01-01' AS Date), 1590000, N'DK_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_10', N'Ducky ONE 2 HORIZON - FULL SIZE', N'3', N'4', CAST(N'2022-01-01' AS Date), 3990000, N'DK_10.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_11', N'Ducky ONE PBT Dye - SUB White / Grey TKL', N'3', N'4', CAST(N'2022-01-01' AS Date), 1590000, N'DK_11.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_12', N'Ducky ONE PBT Dye - SUB White / Grey', N'3', N'4', CAST(N'2019-01-01' AS Date), 2890000, N'DK_12.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_13', N'Ducky Year Of The Rooster 2017 Limited Edition', N'3', N'4', CAST(N'2018-01-01' AS Date), 1590000, N'DK_13.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_14', N'Ducky Shine 6 Blue Coral Limited Edition', N'3', N'4', CAST(N'2022-01-01' AS Date), 3650000, N'DK_14.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_2', N'Ducky Shine 7 Gunmetal RGB', N'2', N'4', CAST(N'2021-01-01' AS Date), 3940000, N'DK_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_3', N'Ducky One PBT Rainbow', N'2', N'4', CAST(N'2022-01-01' AS Date), 3940000, N'DK_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_4', N'Ducky One Fullsize PBT White Pink', N'2', N'4', CAST(N'2022-01-01' AS Date), 2890000, N'DK_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_5', N'Ducky One Tenkeyless PBT White Pink', N'2', N'4', CAST(N'2021-01-01' AS Date), 1590000, N'DK_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_6', N'Ducky Year Of The Dog PBT 2018 Limited Edition', N'2', N'4', CAST(N'2018-01-01' AS Date), 3650000, N'DK_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_7', N'Ducky ONE 2 SKYLINE - TENKEYLESS', N'2', N'4', CAST(N'2019-01-01' AS Date), 2590000, N'DK_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_8', N'Ducky ONE 2 SKYLINE - FULL SIZE', N'2', N'4', CAST(N'2020-01-01' AS Date), 3590000, N'DK_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DK_9', N'Ducky ONE 2 HORIZON - TENKEYLESS', N'3', N'4', CAST(N'2021-01-01' AS Date), 2690000, N'DK_9.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_1', N'DareU EK807G BLACK', N'0', N'3', CAST(N'2022-01-01' AS Date), 590000, N'DU_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_10', N'DareU EK871', N'0', N'3', CAST(N'2022-01-01' AS Date), 1390000, N'DU_10.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_11', N'DareU EK861', N'0', N'3', CAST(N'2020-01-01' AS Date), 1390000, N'DU_11.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_12', N'DareU EK169', N'3', N'3', CAST(N'2019-01-01' AS Date), 590000, N'DU_12.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_13', N'DareU EK87s - Black', N'3', N'3', CAST(N'2022-01-01' AS Date), 1390000, N'DU_13.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_14', N'DareU LK135 chống nước', N'3', N'3', CAST(N'2020-01-01' AS Date), 1590000, N'DU_14.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_15', N'DareU CK526S', N'3', N'3', CAST(N'2021-01-01' AS Date), 690000, N'DU_15.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_16', N'DareU EK880', N'3', N'3', CAST(N'2021-01-01' AS Date), 490000, N'DU_16.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_17', N'DareU EK815 - 104 KEY', N'3', N'3', CAST(N'2022-01-01' AS Date), 690000, N'DU_17.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_18', N'DareU EK1280 RGB', N'3', N'3', CAST(N'2018-01-01' AS Date), 890000, N'DU_18.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_19', N'DareU LK150G', N'3', N'3', CAST(N'2019-01-01' AS Date), 490000, N'DU_19.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_2', N'DAREU EK87 - WHITE', N'0', N'3', CAST(N'2021-01-01' AS Date), 540000, N'DU_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_3', N'PBT DAREU A87 SUMMER', N'0', N'3', CAST(N'2021-01-01' AS Date), 590000, N'DU_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_4', N'DAREU EK1280s - Black', N'0', N'3', CAST(N'2019-01-01' AS Date), 690000, N'DU_4.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_5', N'DAREU EK1280s - Pink', N'0', N'3', CAST(N'2019-01-01' AS Date), 759000, N'DU_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_6', N'DAREU EK87 - Pink', N'1', N'3', CAST(N'2018-01-01' AS Date), 649000, N'DU_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_7', N'DAREU EK87 - Black', N'1', N'3', CAST(N'2018-01-01' AS Date), 490000, N'DU_7.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_8', N'DAREU EK810 - Black', N'1', N'3', CAST(N'2020-01-01' AS Date), 690000, N'DU_8.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'DU_9', N'DAREU EK810 - Queen', N'1', N'3', CAST(N'2022-01-01' AS Date), 690000, N'DU_9.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_1', N'FL Esport CMK98 SAM Metal Heart Bluetooth + Wireless', N'2', N'5', CAST(N'2022-01-01' AS Date), 3990000, N'FLE_1.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_10', N'FL-Esports CMK87 Yellow&White', N'0', N'5', CAST(N'2019-01-01' AS Date), 3290000, N'FLE_10.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_11', N'FL-Esports CMK87 Ice Mint 3 Mode Wireless ( Type C, Bluetooth, 2.4G )', N'0', N'5', CAST(N'2019-01-01' AS Date), 3290000, N'FLE_11.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_12', N'FL-Esports CMK87 SAM Polar Night Black 3 Mode Wireless ( Type C, Bluetooth, 2.4G )', N'0', N'5', CAST(N'2019-01-01' AS Date), 3290000, N'FLE_12.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_13', N'FL-Esports F11G Pro Aqua Green (USB/2.4Ghz/Bluetooth)', N'0', N'5', CAST(N'2018-01-01' AS Date), 1890000, N'FLE_13.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_14', N'FL-Esports F11G Pro Polar Night (USB/2.4Ghz/Bluetooth)', N'0', N'5', CAST(N'2018-01-01' AS Date), 1890000, N'FLE_14.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_15', N'FL-Esports F12 RGB Black Ovilian (USB/2.4Ghz/Bluetooth)', N'3', N'5', CAST(N'2018-01-01' AS Date), 1939000, N'FLE_15.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_16', N'FL-Esports F12 RGB Cool Mint (USB/2.4Ghz/Bluetooth)', N'3', N'5', CAST(N'2022-01-01' AS Date), 1939000, N'FLE_16.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_17', N'FL-Esports F12 RGB White and Black (USB/2.4Ghz/Bluetooth)', N'3', N'5', CAST(N'2020-01-01' AS Date), 1939000, N'FLE_17.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_18', N'FL-Esports FL MK870 Transparent Blue', N'3', N'5', CAST(N'2020-01-01' AS Date), 959000, N'FLE_18.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_19', N'FL-Esports FL MK870 Transparent Pink', N'3', N'5', CAST(N'2020-01-01' AS Date), 959000, N'FLE_19.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_2', N'FL Esport CMK98 SA - Graphite Green', N'2', N'5', CAST(N'2021-01-01' AS Date), 3590000, N'FLE_2.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_20', N'FL-Esports FL MK870 Transparent White', N'3', N'5', CAST(N'2021-01-01' AS Date), 959000, N'FLE_20.jpg')
GO
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_21', N'FL-Esports FL MK870 Transparent Black', N'3', N'5', CAST(N'2021-01-01' AS Date), 959000, N'FLE_21.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_22', N'FL-Esports GP108CP Aqua Green', N'3', N'5', CAST(N'2021-01-01' AS Date), 2499000, N'FLE_22.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_23', N'FL-Esports FL680SAM Banana (USB/2.4Ghz/Bluetooth)', N'3', N'5', CAST(N'2022-01-01' AS Date), 2490000, N'FLE_23.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_24', N'FL-Esports FL680SAM Aqua Green (USB/2.4Ghz/Bluetooth)', N'3', N'5', CAST(N'2022-01-01' AS Date), 2490000, N'FLE_24.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_3', N'FL-Esports CMK98 SAM Marshmallow', N'2', N'5', CAST(N'2020-01-01' AS Date), 1590000, N'FLE_3.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_4', N'FL-Esports MK870 Transparent Black - 3 MODE', N'2', N'5', CAST(N'2020-01-01' AS Date), 1290000, N'FLE_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_5', N'FL-Esports MK870 White - 3 MODE', N'2', N'5', CAST(N'2021-01-01' AS Date), 1290000, N'FLE_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_6', N'FL-Esport CMK87 CPM Metal Heart', N'2', N'5', CAST(N'2021-01-01' AS Date), 3449000, N'FLE_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_7', N'FL-Esport Q75 Blue Haze', N'0', N'5', CAST(N'2022-01-01' AS Date), 3390000, N'FLE_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_8', N'FL-Esports MK870 White', N'0', N'5', CAST(N'2022-01-01' AS Date), 959000, N'FLE_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'FLE_9', N'FL-Esports FL680SAM Purple (USB/2.4Ghz/Bluetooth)', N'0', N'5', CAST(N'2019-01-01' AS Date), 2499000, N'FLE_9.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_1', N'Glorious GMMK 2 RGB 65% Black (Custom Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2022-01-01' AS Date), 2024000, N'GL_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_10', N'Glorious ABS Doubleshot Black - 104 phím', N'2', N'6', CAST(N'2022-01-01' AS Date), 5590000, N'GL_10.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_11', N'Glorious PRO PBT Black', N'2', N'6', CAST(N'2022-01-01' AS Date), 1550000, N'GL_11.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_12', N'Glorious PRO PBT White', N'2', N'6', CAST(N'2022-01-01' AS Date), 1550000, N'GL_12.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_13', N'Glorious PBT Nebula', N'2', N'6', CAST(N'2021-01-01' AS Date), 1550000, N'GL_13.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_14', N'Glorious PBT Caribbean Ocean', N'2', N'6', CAST(N'2019-01-01' AS Date), 1550000, N'GL_14.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_15', N'Glorious PBT Olive', N'2', N'6', CAST(N'2019-01-01' AS Date), 2290000, N'GL_15.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_16', N'Glorious PBT Rain Forest', N'3', N'6', CAST(N'2019-01-01' AS Date), 1290000, N'GL_16.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_17', N'Glorious Aura PBT Doubleshot Black - 104 phím', N'3', N'6', CAST(N'2018-01-01' AS Date), 3290000, N'GL_17.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_18', N'Glorious GMMK RGB Black Tenkeyless', N'3', N'6', CAST(N'2018-01-01' AS Date), 590000, N'GL_18.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_19', N'Glorious GMMK RGB White Ice Tenkeyless', N'3', N'6', CAST(N'2018-01-01' AS Date), 990000, N'GL_19.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_2', N'Glorious GMMK 2 RGB 65% White (Custom Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2020-01-01' AS Date), 2024000, N'GL_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_20', N'Glorious GMMK RGB Black Slate Fullsize', N'3', N'6', CAST(N'2018-01-01' AS Date), 390000, N'GL_20.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_21', N'Glorious GMMK RGB White Ice Fullsize', N'3', N'6', CAST(N'2021-01-01' AS Date), 290000, N'GL_21.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_22', N'Glorious GMMK RGB black slate compact', N'3', N'6', CAST(N'2021-01-01' AS Date), 990000, N'GL_22.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_23', N'Glorious GMMK RGB White Ice Compact', N'3', N'6', CAST(N'2021-01-01' AS Date), 890000, N'GL_23.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_24', N'Glorious GMMK PRO RGB White Ice', N'3', N'6', CAST(N'2020-01-01' AS Date), 1590000, N'GL_24.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_3', N'Glorious GMMK 2 RGB 65% Black (Pre-Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2020-01-01' AS Date), 3212000, N'GL_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_4', N'Glorious GMMK 2 RGB 65% White (Pre-Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2020-01-01' AS Date), 3212000, N'GL_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_5', N'Glorious GMMK 2 RGB Fullsize White (Custom Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2021-01-01' AS Date), 2024000, N'GL_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_6', N'Glorious GMMK 2 RGB Fullsize Black (Custom Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2021-01-01' AS Date), 2024000, N'GL_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_7', N'Glorious GMMK 2 RGB Fullsize White (Pre-Built / ANSI / Hot Swap)', N'1', N'6', CAST(N'2021-01-01' AS Date), 3212000, N'GL_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_8', N'Glorious GMMK 2 RGB Fullsize Black (Pre-Built / ANSI / Hot Swap)', N'2', N'6', CAST(N'2021-01-01' AS Date), 3212000, N'GL_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'GL_9', N'Glorious GMMK PRO RGB Black Slate', N'2', N'6', CAST(N'2022-01-01' AS Date), 8590000, N'GL_9.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'HX_1', N'HyperX Alloy Origins 65', N'1', N'7', CAST(N'2022-01-01' AS Date), 3590000, N'HX_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'HX_2', N'HyperX Alloy Origins 60', N'1', N'7', CAST(N'2021-01-01' AS Date), 2890000, N'HX_2.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'HX_3', N'HyperX Alloy Elite 2', N'1', N'7', CAST(N'2021-01-01' AS Date), 3290000, N'HX_3.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'HX_4', N'HyperX Alloy Origins Core', N'1', N'7', CAST(N'2022-01-01' AS Date), 1890000, N'HX_4.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'HX_5', N'HyperX Alloy Origins Origins', N'1', N'7', CAST(N'2020-01-01' AS Date), 2190000, N'HX_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_1', N'IKBC Goldiva - TKL', N'1', N'8', CAST(N'2020-01-01' AS Date), 2590000, N'IK_1.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_2', N'IKBC Gundam 2.0 - Fullsize', N'1', N'8', CAST(N'2022-01-01' AS Date), 1090000, N'IK_2.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_20', N'IKBC W200 Wireless', N'0', N'8', CAST(N'2022-01-01' AS Date), 1590000, N'IK_10.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_21', N'IKBC CD87 PBT Doubleshot v2', N'0', N'8', CAST(N'2021-01-01' AS Date), 3090000, N'IK_11.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_22', N'IKBC CD108 PBT Doubleshot v2', N'0', N'8', CAST(N'2021-01-01' AS Date), 3190000, N'IK_12.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_3', N'IKBC Gundam 1.0 - TKL', N'1', N'8', CAST(N'2022-01-01' AS Date), 1090000, N'IK_3.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_4', N'IKBC Gundam 1.0 - Fullsize', N'1', N'8', CAST(N'2021-01-01' AS Date), 2290000, N'IK_4.png')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_5', N'IKBC CD87 Vintage', N'1', N'8', CAST(N'2021-01-01' AS Date), 1390000, N'IK_5.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_6', N'IKBC CD108 Vintage', N'1', N'8', CAST(N'2019-01-01' AS Date), 2290000, N'IK_6.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_7', N'IKBC W210 Wireless - pink', N'0', N'8', CAST(N'2019-01-01' AS Date), 2290000, N'IK_7.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_8', N'IKBC W210 Wireless - white', N'0', N'8', CAST(N'2019-01-01' AS Date), 2290000, N'IK_8.jpg')
INSERT [dbo].[PRODUCT] ([productID], [productName], [categoryID], [manufacturerID], [dateofstart], [price], [images]) VALUES (N'IK_9', N'IKBC W210 Wireless - black', N'0', N'8', CAST(N'2020-01-01' AS Date), 2290000, N'IK_9.jpg')
GO
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_0', N'Khuyến mãi năm 2022 đợt thử', CAST(N'2022-05-07' AS Date), 0.25)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_1', N'Khuyến mãi năm 2022 đợt 1', CAST(N'2022-06-07' AS Date), 0.25)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_2', N'Khuyến mãi năm 2022 đợt 2', CAST(N'2022-10-07' AS Date), 0.09)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_3', N'Khuyến mãi năm 2022 đợt 3', CAST(N'2023-10-07' AS Date), 0.13)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_4', N'Khuyến mãi năm 2022 đợt 4', CAST(N'2024-06-07' AS Date), 0.17)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_5', N'Khuyến mãi năm 2022 đợt 5', CAST(N'2025-06-17' AS Date), 0.07)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_6', N'Khuyến mãi năm 2022 đợt 6', CAST(N'2026-10-07' AS Date), 0.08)
INSERT [dbo].[PROMOTION] ([promotionID], [promotionName], [promotiondateofend], [discount]) VALUES (N'SHT2022_7', N'Khuyến mãi năm 2022 đợt 7', CAST(N'2027-12-07' AS Date), 0.05)
GO
INSERT [dbo].[STAFF] ([staffID], [pass], [staffName], [gender], [dateofbirth], [phone], [email], [addresss], [isAdmin], [images]) VALUES (N'NV_Bao', N'123', N'Trương Gia Bảo', 0, CAST(N'1994-03-30' AS Date), N'0934543243', N'baonv@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', 1, N'54ddd22b2a0cdb52821d.jpg')
INSERT [dbo].[STAFF] ([staffID], [pass], [staffName], [gender], [dateofbirth], [phone], [email], [addresss], [isAdmin], [images]) VALUES (N'NV_Huy', N'123', N'Nguyễn Minh Huy', 1, CAST(N'1993-02-20' AS Date), N'0942345433', N'huynv@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', 0, N'huy_nv.jpg')
INSERT [dbo].[STAFF] ([staffID], [pass], [staffName], [gender], [dateofbirth], [phone], [email], [addresss], [isAdmin], [images]) VALUES (N'NV_Nhan', N'123', N'Nguyễn Thanh Nhân', 1, CAST(N'1997-10-10' AS Date), N'0976743243', N'nhannv@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', 0, N'nhan_nv.jpg')
INSERT [dbo].[STAFF] ([staffID], [pass], [staffName], [gender], [dateofbirth], [phone], [email], [addresss], [isAdmin], [images]) VALUES (N'NV_Teo', N'123', N'Nguyễn Văn Tèo', 1, CAST(N'1999-01-01' AS Date), N'0942343243', N'teonv@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', 1, N'teo_nv.jpg')
INSERT [dbo].[STAFF] ([staffID], [pass], [staffName], [gender], [dateofbirth], [phone], [email], [addresss], [isAdmin], [images]) VALUES (N'NV_Trung', N'123', N'Trần Lê Trung', 0, CAST(N'1992-01-15' AS Date), N'0942343789', N'trungnv@gmail.com', N'Tô ký,phường Trung Mỹ Tây, quận 12', 0, N'trung_nv.jpg')
GO
INSERT [dbo].[STATUSBILL] ([statusID], [statusName]) VALUES (0, N'Chờ xác nhận')
INSERT [dbo].[STATUSBILL] ([statusID], [statusName]) VALUES (1, N'Đã xác nhận')
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BL_CM] FOREIGN KEY([customerID])
REFERENCES [dbo].[CUSTOMER] ([customerID])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BL_CM]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BL_MM] FOREIGN KEY([promotionID])
REFERENCES [dbo].[PROMOTION] ([promotionID])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BL_MM]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BL_SF] FOREIGN KEY([staffID])
REFERENCES [dbo].[STAFF] ([staffID])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BL_SF]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BL_ST] FOREIGN KEY([statusID])
REFERENCES [dbo].[STATUSBILL] ([statusID])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BL_ST]
GO
ALTER TABLE [dbo].[BILLDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_BD_BL] FOREIGN KEY([billID])
REFERENCES [dbo].[BILL] ([billID])
GO
ALTER TABLE [dbo].[BILLDETAIL] CHECK CONSTRAINT [FK_BD_BL]
GO
ALTER TABLE [dbo].[BILLDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_BD_PR] FOREIGN KEY([productID])
REFERENCES [dbo].[PRODUCT] ([productID])
GO
ALTER TABLE [dbo].[BILLDETAIL] CHECK CONSTRAINT [FK_BD_PR]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PR_CG] FOREIGN KEY([categoryID])
REFERENCES [dbo].[CATEGORY] ([categoryID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PR_CG]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PR_MF] FOREIGN KEY([manufacturerID])
REFERENCES [dbo].[MANUFACTURER] ([manufacturerID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PR_MF]
GO
USE [master]
GO
ALTER DATABASE [SHOPPING] SET  READ_WRITE 
GO
