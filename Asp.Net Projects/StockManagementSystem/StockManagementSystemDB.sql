USE [master]
GO
/****** Object:  Database [StockManagementDB]    Script Date: 11/4/2019 1:13:46 AM ******/
CREATE DATABASE [StockManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockManagementDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/4/2019 1:13:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Catagory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/4/2019 1:13:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/4/2019 1:13:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ReorderLevel] [float] NOT NULL,
	[Available] [float] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 11/4/2019 1:13:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ItemDetails]    Script Date: 11/4/2019 1:13:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ItemDetails] as
select Item.Id as Id, Item.Name as Name, com.Name as CompanyName, cat.Name as CategoryName,
Item.Available as Available, Item.ReorderLevel as ReorderLevel from Item join Company as com on Item.CompanyId= com.Id
join Category as cat on Item.CategoryId=cat.Id 
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Stationary')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Kitchen Items')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Clothings')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'Unilever')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'RFL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Walton')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Nova')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'Matador')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (1, N'Ponds Lotion', 1, 2, 3, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (3, N'Fair & Handsome', 1, 2, 2, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (4, N'Sunsilk', 1, 2, 0, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (5, N'Primo RX3', 3, 3, 5, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (6, N'Matador Hi-School', 5, 1, 0, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (7, N'Matador Pin Point', 5, 1, 0, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (8, N'Matador Gripper Gel', 5, 1, 5, 10)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (1, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 4)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (2, CAST(0x55400B00 AS Date), 4, N'Sunsilk', 7)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (3, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 2)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (4, CAST(0x55400B00 AS Date), 4, N'Sunsilk', 30)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (5, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 15)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (6, CAST(0x55400B00 AS Date), 7, N'Matador Pin Point', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (7, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 0)
SET IDENTITY_INSERT [dbo].[Sales] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Catagory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Catagory]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Item]
GO
USE [master]
GO
ALTER DATABASE [StockManagementDB] SET  READ_WRITE 
GO
