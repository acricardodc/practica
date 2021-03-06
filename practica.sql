USE [master]
GO
/****** Object:  Database [PROYECTO_CSHARP]    Script Date: 19/05/2018 13:00:55 ******/
CREATE DATABASE [PROYECTO_CSHARP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROYECTO_CSHARP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ACRICARDODC\MSSQL\DATA\PROYECTO_CSHARP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROYECTO_CSHARP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ACRICARDODC\MSSQL\DATA\PROYECTO_CSHARP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PROYECTO_CSHARP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTO_CSHARP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET RECOVERY FULL 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET  MULTI_USER 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROYECTO_CSHARP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROYECTO_CSHARP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PROYECTO_CSHARP', N'ON'
GO
ALTER DATABASE [PROYECTO_CSHARP] SET QUERY_STORE = OFF
GO
USE [PROYECTO_CSHARP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PROYECTO_CSHARP]
GO
/****** Object:  User [Ricardo]    Script Date: 19/05/2018 13:00:55 ******/
CREATE USER [Ricardo] FOR LOGIN [Ricardo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Ricardo]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Ricardo]
GO
/****** Object:  Table [dbo].[DISTRITOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITOS](
	[DISTRITO_ID] [varchar](7) NOT NULL,
	[NOMBRE_DISTRITO] [varchar](50) NULL,
	[PROVINCIAR_ID] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[DISTRITO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[EMPLEADO_ID] [int] IDENTITY(1,1) NOT NULL,
	[APELLIDOS] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](60) NOT NULL,
	[CEDULA] [char](5) NOT NULL,
	[GENERO] [varchar](40) NOT NULL,
	[ESTADO_CIVIL] [varchar](40) NOT NULL,
	[DIRECCION] [varchar](300) NOT NULL,
	[DISTRITO_ID] [varchar](7) NOT NULL,
	[ESTADO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EMPLEADO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAIS](
	[PAIS_ID] [varchar](7) NOT NULL,
	[NOMBRE_PAIS] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PAIS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[PROVINCIA_ID] [varchar](7) NOT NULL,
	[NOMBRE_PROVINCIA] [varchar](100) NULL,
	[PAIS_ID] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PROVINCIA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TELEFONOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TELEFONOS](
	[TELEFONO_ID] [int] IDENTITY(1,1) NOT NULL,
	[OPERADOR] [varchar](50) NOT NULL,
	[NUMERO] [varchar](9) NOT NULL,
	[EMPLEADO_ID] [int] NOT NULL,
	[ESTADO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TELEFONO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'001', N'SAN JOSE CENTRAL', N'001')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'002', N'CARTAGO CENTRAL', N'002')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'003', N'ALAJUELA CENTRAL', N'003')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'004', N'HEREDIA CENTRO', N'004')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'005', N'LIBERIA', N'005')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'006', N'CALDERA', N'006')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'007', N'TORTUGUERO', N'007')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'008', N'DAVID CENTRAL', N'008')
INSERT [dbo].[DISTRITOS] ([DISTRITO_ID], [NOMBRE_DISTRITO], [PROVINCIAR_ID]) VALUES (N'009', N'MANAGUA CENTRAL', N'009')
SET IDENTITY_INSERT [dbo].[EMPLEADOS] ON 

INSERT [dbo].[EMPLEADOS] ([EMPLEADO_ID], [APELLIDOS], [NOMBRE], [CEDULA], [GENERO], [ESTADO_CIVIL], [DIRECCION], [DISTRITO_ID], [ESTADO]) VALUES (1, N'Villalobos', N'Ricardo', N'40204', N'Masculino', N'Soltero', N'Mercedes norte', N'004', 1)
INSERT [dbo].[EMPLEADOS] ([EMPLEADO_ID], [APELLIDOS], [NOMBRE], [CEDULA], [GENERO], [ESTADO_CIVIL], [DIRECCION], [DISTRITO_ID], [ESTADO]) VALUES (2, N'PRUEBA', N'PRUEBA', N'88888', N'Masculino', N'Soltero(a)', N'Prueba', N'004', 1)
INSERT [dbo].[EMPLEADOS] ([EMPLEADO_ID], [APELLIDOS], [NOMBRE], [CEDULA], [GENERO], [ESTADO_CIVIL], [DIRECCION], [DISTRITO_ID], [ESTADO]) VALUES (3, N'TEST', N'TEST', N'44444', N'Femenino', N'Soltero(a)', N'test', N'001', 1)
INSERT [dbo].[EMPLEADOS] ([EMPLEADO_ID], [APELLIDOS], [NOMBRE], [CEDULA], [GENERO], [ESTADO_CIVIL], [DIRECCION], [DISTRITO_ID], [ESTADO]) VALUES (4, N'VARGAS', N'CARLOS', N'66666', N'Masculino', N'Soltero(a)', N'San joaquin', N'001', 1)
SET IDENTITY_INSERT [dbo].[EMPLEADOS] OFF
INSERT [dbo].[PAIS] ([PAIS_ID], [NOMBRE_PAIS]) VALUES (N'001', N'COSTA RICA')
INSERT [dbo].[PAIS] ([PAIS_ID], [NOMBRE_PAIS]) VALUES (N'002', N'PANAMA')
INSERT [dbo].[PAIS] ([PAIS_ID], [NOMBRE_PAIS]) VALUES (N'003', N'NICARAGUA')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'001', N'SAN JOSE', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'002', N'CARTAGO', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'003', N'ALAJUELA', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'004', N'HEREDIA', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'005', N'GUANACASTE', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'006', N'PUNTARENAS', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'007', N'LIMON', N'001')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'008', N'DAVID', N'002')
INSERT [dbo].[PROVINCIAS] ([PROVINCIA_ID], [NOMBRE_PROVINCIA], [PAIS_ID]) VALUES (N'009', N'MANAGUA', N'003')
SET IDENTITY_INSERT [dbo].[TELEFONOS] ON 

INSERT [dbo].[TELEFONOS] ([TELEFONO_ID], [OPERADOR], [NUMERO], [EMPLEADO_ID], [ESTADO]) VALUES (1, N'Kolbi', N'333333334', 3, 1)
INSERT [dbo].[TELEFONOS] ([TELEFONO_ID], [OPERADOR], [NUMERO], [EMPLEADO_ID], [ESTADO]) VALUES (2, N'Kolbi', N'444444444', 4, 1)
SET IDENTITY_INSERT [dbo].[TELEFONOS] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EMPLEADO__06BB8448AAAD4EDA]    Script Date: 19/05/2018 13:00:55 ******/
ALTER TABLE [dbo].[EMPLEADOS] ADD UNIQUE NONCLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TELEFONO__7500EDCBA5C29141]    Script Date: 19/05/2018 13:00:55 ******/
ALTER TABLE [dbo].[TELEFONOS] ADD UNIQUE NONCLUSTERED 
(
	[NUMERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('1') FOR [ESTADO]
GO
ALTER TABLE [dbo].[TELEFONOS] ADD  DEFAULT ('1') FOR [ESTADO]
GO
ALTER TABLE [dbo].[DISTRITOS]  WITH CHECK ADD  CONSTRAINT [FK_DISTRITOS_PROVINCIAS] FOREIGN KEY([PROVINCIAR_ID])
REFERENCES [dbo].[PROVINCIAS] ([PROVINCIA_ID])
GO
ALTER TABLE [dbo].[DISTRITOS] CHECK CONSTRAINT [FK_DISTRITOS_PROVINCIAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_EMPLEADOS_LIKE]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[SP_BUSCAR_EMPLEADOS_LIKE]
 @NOMBRE VARCHAR(60)
 AS
 BEGIN
 SELECT EMPLEADO_ID, APELLIDOS,
NOMBRE, CEDULA, GENERO, NOMBRE_DISTRITO
FROM EMPLEADOS E
INNER JOIN
DISTRITOS D ON E.DISTRITO_ID = D.DISTRITO_ID
WHERE NOMBRE LIKE '%'+@NOMBRE+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DISTRITOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[SP_LISTAR_DISTRITOS]
  @PROVINCIAR_ID VARCHAR(7)
  AS
  BEGIN
    SELECT * FROM DISTRITOS WHERE PROVINCIAR_ID = @PROVINCIAR_ID
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_EMPLEADOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LISTAR_EMPLEADOS]
AS
BEGIN
SELECT EMPLEADO_ID, APELLIDOS,
NOMBRE, CEDULA, GENERO, NOMBRE_DISTRITO
FROM EMPLEADOS E
INNER JOIN
DISTRITOS D ON E.DISTRITO_ID = D.DISTRITO_ID
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PAIS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_PAIS]
AS
BEGIN
    SELECT * FROM PAIS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PROVINCIAS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LISTAR_PROVINCIAS]
