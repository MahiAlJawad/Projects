USE [master]
GO
/****** Object:  Database [StockManagementDB]    Script Date: 11/8/2019 12:22:22 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2019 12:22:22 AM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 11/8/2019 12:22:22 AM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 11/8/2019 12:22:22 AM ******/
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
/****** Object:  Table [dbo].[Sales]    Script Date: 11/8/2019 12:22:22 AM ******/
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
/****** Object:  Table [dbo].[UserLog]    Script Date: 11/8/2019 12:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/8/2019 12:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ItemDetails]    Script Date: 11/8/2019 12:22:22 AM ******/
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
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Clothing')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Chocolate')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Food')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Book')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Furniture')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Watch')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'Unilever')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'RFL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Walton')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Nova')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'Matador')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (6, N'Cadberry')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (7, N'Nestle')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (8, N'KFC')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (9, N'CP')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (10, N'Sharif Melamine')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (1, N'Ponds Lotion', 1, 2, 3, 10)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (3, N'Fair & Handsome', 1, 2, 2, 7)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (4, N'Sunsilk', 1, 2, 0, 7)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (5, N'Primo RX3', 3, 3, 5, 7)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (6, N'Matador Hi-School', 5, 1, 0, 3)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (7, N'Matador Pin Point', 5, 1, 0, 5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (8, N'Matador Gripper Gel', 5, 1, 5, 9)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (9, N'Dairy Milk Silk', 6, 6, 0, 24.5)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (10, N'Dairy Milk Bubble', 6, 6, 5, 19)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (11, N'Kitkat', 7, 6, 0, 40)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (12, N'Snickers', 7, 6, 5, 100)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (13, N'Chicken Balls', 8, 7, 0, 30)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (14, N'Broast Chicken', 9, 7, 0, 40)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (15, N'Matador Elegent', 5, 1, 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (16, N'Chair', 2, 9, 0, 4)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (17, N'Table', 2, 9, 5, 49)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (18, N'Nova A6', 4, 3, 0, 46)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (19, N'Blue Berry', 10, 4, 0, 50)
INSERT [dbo].[Item] ([Id], [Name], [CompanyId], [CategoryId], [ReorderLevel], [Available]) VALUES (20, N'Rongdhonu', 10, 4, 0, 50)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (1, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 4)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (2, CAST(0x55400B00 AS Date), 4, N'Sunsilk', 7)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (3, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 2)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (4, CAST(0x55400B00 AS Date), 4, N'Sunsilk', 30)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (5, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 15)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (6, CAST(0x55400B00 AS Date), 7, N'Matador Pin Point', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (7, CAST(0x55400B00 AS Date), 1, N'Ponds Lotion', 0)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (8, CAST(0x56400B00 AS Date), 11, N'Kitkat', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (9, CAST(0x56400B00 AS Date), 9, N'Dairy Milk Silk', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (10, CAST(0x56400B00 AS Date), 6, N'Matador Hi-School', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (11, CAST(0x56400B00 AS Date), 4, N'Sunsilk', 2)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (12, CAST(0x56400B00 AS Date), 4, N'Sunsilk', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (13, CAST(0x56400B00 AS Date), 11, N'Kitkat', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (14, CAST(0x57400B00 AS Date), 11, N'Kitkat', 4)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (15, CAST(0x57400B00 AS Date), 6, N'Matador Hi-School', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (16, CAST(0x57400B00 AS Date), 11, N'Kitkat', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (17, CAST(0x57400B00 AS Date), 10, N'Dairy Milk Bubble', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (18, CAST(0x57400B00 AS Date), 6, N'Matador Hi-School', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (19, CAST(0x57400B00 AS Date), 9, N'Dairy Milk Silk', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (20, CAST(0x57400B00 AS Date), 13, N'Chicken Balls', 20)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (21, CAST(0x57400B00 AS Date), 14, N'Broast Chicken', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (22, CAST(0x57400B00 AS Date), 5, N'Primo RX3', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (23, CAST(0x58400B00 AS Date), 10, N'Dairy Milk Bubble', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (24, CAST(0x58400B00 AS Date), 9, N'Dairy Milk Silk', 10)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (25, CAST(0x58400B00 AS Date), 10, N'Dairy Milk Bubble', 5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (26, CAST(0x58400B00 AS Date), 3, N'Fair & Handsome', 3)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (27, CAST(0x58400B00 AS Date), 8, N'Matador Gripper Gel', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (28, CAST(0x58400B00 AS Date), 9, N'Dairy Milk Silk', 10.5)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (29, CAST(0x58400B00 AS Date), 16, N'Chair', 6)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (30, CAST(0x58400B00 AS Date), 17, N'Table', 1)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (31, CAST(0x59400B00 AS Date), 18, N'Nova A6', 2)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (32, CAST(0x59400B00 AS Date), 5, N'Primo RX3', 2)
INSERT [dbo].[Sales] ([Id], [Date], [ItemId], [ItemName], [Quantity]) VALUES (33, CAST(0x59400B00 AS Date), 10, N'Dairy Milk Bubble', 1)
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[UserLog] ON 

INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (4, N'Mahi_Al_Jawad', CAST(0x0000AAFE00D4A635 AS DateTime), CAST(0x0000AAFE00D4CAEC AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (5, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E384A9 AS DateTime), NULL)
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (6, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E4C62A AS DateTime), CAST(0x0000AAFE00E4D810 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (7, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E4DDCF AS DateTime), NULL)
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (8, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E53185 AS DateTime), CAST(0x0000AAFE00E54E34 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (9, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E550F5 AS DateTime), CAST(0x0000AAFE00E57997 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (10, N'guest', CAST(0x0000AAFE00E59F98 AS DateTime), CAST(0x0000AAFE00E5BE49 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (11, N'Mahi_Al_Jawad', CAST(0x0000AAFE00E5C445 AS DateTime), CAST(0x0000AAFE00E5D2BE AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (12, N'Mahi_Al_Jawad', CAST(0x0000AAFE0160000A AS DateTime), CAST(0x0000AAFE01601B31 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (13, N'Mahi_Al_Jawad', CAST(0x0000AAFE0169CDC8 AS DateTime), CAST(0x0000AAFE0169F6A5 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (14, N'Mahi_Al_Jawad', CAST(0x0000AAFE016A0E31 AS DateTime), NULL)
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (15, N'Mahi_Al_Jawad', CAST(0x0000AAFE016A8BBB AS DateTime), CAST(0x0000AAFE016AE503 AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (16, N'guest', CAST(0x0000AAFE0178B306 AS DateTime), CAST(0x0000AAFE017C9DDD AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (17, N'Mahi_Al_Jawad', CAST(0x0000AAFE017D3E22 AS DateTime), CAST(0x0000AAFE017F2BAE AS DateTime))
INSERT [dbo].[UserLog] ([Id], [Username], [StartTime], [EndTime]) VALUES (18, N'guest', CAST(0x0000AAFE017FECDB AS DateTime), CAST(0x0000AAFE01853FDA AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLog] OFF
INSERT [dbo].[Users] ([Username], [Password]) VALUES (N'Mahi_Al_Jawad', N'12345')
INSERT [dbo].[Users] ([Username], [Password]) VALUES (N'guest', N'54321')
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
