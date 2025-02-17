USE [master]
GO
/****** Object:  Database [ClubData]    Script Date: 05/02/2025 17:45:32 ******/
CREATE DATABASE [ClubData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClubData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClubData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClubData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClubData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClubData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClubData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClubData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClubData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClubData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClubData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClubData] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClubData] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClubData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClubData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClubData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClubData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClubData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClubData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClubData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClubData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClubData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClubData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClubData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClubData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClubData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClubData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClubData] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ClubData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClubData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClubData] SET  MULTI_USER 
GO
ALTER DATABASE [ClubData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClubData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClubData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClubData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClubData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClubData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClubData] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClubData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClubData]
GO
/****** Object:  User [Kal]    Script Date: 05/02/2025 17:45:32 ******/
CREATE USER [Kal] FOR LOGIN [Kal] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Kal]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Kal]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Kal]
GO
/****** Object:  Table [dbo].[Deporte]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deporte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreDeporte] [nvarchar](50) NOT NULL,
	[precio] [int] NOT NULL,
	[horainicio] [nvarchar](50) NOT NULL,
	[horaFin] [nvarchar](50) NOT NULL,
	[imageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK__Deporte__3213E83F0061B2D2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreLocalidad] [nvarchar](50) NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[oProvinciaId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membresia]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membresia](
	[oUsuarioId] [int] NOT NULL,
	[oTipo_MembresiaId] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[fechaVencimiento] [date] NULL,
 CONSTRAINT [PK__Membresi__3213E83F5E19788A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membresia_Deporte]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membresia_Deporte](
	[oMembresiaId] [int] NOT NULL,
	[oDeporteId] [int] NOT NULL,
 CONSTRAINT [PK_Membresia_Deporte] PRIMARY KEY CLUSTERED 
(
	[oDeporteId] ASC,
	[oMembresiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[oMembresiaId] [int] NOT NULL,
	[precioTotal] [int] NOT NULL,
	[fechaPago] [datetime] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreProvincia] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcionrol] [nvarchar](max) NOT NULL,
	[fechacreacionrol] [datetime] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Membresia]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Membresia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[precioMembresia] [int] NOT NULL,
	[beneficios] [nvarchar](1000) NULL,
	[requisitos] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Tipo_Mem__3213E83FB24C807C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/02/2025 17:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[oRolId] [int] NOT NULL,
	[oLocalidadId] [int] NOT NULL,
	[nombreCompleto] [nvarchar](50) NOT NULL,
	[dni] [nvarchar](50) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Deporte] ON 

INSERT [dbo].[Deporte] ([id], [nombreDeporte], [precio], [horainicio], [horaFin], [imageUrl]) VALUES (1, N'Futbol', 5000, N'Ene  1 1900 10:00AM', N'Ene  1 1900 12:00PM', N'https://plus.unsplash.com/premium_photo-1676901712467-3d6be41dd17b?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
INSERT [dbo].[Deporte] ([id], [nombreDeporte], [precio], [horainicio], [horaFin], [imageUrl]) VALUES (3, N'Basquet', 1000, N'19:00', N'21:00', N'https://plus.unsplash.com/premium_photo-1667428818561-b6f5d09ef078?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
INSERT [dbo].[Deporte] ([id], [nombreDeporte], [precio], [horainicio], [horaFin], [imageUrl]) VALUES (8, N'Voley', 5000, N'19:00', N'21:00', N'https://plus.unsplash.com/premium_photo-1661351817037-6a21919bc9a0?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
SET IDENTITY_INSERT [dbo].[Deporte] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([id], [nombreLocalidad], [codigoPostal], [oProvinciaId]) VALUES (1, N'Rosario', 2000, 1)
INSERT [dbo].[Localidad] ([id], [nombreLocalidad], [codigoPostal], [oProvinciaId]) VALUES (5, N'Capitan Bermudez', 2020, 1)
INSERT [dbo].[Localidad] ([id], [nombreLocalidad], [codigoPostal], [oProvinciaId]) VALUES (6, N'resistencia', 3000, 2)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Membresia] ON 

INSERT [dbo].[Membresia] ([oUsuarioId], [oTipo_MembresiaId], [id], [fechaInicio], [fechaFin], [fechaVencimiento]) VALUES (1, 1, 1, CAST(N'2025-01-19' AS Date), CAST(N'2025-01-20' AS Date), CAST(N'2025-01-28' AS Date))
INSERT [dbo].[Membresia] ([oUsuarioId], [oTipo_MembresiaId], [id], [fechaInicio], [fechaFin], [fechaVencimiento]) VALUES (1, 1, 2, CAST(N'2024-12-31' AS Date), CAST(N'2025-01-19' AS Date), CAST(N'2025-01-29' AS Date))
INSERT [dbo].[Membresia] ([oUsuarioId], [oTipo_MembresiaId], [id], [fechaInicio], [fechaFin], [fechaVencimiento]) VALUES (6, 1, 3, CAST(N'2025-02-05' AS Date), CAST(N'2025-02-05' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[Membresia] ([oUsuarioId], [oTipo_MembresiaId], [id], [fechaInicio], [fechaFin], [fechaVencimiento]) VALUES (7, 6, 4, CAST(N'2025-02-05' AS Date), NULL, CAST(N'2025-03-07' AS Date))
SET IDENTITY_INSERT [dbo].[Membresia] OFF
GO
INSERT [dbo].[Membresia_Deporte] ([oMembresiaId], [oDeporteId]) VALUES (1, 1)
INSERT [dbo].[Membresia_Deporte] ([oMembresiaId], [oDeporteId]) VALUES (2, 1)
INSERT [dbo].[Membresia_Deporte] ([oMembresiaId], [oDeporteId]) VALUES (2, 3)
INSERT [dbo].[Membresia_Deporte] ([oMembresiaId], [oDeporteId]) VALUES (4, 8)
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id], [nombreProvincia]) VALUES (1, N'Santa Fe')
INSERT [dbo].[Provincia] ([id], [nombreProvincia]) VALUES (2, N'chaco')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([id], [descripcionrol], [fechacreacionrol]) VALUES (1, N'Usuario', CAST(N'2024-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rol] ([id], [descripcionrol], [fechacreacionrol]) VALUES (2, N'Usuario2', CAST(N'2025-02-05T12:14:04.900' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Membresia] ON 

INSERT [dbo].[Tipo_Membresia] ([id], [descripcion], [precioMembresia], [beneficios], [requisitos]) VALUES (1, N'Familiar', 50000, NULL, NULL)
INSERT [dbo].[Tipo_Membresia] ([id], [descripcion], [precioMembresia], [beneficios], [requisitos]) VALUES (6, N'Individual', 25000, N'', N'')
SET IDENTITY_INSERT [dbo].[Tipo_Membresia] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [email], [telefono], [direccion], [contraseña], [oRolId], [oLocalidadId], [nombreCompleto], [dni], [sexo], [fechaNacimiento]) VALUES (1, N'pepe@gmail.com', 123456789, N'garay 300', N'123456', 1, 1, N'Pepe Smith', N'45488999', N'M', CAST(N'2004-01-14' AS Date))
INSERT [dbo].[Usuario] ([id], [email], [telefono], [direccion], [contraseña], [oRolId], [oLocalidadId], [nombreCompleto], [dni], [sexo], [fechaNacimiento]) VALUES (2, N'manuel@gmail.com', 987654321, N'ayacucho 2000', N'abcdefg', 2, 5, N'Manuel Torres', N'45499877', N'M', CAST(N'2004-03-31' AS Date))
INSERT [dbo].[Usuario] ([id], [email], [telefono], [direccion], [contraseña], [oRolId], [oLocalidadId], [nombreCompleto], [dni], [sexo], [fechaNacimiento]) VALUES (6, N'jose@gmail.com', 2783201, N'Ayacucho 500', N'qwerty', 2, 1, N'Jose Smith', N'12345678', N'M', CAST(N'2003-02-01' AS Date))
INSERT [dbo].[Usuario] ([id], [email], [telefono], [direccion], [contraseña], [oRolId], [oLocalidadId], [nombreCompleto], [dni], [sexo], [fechaNacimiento]) VALUES (7, N'Eduardo@gmail.com', 27832001, N'Garay 200', N'asdfgh', 2, 1, N'Eduardo Londero', N'87654321', N'M', CAST(N'2003-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
/****** Object:  Index [IX_Usuario_oLocalidadId]    Script Date: 05/02/2025 17:45:32 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_oLocalidadId] ON [dbo].[Usuario]
(
	[oLocalidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario_oRolId]    Script Date: 05/02/2025 17:45:32 ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_oRolId] ON [dbo].[Usuario]
(
	[oRolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([oProvinciaId])
REFERENCES [dbo].[Provincia] ([id])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[Membresia]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Tipo_Membresia] FOREIGN KEY([oTipo_MembresiaId])
REFERENCES [dbo].[Tipo_Membresia] ([id])
GO
ALTER TABLE [dbo].[Membresia] CHECK CONSTRAINT [FK_Membresia_Tipo_Membresia]
GO
ALTER TABLE [dbo].[Membresia]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Usuario] FOREIGN KEY([oUsuarioId])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Membresia] CHECK CONSTRAINT [FK_Membresia_Usuario]
GO
ALTER TABLE [dbo].[Membresia_Deporte]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Deporte_Deporte] FOREIGN KEY([oDeporteId])
REFERENCES [dbo].[Deporte] ([id])
GO
ALTER TABLE [dbo].[Membresia_Deporte] CHECK CONSTRAINT [FK_Membresia_Deporte_Deporte]
GO
ALTER TABLE [dbo].[Membresia_Deporte]  WITH CHECK ADD  CONSTRAINT [FK_Membresia_Deporte_Membresia] FOREIGN KEY([oMembresiaId])
REFERENCES [dbo].[Membresia] ([id])
GO
ALTER TABLE [dbo].[Membresia_Deporte] CHECK CONSTRAINT [FK_Membresia_Deporte_Membresia]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Membresia] FOREIGN KEY([oMembresiaId])
REFERENCES [dbo].[Membresia] ([id])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Membresia]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Localidad] FOREIGN KEY([oLocalidadId])
REFERENCES [dbo].[Localidad] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Localidad]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol_oRolId] FOREIGN KEY([oRolId])
REFERENCES [dbo].[Rol] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol_oRolId]
GO
USE [master]
GO
ALTER DATABASE [ClubData] SET  READ_WRITE 
GO