@PAIS_ID VARCHAR(7)
AS
BEGIN
  SELECT * FROM PROVINCIAS WHERE @PAIS_ID = @PAIS_ID
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_EMPLEADO]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRAR_EMPLEADO]
@APELLIDOS VARCHAR(100),
@NOMBRE VARCHAR(60),
@CEDULA CHAR(5),
@GENERO VARCHAR(30),
@ESTADO_CIVIL VARCHAR(30),
@DIRECCION VARCHAR(300),
@DISTRITO_ID VARCHAR(7),
@ULTIMO_ID INT OUTPUT
AS
BEGIN

 INSERT INTO EMPLEADOS(APELLIDOS,NOMBRE,CEDULA,GENERO,ESTADO_CIVIL,DIRECCION,DISTRITO_ID)
 VALUES (@APELLIDOS,@NOMBRE,@CEDULA,@GENERO,@ESTADO_CIVIL,@DIRECCION,@DISTRITO_ID)

 SET @ULTIMO_ID = SCOPE_IDENTITY()

 RETURN @ULTIMO_ID

END

GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TELEFONOS]    Script Date: 19/05/2018 13:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRAR_TELEFONOS]
@OPERADOR VARCHAR(50),
@NUMERO VARCHAR(9),
@EMPLEADO_ID INT
AS
BEGIN
INSERT INTO TELEFONOS
(OPERADOR, NUMERO, EMPLEADO_ID)
VALUES (@OPERADOR,@NUMERO,@EMPLEADO_ID)
END
GO
USE [master]
GO
ALTER DATABASE [PROYECTO_CSHARP] SET  READ_WRITE 
GO
