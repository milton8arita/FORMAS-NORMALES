USE [master]
GO
/****** Object:  Database [Energia]    Script Date: 22/1/2023 21:48:29 ******/
CREATE DATABASE [Energia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Energia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERR\MSSQL\DATA\Energia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Energia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERR\MSSQL\DATA\Energia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Energia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Energia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Energia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Energia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Energia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Energia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Energia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Energia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Energia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Energia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Energia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Energia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Energia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Energia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Energia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Energia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Energia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Energia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Energia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Energia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Energia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Energia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Energia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Energia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Energia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Energia] SET  MULTI_USER 
GO
ALTER DATABASE [Energia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Energia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Energia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Energia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Energia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Energia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Energia] SET QUERY_STORE = OFF
GO
USE [Energia]
GO
/****** Object:  Table [dbo].[consumos]    Script Date: 22/1/2023 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consumos](
	[IdConsumos] [int] NOT NULL,
	[ClaseDeDia] [varchar](30) NULL,
	[P_Punta_TotalHoras] [int] NULL,
	[P_Punta_Horario] [varchar](30) NULL,
	[P_Intermedio_TotalHoras] [int] NULL,
	[P_Intermedio_Horario] [varchar](30) NULL,
	[P_Valle_TotalHoras] [int] NULL,
	[P_Valle_Horario] [varchar](30) NULL,
 CONSTRAINT [IdConsumos] PRIMARY KEY CLUSTERED 
(
	[IdConsumos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo_Intermedio]    Script Date: 22/1/2023 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_Intermedio](
	[id_Intermedio] [int] NOT NULL,
	[ClaseDeDia] [varchar](30) NULL,
	[TotalHoras] [int] NULL,
	[Horario_A] [varchar](30) NULL,
	[Horario_B] [varchar](30) NULL,
	[Horario_C] [varchar](30) NULL,
 CONSTRAINT [id_Intermedio] PRIMARY KEY CLUSTERED 
(
	[id_Intermedio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo_Punta]    Script Date: 22/1/2023 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_Punta](
	[id_punta] [int] NOT NULL,
	[ClaseDeDia] [varchar](30) NULL,
	[TotalHoras] [int] NULL,
	[Horario_A] [varchar](30) NULL,
	[Horario_B] [varchar](30) NULL,
 CONSTRAINT [id_punta] PRIMARY KEY CLUSTERED 
(
	[id_punta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo_Valle]    Script Date: 22/1/2023 21:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_Valle](
	[id_Valle] [int] NOT NULL,
	[ClaseDeDia] [varchar](30) NULL,
	[TotalHoras] [int] NULL,
	[Horario_A] [varchar](30) NULL,
	[Horario_B] [varchar](30) NULL,
	[Horario_C] [varchar](30) NULL,
 CONSTRAINT [id_Valle] PRIMARY KEY CLUSTERED 
(
	[id_Valle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[consumos] ([IdConsumos], [ClaseDeDia], [P_Punta_TotalHoras], [P_Punta_Horario], [P_Intermedio_TotalHoras], [P_Intermedio_Horario], [P_Valle_TotalHoras], [P_Valle_Horario]) VALUES (1, N'Laborable', 10, N'10 a 16 / 18 a 22', 9, N'5 a 10 / 16 a 18 / 22 a 24', 5, N'0 a 5')
INSERT [dbo].[consumos] ([IdConsumos], [ClaseDeDia], [P_Punta_TotalHoras], [P_Punta_Horario], [P_Intermedio_TotalHoras], [P_Intermedio_Horario], [P_Valle_TotalHoras], [P_Valle_Horario]) VALUES (2, N'Sabado', 2, N'12 a 13 / 19 a 20', 16, N'6 a 12 / 13 a 19 / 20 a 24', 6, N'0 a 6')
INSERT [dbo].[consumos] ([IdConsumos], [ClaseDeDia], [P_Punta_TotalHoras], [P_Punta_Horario], [P_Intermedio_TotalHoras], [P_Intermedio_Horario], [P_Valle_TotalHoras], [P_Valle_Horario]) VALUES (3, N'Domingo o Feriado', 0, N'', 8, N'11 a 13 / 17 a 23', 16, N'0 a 11 / 13 a 17 / 23 a 24')
GO
INSERT [dbo].[Periodo_Intermedio] ([id_Intermedio], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (1, N'Laborable', 9, N'5 a 10', N'16 a 18', N'22 a 24')
INSERT [dbo].[Periodo_Intermedio] ([id_Intermedio], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (2, N'Sabado', 16, N'6 a 12', N'13 a 19', N'20 a 24')
INSERT [dbo].[Periodo_Intermedio] ([id_Intermedio], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (3, N'Domingo o Feriado', 8, N'11 a 13', N'17 a 23', N'')
GO
INSERT [dbo].[Periodo_Punta] ([id_punta], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B]) VALUES (1, N'Laborable', 10, N'10 a 16', N'18 a 22')
INSERT [dbo].[Periodo_Punta] ([id_punta], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B]) VALUES (2, N'Sabado', 2, N'12 a 13', N'19 a 20')
INSERT [dbo].[Periodo_Punta] ([id_punta], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B]) VALUES (3, N'Domingo o Feriado', 0, N'', N'')
GO
INSERT [dbo].[Periodo_Valle] ([id_Valle], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (1, N'Laborable', 5, N'0 a 5', N'', N'')
INSERT [dbo].[Periodo_Valle] ([id_Valle], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (2, N'Sabado', 6, N'0 a 6', N'', N'')
INSERT [dbo].[Periodo_Valle] ([id_Valle], [ClaseDeDia], [TotalHoras], [Horario_A], [Horario_B], [Horario_C]) VALUES (3, N'Domingo o Feriado', 16, N'0 a 11', N'13 a 17', N'23 a 24')
GO
USE [master]
GO
ALTER DATABASE [Energia] SET  READ_WRITE 
GO
