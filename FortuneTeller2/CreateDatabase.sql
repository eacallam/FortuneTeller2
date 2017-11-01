USE [master]
GO
/****** Object:  Database [FortuneTellerMVC]    Script Date: 10/31/2017 8:48:00 PM ******/
CREATE DATABASE [FortuneTellerMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FortuneTellerMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FortuneTellerMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FortuneTellerMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FortuneTellerMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FortuneTellerMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FortuneTellerMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC] SET  MULTI_USER 
GO
ALTER DATABASE [FortuneTellerMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FortuneTellerMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FortuneTellerMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FortuneTellerMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FortuneTellerMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FortuneTellerMVC]
GO
/****** Object:  Table [dbo].[BirthMonths]    Script Date: 10/31/2017 8:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirthMonths](
	[BirthMonthID] [int] IDENTITY(1,1) NOT NULL,
	[BirthMonth] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_BirthMonths] PRIMARY KEY CLUSTERED 
(
	[BirthMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/31/2017 8:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[BirthMonthID] [int] NOT NULL,
	[FavoriteColorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[NumberOfSiblings] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavoriteColors]    Script Date: 10/31/2017 8:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteColors](
	[FavoriteColorID] [int] IDENTITY(1,1) NOT NULL,
	[FavoriteColor] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_FavoriteColors] PRIMARY KEY CLUSTERED 
(
	[FavoriteColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_BirthMonths] FOREIGN KEY([BirthMonthID])
REFERENCES [dbo].[BirthMonths] ([BirthMonthID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_BirthMonths]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_FavoriteColors] FOREIGN KEY([FavoriteColorID])
REFERENCES [dbo].[FavoriteColors] ([FavoriteColorID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_FavoriteColors]
GO
USE [master]
GO
ALTER DATABASE [FortuneTellerMVC] SET  READ_WRITE 
GO
