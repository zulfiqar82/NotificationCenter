USE [master]
GO
/****** Object:  Database [NotificationCenter]    Script Date: 2021-06-22 12:39:54 ******/
CREATE DATABASE [NotificationCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NotificationCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NotificationCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NotificationCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NotificationCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NotificationCenter] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NotificationCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NotificationCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NotificationCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NotificationCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NotificationCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NotificationCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [NotificationCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NotificationCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NotificationCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NotificationCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NotificationCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NotificationCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NotificationCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NotificationCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NotificationCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NotificationCenter] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NotificationCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NotificationCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NotificationCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NotificationCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NotificationCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NotificationCenter] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NotificationCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NotificationCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [NotificationCenter] SET  MULTI_USER 
GO
ALTER DATABASE [NotificationCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NotificationCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NotificationCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NotificationCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NotificationCenter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NotificationCenter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NotificationCenter', N'ON'
GO
ALTER DATABASE [NotificationCenter] SET QUERY_STORE = OFF
GO
USE [NotificationCenter]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2021-06-22 12:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Number] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Market] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleNotifications]    Script Date: 2021-06-22 12:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[SendDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ScheduleNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 2021-06-22 12:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'ac63c400-d256-4383-8dc7-13a24b1f5680', N'Company 5', 1234567890, N' medium', N'Norway')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'24f986e6-fff9-4757-bbdd-15622ee83a8b', N'Company 6', 1222222222, N' small', N'Sweden')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'4431f968-b84a-423d-93c6-28275afe6231', N'Company 1', 1752145111, N' small', N'Denmark')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'2d45dec0-4538-4804-834e-2f0c0ffc94be', N'Company 7', 1532485248, N' small', N'Norway')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'68ecf2a2-59e5-4f6f-9636-42ab1114b97b', N'Company 2', 1548214452, N' medium', N'Denmark')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'c135570f-88e2-4a3c-987a-5b6be7d2bfb3', N'Company 3', 1239874560, N' large', N'Finland')
GO
INSERT [dbo].[Companies] ([Id], [Name], [Number], [Type], [Market]) VALUES (N'3af3fd56-378b-4590-9fce-9de79ee33ea4', N'Company 4', 1593587120, N' large', N'Sweden')
GO
/****** Object:  Index [IX_ScheduleNotifications_ScheduleId]    Script Date: 2021-06-22 12:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_ScheduleNotifications_ScheduleId] ON [dbo].[ScheduleNotifications]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedules_CompanyId]    Script Date: 2021-06-22 12:39:54 ******/
CREATE NONCLUSTERED INDEX [IX_Schedules_CompanyId] ON [dbo].[Schedules]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScheduleNotifications]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleNotifications_Schedules_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedules] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScheduleNotifications] CHECK CONSTRAINT [FK_ScheduleNotifications_Schedules_ScheduleId]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Companies_CompanyId]
GO
USE [master]
GO
ALTER DATABASE [NotificationCenter] SET  READ_WRITE 
GO
