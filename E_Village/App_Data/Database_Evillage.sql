USE [master]
GO
/****** Object:  Database [E_Village]    Script Date: 09/10/2023 11:15:11 ******/
CREATE DATABASE [E_Village] ON  PRIMARY 
( NAME = N'E_Village', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\E_Village.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E_Village_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\E_Village_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E_Village] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_Village].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_Village] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [E_Village] SET ANSI_NULLS OFF
GO
ALTER DATABASE [E_Village] SET ANSI_PADDING OFF
GO
ALTER DATABASE [E_Village] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [E_Village] SET ARITHABORT OFF
GO
ALTER DATABASE [E_Village] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [E_Village] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [E_Village] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [E_Village] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [E_Village] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [E_Village] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [E_Village] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [E_Village] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [E_Village] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [E_Village] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [E_Village] SET  DISABLE_BROKER
GO
ALTER DATABASE [E_Village] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [E_Village] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [E_Village] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [E_Village] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [E_Village] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [E_Village] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [E_Village] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [E_Village] SET  READ_WRITE
GO
ALTER DATABASE [E_Village] SET RECOVERY SIMPLE
GO
ALTER DATABASE [E_Village] SET  MULTI_USER
GO
ALTER DATABASE [E_Village] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [E_Village] SET DB_CHAINING OFF
GO
USE [E_Village]
GO
/****** Object:  Table [dbo].[Table_Registration]    Script Date: 09/10/2023 11:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_Registration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Profile_Picture] [varchar](max) NULL,
	[Name] [varchar](50) NULL,
	[Father_Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Mobile] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[Confirm_Password] [varchar](50) NULL,
	[Registration_Date] [varchar](50) NULL,
 CONSTRAINT [PK_Table_Registration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Registration] ON
INSERT [dbo].[Table_Registration] ([ID], [Profile_Picture], [Name], [Father_Name], [DOB], [Address], [Mobile], [Email], [Password], [Confirm_Password], [Registration_Date]) VALUES (1, N'hanuman_ji.jpg', N'vikash kumar gupta', N'Ajay Gupta', N'2004-08-06', N'Mairwa', N'8226935738', N'Vikash@gmail.com', N'123456', N'123456', N'06-09-2023 18:34:15')
INSERT [dbo].[Table_Registration] ([ID], [Profile_Picture], [Name], [Father_Name], [DOB], [Address], [Mobile], [Email], [Password], [Confirm_Password], [Registration_Date]) VALUES (2, N'googlelogo_color_272x92dp.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'08-09-2023 09:33:27')
SET IDENTITY_INSERT [dbo].[Table_Registration] OFF
/****** Object:  Table [dbo].[Table_Login]    Script Date: 09/10/2023 11:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_Login](
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Table_Login] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Table_Login] ([Email], [Password]) VALUES (N'admin@gmail.com', N'abc')
/****** Object:  Table [dbo].[Table_Feedback]    Script Date: 09/10/2023 11:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Feedback] [varchar](500) NULL,
	[Feedback_Date] [varchar](50) NULL,
 CONSTRAINT [PK_Table_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Feedback] ON
INSERT [dbo].[Table_Feedback] ([ID], [Name], [Email], [Feedback], [Feedback_Date]) VALUES (1, N'vikash kumar gupta', N'Vikash@gmail.com', N'Muskaan jhuthi hai ...', N'06-09-2023 20:11:54')
SET IDENTITY_INSERT [dbo].[Table_Feedback] OFF
/****** Object:  Table [dbo].[Table_Contact]    Script Date: 09/10/2023 11:15:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Mobile] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Message] [varchar](500) NULL,
	[Contact_Date] [varchar](50) NULL,
 CONSTRAINT [PK_Table_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Table_Contact] ON
INSERT [dbo].[Table_Contact] ([ID], [Name], [Mobile], [Email], [Message], [Contact_Date]) VALUES (1, N'vikash', N'8226935738', N'Vikash@gmail.com', N'Jai Hanuman Ji', N'06-09-2023 18:32:53')
INSERT [dbo].[Table_Contact] ([ID], [Name], [Mobile], [Email], [Message], [Contact_Date]) VALUES (2, N'Dinesh', N'6207554454', N'Dinesh@gmail.com', N'Thanks !', N'06-09-2023 18:35:03')
INSERT [dbo].[Table_Contact] ([ID], [Name], [Mobile], [Email], [Message], [Contact_Date]) VALUES (3, N'radhe', N'9006996688', NULL, N'Hello', N'07-09-2023 17:18:26')
INSERT [dbo].[Table_Contact] ([ID], [Name], [Mobile], [Email], [Message], [Contact_Date]) VALUES (4, N'Ajay', N'1234567890', NULL, N'dost', N'08-09-2023 09:59:06')
INSERT [dbo].[Table_Contact] ([ID], [Name], [Mobile], [Email], [Message], [Contact_Date]) VALUES (5, N'Ajay', N'1234567890', NULL, N'dost', N'08-09-2023 10:17:53')
SET IDENTITY_INSERT [dbo].[Table_Contact] OFF
