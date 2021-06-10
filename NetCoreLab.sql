USE [master]
GO
/****** Object:  Database [NetCoreLab]    Script Date: 6/9/2021 8:57:32 PM ******/
CREATE DATABASE [NetCoreLab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetCoreLab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NetCoreLab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetCoreLab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NetCoreLab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NetCoreLab] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NetCoreLab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NetCoreLab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NetCoreLab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NetCoreLab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NetCoreLab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NetCoreLab] SET ARITHABORT OFF 
GO
ALTER DATABASE [NetCoreLab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NetCoreLab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NetCoreLab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NetCoreLab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NetCoreLab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NetCoreLab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NetCoreLab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NetCoreLab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NetCoreLab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NetCoreLab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NetCoreLab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NetCoreLab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NetCoreLab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NetCoreLab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NetCoreLab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NetCoreLab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NetCoreLab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NetCoreLab] SET RECOVERY FULL 
GO
ALTER DATABASE [NetCoreLab] SET  MULTI_USER 
GO
ALTER DATABASE [NetCoreLab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NetCoreLab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NetCoreLab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NetCoreLab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NetCoreLab] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NetCoreLab', N'ON'
GO
ALTER DATABASE [NetCoreLab] SET QUERY_STORE = OFF
GO
USE [NetCoreLab]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/9/2021 8:57:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 6/9/2021 8:57:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Year] [int] NULL,
	[Category] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Drama')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Comedy')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Action')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Fantasy')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Horror')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Mystery')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (7, N'Romance')
GO
INSERT [dbo].[Category] ([Id], [Title]) VALUES (8, N'Thriller')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [Year], [Category]) VALUES (2, N'The Truman Show', N'The Truman Show is a 1998 American psychological comedy-drama film[4] directed by Peter Weir, produced by Scott Rudin, Andrew Niccol, Edward S. Feldman, and Adam Schroeder, and written by Niccol.', 1998, 8)
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [Year], [Category]) VALUES (3, N'Amélie', N'Amélie (also known as Le Fabuleux Destin d''Amélie Poulain; French pronunciation: ?[l? fabylø dest?~ d?ameli pul?~]; English: The Fabulous Destiny of Amélie Poulain) is a French 2001 romantic comedy film directed by Jean-Pierre Jeunet.', 2001, 7)
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [Year], [Category]) VALUES (5, N'The Godfather ', N'The Godfather is a 1972 American crime film directed by Francis Ford Coppola, who co-wrote the screenplay with Mario Puzo, based on Puzo''s best-selling 1969 novel of the same name.', 1972, 8)
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [Year], [Category]) VALUES (7, N'Casablanca', N'The dialogue is so spare and cynical it has not grown old-fashioned. Much of the emotional effect of Casablanca is achieved by indirection; as we leave the theater, we are absolutely convinced that the only thing keeping the world from going crazy is tha', 1943, 1)
GO
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [NetCoreLab] SET  READ_WRITE 
GO
