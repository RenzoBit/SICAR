USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SICARSICRE')
	BEGIN
		ALTER DATABASE [SICARSICRE] SET single_user WITH ROLLBACK IMMEDIATE
		DROP DATABASE [SICARSICRE]
	END
GO
CREATE DATABASE [SICARSICRE]
GO
USE [SICARSICRE]
GO
CREATE TABLE [dbo].[ah_detallevehiculo](
	[iddetallevehiculo] [int] IDENTITY(1,1) NOT NULL,
	[idvehiculo] [int] NULL,
	[idpersona] [int] NULL,
	[estado] [char](1) NULL,
PRIMARY KEY
(
	[iddetallevehiculo] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_detvehiculo](
	[iddetvehiculo] [int] IDENTITY(1,1) NOT NULL,
	[idvehiculo] [int] NULL,
	[idtransportista] [int] NULL,
PRIMARY KEY
(
	[iddetvehiculo] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_dispositivo](
	[iddispositivo] [int] IDENTITY(1,1) NOT NULL,
	[mac] [char](17) NOT NULL,
PRIMARY KEY
(
	[iddispositivo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_marca](
	[idmarca] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY
(
	[idmarca] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[ruc] [varchar](50) NULL,
	[estado] [nchar](1) NULL,
PRIMARY KEY
(
	[idproveedor] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_tipovehiculo](
	[idtipovehiculo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [char](1) NULL,
PRIMARY KEY
(
	[idtipovehiculo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_ubicacion](
	[idubicacion] [int] IDENTITY(1,1) NOT NULL,
	[idviaje] [int] NOT NULL,
	[latitud] [varchar](20) NOT NULL,
	[longitud] [varchar](20) NOT NULL,
	[hora] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY
(
	[idubicacion] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](12) NOT NULL,
	[password] [char](32) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY
(
	[idusuario] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_usuarioviaje](
	[idusuario] [int] NOT NULL,
	[idviaje] [int] NOT NULL,
PRIMARY KEY
(
	[idusuario] ASC,
	[idviaje] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_vehiculo](
	[idvehiculo] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](50) NOT NULL,
	[idtipovehiculo] [int] NULL,
	[idproveedor] [int] NULL,
	[estado] [char](1) NULL,
	[idmarca] [int] NULL,
PRIMARY KEY
(
	[idvehiculo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ah_viaje](
	[idviaje] [int] IDENTITY(1,1) NOT NULL,
	[iddispositivo] [int] NOT NULL,
	[idvehiculo] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[horainicio] [datetime] NOT NULL DEFAULT (getdate()),
	[horafin] [datetime] NULL,
PRIMARY KEY
(
	[idviaje] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_carga](
	[idcarga] [int] IDENTITY(1,1) NOT NULL,
	[idcotizacion] [int] NULL,
	[idunidad] [int] NOT NULL,
	[idcargatipo] [int] NOT NULL,
	[ancho] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[largo] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[peso] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[volumen] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[profundidad] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[descripcion] [varchar](100) NULL,
	[monto] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[idorden] [int] NULL,
PRIMARY KEY
(
	[idcarga] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_cargatipo](
	[idcargatipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[costo] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY
(
	[idcargatipo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_cliente](
	[idpersona] [int] NOT NULL,
	[deuda] [bit] NOT NULL DEFAULT ((0)),
	[ruc] [char](11) NULL,
PRIMARY KEY
(
	[idpersona] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_cotizacion](
	[idcotizacion] [int] IDENTITY(1,1) NOT NULL,
	[idpersona] [int] NOT NULL,
	[idservicio] [int] NOT NULL,
	[idep] [char](2) NOT NULL,
	[ipro] [char](2) NOT NULL,
	[idis] [char](2) NOT NULL,
	[fdep] [char](2) NOT NULL,
	[fpro] [char](2) NOT NULL,
	[fdis] [char](2) NOT NULL,
	[numero] [char](10) NOT NULL,
	[fecha] [date] NOT NULL DEFAULT (getdate()),
	[idir] [varchar](200) NOT NULL,
	[fdir] [varchar](200) NOT NULL,
	[observacion] [varchar](200) NOT NULL,
	[bruto] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[neto] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[estado] [char](1) NOT NULL DEFAULT ('G'),
	[distancia] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY
(
	[idcotizacion] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_detalleplanot](
	[iddetalleplanot] [int] IDENTITY(1,1) NOT NULL,
	[idplanot] [int] NULL,
	[idorden] [int] NULL,
	[flgestado] [char](1) NULL,
	[idunidad] [int] NULL,
	[idcargatipo] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[estado] [char](1) NULL,
PRIMARY KEY
(
	[iddetalleplanot] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_distancia](
	[idep] [char](2) NOT NULL,
	[ipro] [char](2) NOT NULL,
	[idis] [char](2) NOT NULL,
	[fdep] [char](2) NOT NULL,
	[fpro] [char](2) NOT NULL,
	[fdis] [char](2) NOT NULL,
	[distancia] [int] NOT NULL,
PRIMARY KEY
(
	[idep] ASC,
	[ipro] ASC,
	[idis] ASC,
	[fdep] ASC,
	[fpro] ASC,
	[fdis] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_orden](
	[idorden] [int] IDENTITY(1,1) NOT NULL,
	[idpersona] [int] NULL,
	[numero] [char](10) NOT NULL,
	[fecha] [date] NOT NULL DEFAULT (getdate()),
	[idcotizacion] [int] NULL,
	[idcliente] [int] NOT NULL,
	[idservicio] [int] NOT NULL,
	[idep] [char](2) NOT NULL,
	[ipro] [char](2) NOT NULL,
	[idis] [char](2) NOT NULL,
	[fdep] [char](2) NOT NULL,
	[fpro] [char](2) NOT NULL,
	[fdis] [char](2) NOT NULL,
	[idir] [varchar](200) NOT NULL,
	[fdir] [varchar](200) NOT NULL,
	[observacion] [varchar](200) NOT NULL,
	[bruto] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[neto] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[estado] [char](1) NOT NULL DEFAULT ('G'),
	[distancia] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[cfecha] [date] NULL,
	[chora] [time](7) NULL,
	[cnombre] [varchar](100) NULL,
	[ccelular] [varchar](20) NULL,
	[cemail] [varchar](100) NULL,
PRIMARY KEY
(
	[idorden] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [char](10) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[correo] [varchar](100) NULL,
	[domicilio] [varchar](200) NULL,
PRIMARY KEY
(
	[idpersona] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_planot](
	[idplanot] [int] IDENTITY(1,1) NOT NULL,
	[idvehiculo] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[estado] [char](1) NULL,
	[idservicio] [int] NULL,
	[observacion] [varchar](200) NULL,
PRIMARY KEY
(
	[idplanot] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_servicio](
	[idservicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[costo] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY
(
	[idservicio] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_transportista](
	[idpersona] [int] NOT NULL,
	[tiempo] [int] NOT NULL DEFAULT ((120)),
PRIMARY KEY
(
	[idpersona] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_ubicacion](
	[idubicacion] [int] IDENTITY(1,1) NOT NULL,
	[idorden] [int] NOT NULL,
	[latitud] [varchar](20) NOT NULL,
	[longitud] [varchar](20) NOT NULL,
	[hora] [datetime] NOT NULL,
	[direccion] [varchar](200) NULL,
PRIMARY KEY
(
	[idubicacion] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_ubigeo](
	[dep] [char](2) NOT NULL,
	[pro] [char](2) NOT NULL,
	[dis] [char](2) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[latitud] [varchar](20) NULL,
	[longitud] [varchar](20) NULL,
PRIMARY KEY
(
	[dep] ASC,
	[pro] ASC,
	[dis] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_unidad](
	[idunidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY
(
	[idunidad] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[ca_vehiculotransporitsta](
	[idvehiculo] [int] NOT NULL,
	[idpersona] [nchar](10) NOT NULL,
PRIMARY KEY
(
	[idvehiculo] ASC,
	[idpersona] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[cr_analista](
	[idpersona] [int] NOT NULL,
	[autonomia] [decimal](18, 2) NOT NULL DEFAULT ((10000)),
PRIMARY KEY
(
	[idpersona] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_aprobacion](
	[idaprobacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
PRIMARY KEY
(
	[idaprobacion] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_calificacion](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[idcrediticio] [int] NOT NULL,
	[idperiodo] [int] NOT NULL,
	[deuda] [decimal](18, 2) NOT NULL,
	[entidad] [int] NOT NULL,
	[normal] [decimal](18, 2) NOT NULL,
	[problema] [decimal](18, 2) NOT NULL,
	[deficiente] [decimal](18, 2) NOT NULL,
	[dudoso] [decimal](18, 2) NOT NULL,
	[perdida] [decimal](18, 2) NOT NULL,
PRIMARY KEY
(
	[idcalificacion] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[cr_crediticio](
	[idcrediticio] [int] IDENTITY(1,1) NOT NULL,
	[idpersona] [int] NOT NULL,
	[fechacreacion] [date] NOT NULL,
PRIMARY KEY
(
	[idcrediticio] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_habilitacion](
	[idhabilitacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
PRIMARY KEY
(
	[idhabilitacion] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_motivo](
	[idmotivo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
PRIMARY KEY
(
	[idmotivo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_periodo](
	[idperiodo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [char](6) NOT NULL,
	[activo] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY
(
	[idperiodo] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[cr_solicitud](
	[idsolicitud] [int] IDENTITY(1,1) NOT NULL,
	[idimportador] [int] NOT NULL,
	[iddistribuidor] [int] NOT NULL,
	[idaprobacion] [int] NOT NULL,
	[idhabilitacion] [int] NOT NULL,
	[idmotivo] [int] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[fechacreacion] [date] NOT NULL,
	[fecharevision] [date] NULL,
	[observacionaprobacion] [varchar](200) NULL,
	[observacionhabilitacion] [varchar](200) NULL,
	[idanalista] [int] NOT NULL,
	[aprobado] [decimal](18, 2) NOT NULL,
	[garantizado] [decimal](18, 2) NOT NULL,
	[garantia] [bit] NOT NULL,
PRIMARY KEY
(
	[idsolicitud] ASC
)
)

GO

GO

GO

GO

GO
CREATE TABLE [dbo].[Itinerario](
	[idItinerario] [int] NOT NULL,
	[numero] [varchar](10) NULL,
	[idTransportista] [int] NULL,
	[rutaOptima] [varchar](50) NULL,
PRIMARY KEY
(
	[idItinerario] ASC
)
)

GO

GO

GO

GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY
(
	[UserId] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY
(
	[UserId] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY
(
	[Provider] ASC,
	[ProviderUserId] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY
(
	[RoleId] ASC
)
)

GO

GO

GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY
(
	[UserId] ASC,
	[RoleId] ASC
)
)

GO
SET IDENTITY_INSERT [dbo].[ah_detallevehiculo] ON 

INSERT [dbo].[ah_detallevehiculo] ([iddetallevehiculo], [idvehiculo], [idpersona], [estado]) VALUES (1, 8, 3, NULL)
INSERT [dbo].[ah_detallevehiculo] ([iddetallevehiculo], [idvehiculo], [idpersona], [estado]) VALUES (2, 9, 1, NULL)
SET IDENTITY_INSERT [dbo].[ah_detallevehiculo] OFF
SET IDENTITY_INSERT [dbo].[ah_dispositivo] ON 

INSERT [dbo].[ah_dispositivo] ([iddispositivo], [mac]) VALUES (2, N'00:00:00:00:00:00')
INSERT [dbo].[ah_dispositivo] ([iddispositivo], [mac]) VALUES (1, N'80:6C:1B:B7:72:FC')
SET IDENTITY_INSERT [dbo].[ah_dispositivo] OFF
SET IDENTITY_INSERT [dbo].[ah_marca] ON 

INSERT [dbo].[ah_marca] ([idmarca], [nombre]) VALUES (1, N'Toyota')
INSERT [dbo].[ah_marca] ([idmarca], [nombre]) VALUES (2, N'Nissan')
INSERT [dbo].[ah_marca] ([idmarca], [nombre]) VALUES (3, N'Hiunday')
INSERT [dbo].[ah_marca] ([idmarca], [nombre]) VALUES (4, N'Volkswagen')
SET IDENTITY_INSERT [dbo].[ah_marca] OFF
SET IDENTITY_INSERT [dbo].[ah_proveedor] ON 

INSERT [dbo].[ah_proveedor] ([idproveedor], [nombre], [ruc], [estado]) VALUES (1, N'Transportes Luansa', N'12345678911', N'A')
INSERT [dbo].[ah_proveedor] ([idproveedor], [nombre], [ruc], [estado]) VALUES (2, N'Transportes COISAC', N'12439566778', N'A')
INSERT [dbo].[ah_proveedor] ([idproveedor], [nombre], [ruc], [estado]) VALUES (3, N'El Chino sac', N'12321322221', N'A')
SET IDENTITY_INSERT [dbo].[ah_proveedor] OFF
SET IDENTITY_INSERT [dbo].[ah_tipovehiculo] ON 

INSERT [dbo].[ah_tipovehiculo] ([idtipovehiculo], [nombre], [estado]) VALUES (1, N'Trailer c/ Tolva', N'A')
INSERT [dbo].[ah_tipovehiculo] ([idtipovehiculo], [nombre], [estado]) VALUES (2, N'SemiTrailer c/ Tolva', N'A')
INSERT [dbo].[ah_tipovehiculo] ([idtipovehiculo], [nombre], [estado]) VALUES (3, N'Trailer s/ Tolva', N'A')
INSERT [dbo].[ah_tipovehiculo] ([idtipovehiculo], [nombre], [estado]) VALUES (4, N'SemiTrailer s/ Tolva', N'A')
SET IDENTITY_INSERT [dbo].[ah_tipovehiculo] OFF
SET IDENTITY_INSERT [dbo].[ah_ubicacion] ON 

INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (1, 2, N'-12.06770268', N'-76.97455147', CAST(N'2015-03-12 10:34:10.413' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (2, 3, N'-12.06781906', N'-76.97448954', CAST(N'2015-03-12 10:37:51.730' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (3, 3, N'-12.06778728', N'-76.97441961', CAST(N'2015-03-12 10:38:23.010' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (4, 3, N'-12.06766646', N'-76.97449533', CAST(N'2015-03-12 10:38:52.120' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (5, 4, N'-12.06028377', N'-76.97694314', CAST(N'2015-03-12 18:59:51.147' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (6, 4, N'-12.06032597', N'-76.97676358', CAST(N'2015-03-12 19:00:24.233' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (7, 4, N'-12.06033612', N'-76.97667617', CAST(N'2015-03-12 19:00:53.203' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (8, 4, N'-12.06031824', N'-76.9766821', CAST(N'2015-03-12 19:01:58.757' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (9, 4, N'-12.06029546', N'-76.97660878', CAST(N'2015-03-12 19:02:28.647' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (10, 4, N'-12.05957036', N'-76.97503219', CAST(N'2015-03-12 19:03:33.353' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (11, 4, N'-12.05903708', N'-76.97387765', CAST(N'2015-03-12 19:04:38.983' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (12, 4, N'-12.05825289', N'-76.97261705', CAST(N'2015-03-12 19:05:12.883' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (13, 4, N'-12.05742064', N'-76.97086705', CAST(N'2015-03-12 19:06:35.220' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (14, 4, N'-12.05731854', N'-76.97090561', CAST(N'2015-03-12 19:07:25.127' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (15, 4, N'-12.05692506', N'-76.97072863', CAST(N'2015-03-12 19:08:05.687' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (16, 4, N'-12.05693733', N'-76.97050501', CAST(N'2015-03-12 19:08:41.207' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (17, 4, N'-12.05637829', N'-76.9705464', CAST(N'2015-03-12 19:09:14.983' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (18, 4, N'-12.05653125', N'-76.97059254', CAST(N'2015-03-12 19:10:04.527' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (19, 4, N'-12.05611128', N'-76.97110998', CAST(N'2015-03-12 19:10:44.870' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (20, 4, N'-12.05680474', N'-76.97088579', CAST(N'2015-03-12 19:14:14.817' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (21, 5, N'-12.07725355', N'-77.08331709', CAST(N'2015-03-13 20:08:44.500' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (22, 5, N'-12.07810218', N'-77.08327308', CAST(N'2015-03-13 20:12:45.647' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (23, 5, N'-12.07798225', N'-77.08375639', CAST(N'2015-03-13 20:14:52.570' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (24, 5, N'-12.07823915', N'-77.0823014', CAST(N'2015-03-13 20:17:13.830' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (25, 5, N'-12.07913864', N'-77.07802174', CAST(N'2015-03-13 20:18:59.537' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (26, 5, N'-12.08309027', N'-77.06760699', CAST(N'2015-03-13 20:24:13.957' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (27, 5, N'-12.08911238', N'-77.05946876', CAST(N'2015-03-13 20:26:49.677' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (28, 5, N'-12.09257581', N'-77.05407811', CAST(N'2015-03-13 20:30:49.377' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (29, 5, N'-12.09400621', N'-77.04548649', CAST(N'2015-03-13 20:35:01.443' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (30, 5, N'-12.09319472', N'-77.03888896', CAST(N'2015-03-13 20:37:02.953' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (31, 5, N'-12.09271261', N'-77.03477674', CAST(N'2015-03-13 20:38:51.937' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (32, 5, N'-12.09188958', N'-77.03076141', CAST(N'2015-03-13 20:43:15.187' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (33, 5, N'-12.09125032', N'-77.02478894', CAST(N'2015-03-13 20:47:01.390' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (34, 5, N'-12.08896108', N'-77.00799084', CAST(N'2015-03-13 20:51:33.207' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (35, 5, N'-12.08891626', N'-77.00798739', CAST(N'2015-03-13 20:53:55.293' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (36, 5, N'-12.08875429', N'-77.00777476', CAST(N'2015-03-13 20:58:16.627' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (37, 6, N'-12.08917588', N'-77.00816936', CAST(N'2015-03-13 21:12:41.063' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (38, 6, N'-12.0888812', N'-77.00776983', CAST(N'2015-03-13 21:14:45.507' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (39, 6, N'-12.08590276', N'-77.00813752', CAST(N'2015-03-13 21:18:53.580' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (40, 6, N'-12.08476695', N'-77.00852976', CAST(N'2015-03-13 21:20:55.607' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (41, 6, N'-12.08428908', N'-77.00453406', CAST(N'2015-03-13 21:22:57.863' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (42, 6, N'-12.08360874', N'-77.00120037', CAST(N'2015-03-13 21:25:01.213' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (43, 6, N'-12.07915123', N'-76.99080238', CAST(N'2015-03-13 21:29:17.430' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (44, 6, N'-12.07277738', N'-76.99244234', CAST(N'2015-03-13 21:34:36.127' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (45, 6, N'-12.06607734', N'-76.97834518', CAST(N'2015-03-13 21:40:37.770' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (46, 6, N'-12.0674396', N'-76.97515034', CAST(N'2015-03-13 21:44:32.023' AS DateTime))
INSERT [dbo].[ah_ubicacion] ([idubicacion], [idviaje], [latitud], [longitud], [hora]) VALUES (47, 7, N'37.422005', N'-122.084095', CAST(N'2015-03-15 02:53:05.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[ah_ubicacion] OFF
SET IDENTITY_INSERT [dbo].[ah_usuario] ON 

INSERT [dbo].[ah_usuario] ([idusuario], [username], [password], [nombre]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'Administrador')
INSERT [dbo].[ah_usuario] ([idusuario], [username], [password], [nombre]) VALUES (2, N'cliente1', N'202cb962ac59075b964b07152d234b70', N'Cliente 1')
INSERT [dbo].[ah_usuario] ([idusuario], [username], [password], [nombre]) VALUES (3, N'cliente2', N'202cb962ac59075b964b07152d234b70', N'Cliente 2')
INSERT [dbo].[ah_usuario] ([idusuario], [username], [password], [nombre]) VALUES (4, N'cliente3', N'202cb962ac59075b964b07152d234b70', N'Cliente 3')
SET IDENTITY_INSERT [dbo].[ah_usuario] OFF
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 1)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 2)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 3)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 4)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 5)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 6)
INSERT [dbo].[ah_usuarioviaje] ([idusuario], [idviaje]) VALUES (1, 7)
SET IDENTITY_INSERT [dbo].[ah_vehiculo] ON 

INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (1, N'ABA-001', 1, 1, NULL, 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (2, N'BCB-002', 1, 2, NULL, 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (3, N'CDC-003', 1, 1, NULL, 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (4, N'DED-004', 1, 2, NULL, 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (5, N'cvsdv                                             ', 1, 2, N'A', 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (6, N'2832389                                           ', 1, 1, N'A', 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (7, N'w28218                                            ', 1, 2, N'A', 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (8, N'qw21218                                           ', 1, 2, N'A', 1)
INSERT [dbo].[ah_vehiculo] ([idvehiculo], [placa], [idtipovehiculo], [idproveedor], [estado], [idmarca]) VALUES (9, N'ppp001                                            ', 1, 1, N'A', 1)
SET IDENTITY_INSERT [dbo].[ah_vehiculo] OFF
SET IDENTITY_INSERT [dbo].[ah_viaje] ON 

INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (1, 1, 1, N'sssd60', CAST(N'2015-03-12 10:30:21.400' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (2, 1, 2, N'eeer30', CAST(N'2015-03-12 10:34:01.160' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (3, 1, 3, N'eeee30', CAST(N'2015-03-12 10:37:46.740' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (4, 1, 4, N'qqqq30', CAST(N'2015-03-12 18:58:59.820' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (5, 1, 2, N'yyyy120', CAST(N'2015-03-13 20:08:37.357' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (6, 1, 3, N'yyyy120', CAST(N'2015-03-13 21:12:32.173' AS DateTime), NULL)
INSERT [dbo].[ah_viaje] ([idviaje], [iddispositivo], [idvehiculo], [descripcion], [horainicio], [horafin]) VALUES (7, 2, 4, N'oooo30', CAST(N'2015-03-15 02:52:14.327' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ah_viaje] OFF
SET IDENTITY_INSERT [dbo].[ca_carga] ON 

INSERT [dbo].[ca_carga] ([idcarga], [idcotizacion], [idunidad], [idcargatipo], [ancho], [largo], [peso], [volumen], [profundidad], [descripcion], [monto], [idorden]) VALUES (2, 2, 1, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(13551.61 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ca_carga] ([idcarga], [idcotizacion], [idunidad], [idcargatipo], [ancho], [largo], [peso], [volumen], [profundidad], [descripcion], [monto], [idorden]) VALUES (3, 2, 2, 3, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(18068.82 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ca_carga] ([idcarga], [idcotizacion], [idunidad], [idcargatipo], [ancho], [largo], [peso], [volumen], [profundidad], [descripcion], [monto], [idorden]) VALUES (4, 3, 1, 3, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(132126.95 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ca_carga] ([idcarga], [idcotizacion], [idunidad], [idcargatipo], [ancho], [largo], [peso], [volumen], [profundidad], [descripcion], [monto], [idorden]) VALUES (5, 3, 2, 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(115611.08 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[ca_carga] OFF
SET IDENTITY_INSERT [dbo].[ca_cargatipo] ON 

INSERT [dbo].[ca_cargatipo] ([idcargatipo], [nombre], [costo]) VALUES (1, N'PELIGROSA', CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[ca_cargatipo] ([idcargatipo], [nombre], [costo]) VALUES (2, N'SECO', CAST(70.00 AS Decimal(18, 2)))
INSERT [dbo].[ca_cargatipo] ([idcargatipo], [nombre], [costo]) VALUES (3, N'PESADA', CAST(80.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ca_cargatipo] OFF
INSERT [dbo].[ca_cliente] ([idpersona], [deuda], [ruc]) VALUES (5, 0, N'15555555556')
INSERT [dbo].[ca_cliente] ([idpersona], [deuda], [ruc]) VALUES (6, 0, N'16666666667')
INSERT [dbo].[ca_cliente] ([idpersona], [deuda], [ruc]) VALUES (7, 0, N'17777777778')
INSERT [dbo].[ca_cliente] ([idpersona], [deuda], [ruc]) VALUES (8, 1, N'18888888889')
SET IDENTITY_INSERT [dbo].[ca_cotizacion] ON 

INSERT [dbo].[ca_cotizacion] ([idcotizacion], [idpersona], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [numero], [fecha], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia]) VALUES (2, 5, 1, N'01', N'03', N'06', N'14', N'02', N'03', N'0000000001', CAST(N'2015-03-25' AS Date), N'C', N'C', N'La fecha de vencimiento', CAST(31620.44 AS Decimal(18, 2)), CAST(31620.44 AS Decimal(18, 2)), N'G', CAST(225.86 AS Decimal(18, 2)))
INSERT [dbo].[ca_cotizacion] ([idcotizacion], [idpersona], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [numero], [fecha], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia]) VALUES (3, 7, 1, N'23', N'04', N'05', N'16', N'07', N'03', N'0000000002', CAST(N'2015-03-25' AS Date), N'G', N'G', N'La fecha de vencimiento', CAST(247738.03 AS Decimal(18, 2)), CAST(247738.03 AS Decimal(18, 2)), N'G', CAST(1651.58 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ca_cotizacion] OFF
SET IDENTITY_INSERT [dbo].[ca_detalleplanot] ON 

INSERT [dbo].[ca_detalleplanot] ([iddetalleplanot], [idplanot], [idorden], [flgestado], [idunidad], [idcargatipo], [descripcion], [estado]) VALUES (1, 2, 6, NULL, 3, 7, N'xxvcxvdsdsf ew', N'G')
INSERT [dbo].[ca_detalleplanot] ([iddetalleplanot], [idplanot], [idorden], [flgestado], [idunidad], [idcargatipo], [descripcion], [estado]) VALUES (2, 3, 4, NULL, 1, 5, N'peras', N'G')
SET IDENTITY_INSERT [dbo].[ca_detalleplanot] OFF
SET IDENTITY_INSERT [dbo].[ca_orden] ON 

INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (1, 1, N'0000000001', CAST(N'2015-03-01' AS Date), NULL, 5, 1, N'01', N'01', N'01', N'02', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-24' AS Date), CAST(N'23:22:00' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (2, 2, N'0000000002', CAST(N'2015-03-02' AS Date), NULL, 6, 2, N'03', N'01', N'01', N'04', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-25' AS Date), CAST(N'23:22:02' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (3, 3, N'0000000003', CAST(N'2015-03-03' AS Date), NULL, 7, 1, N'05', N'01', N'01', N'06', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-26' AS Date), CAST(N'23:22:06' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (4, 4, N'0000000004', CAST(N'2015-03-04' AS Date), NULL, 8, 2, N'07', N'01', N'01', N'08', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-27' AS Date), CAST(N'23:22:08' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (5, 1, N'0000000005', CAST(N'2015-03-12' AS Date), NULL, 5, 1, N'09', N'01', N'01', N'10', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-28' AS Date), CAST(N'23:22:10' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (6, 2, N'0000000006', CAST(N'2015-03-13' AS Date), NULL, 6, 2, N'11', N'01', N'01', N'12', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-29' AS Date), CAST(N'23:22:12' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (7, 3, N'0000000007', CAST(N'2015-03-13' AS Date), NULL, 7, 1, N'13', N'01', N'01', N'14', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-30' AS Date), CAST(N'23:22:14' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (8, 4, N'0000000008', CAST(N'2015-03-14' AS Date), NULL, 8, 2, N'15', N'01', N'01', N'16', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-03-31' AS Date), CAST(N'23:22:16' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (9, 1, N'0000000009', CAST(N'2015-03-14' AS Date), NULL, 5, 1, N'17', N'01', N'01', N'18', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-04-01' AS Date), CAST(N'23:22:20' AS Time), N'a', N's', N'd')
INSERT [dbo].[ca_orden] ([idorden], [idpersona], [numero], [fecha], [idcotizacion], [idcliente], [idservicio], [idep], [ipro], [idis], [fdep], [fpro], [fdis], [idir], [fdir], [observacion], [bruto], [neto], [estado], [distancia], [cfecha], [chora], [cnombre], [ccelular], [cemail]) VALUES (10, 2, N'0000000010', CAST(N'2015-03-14' AS Date), NULL, 6, 2, N'19', N'01', N'01', N'20', N'01', N'01', N'a', N'b', N'c', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'G', CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-04-02' AS Date), CAST(N'23:22:22' AS Time), N'a', N's', N'd')
SET IDENTITY_INSERT [dbo].[ca_orden] OFF
SET IDENTITY_INSERT [dbo].[ca_persona] ON 

INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (1, N'1111111111', N'Transportista 1', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (2, N'2222222222', N'Transportista 2', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (3, N'3333333333', N'Transportista 3', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (4, N'4444444444', N'Transportista 4', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (5, N'5555555555', N'Cliente 5', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (6, N'6666666666', N'Cliente 6', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (7, N'7777777777', N'Cliente 7', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (8, N'8888888888', N'Cliente 8', N'tegobijava@gmail.com', NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (9, N'9999999999', N'Analista 9', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (10, N'1010101010', N'Analista 10', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (11, N'1111111111', N'Analista 11', NULL, NULL)
INSERT [dbo].[ca_persona] ([idpersona], [codigo], [nombre], [correo], [domicilio]) VALUES (12, N'1212121212', N'Analista 12', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ca_persona] OFF
SET IDENTITY_INSERT [dbo].[ca_planot] ON 

INSERT [dbo].[ca_planot] ([idplanot], [idvehiculo], [fechaInicio], [fechaFin], [estado], [idservicio], [observacion]) VALUES (1, 2, CAST(N'2015-03-20' AS Date), CAST(N'2015-03-27' AS Date), N'G', 1, N' sdv')
INSERT [dbo].[ca_planot] ([idplanot], [idvehiculo], [fechaInicio], [fechaFin], [estado], [idservicio], [observacion]) VALUES (2, 4, CAST(N'2015-03-20' AS Date), CAST(N'2015-03-28' AS Date), N'G', 1, N' fdfs')
INSERT [dbo].[ca_planot] ([idplanot], [idvehiculo], [fechaInicio], [fechaFin], [estado], [idservicio], [observacion]) VALUES (3, 2, CAST(N'2015-03-21' AS Date), CAST(N'2015-03-24' AS Date), N'G', 1, N' dsfdsf')
INSERT [dbo].[ca_planot] ([idplanot], [idvehiculo], [fechaInicio], [fechaFin], [estado], [idservicio], [observacion]) VALUES (4, 1, CAST(N'2015-03-03' AS Date), CAST(N'2015-03-05' AS Date), N'G', 1, N' test')
SET IDENTITY_INSERT [dbo].[ca_planot] OFF
SET IDENTITY_INSERT [dbo].[ca_servicio] ON 

INSERT [dbo].[ca_servicio] ([idservicio], [nombre], [costo]) VALUES (1, N'STANDARD', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[ca_servicio] ([idservicio], [nombre], [costo]) VALUES (2, N'EXPRESS', CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ca_servicio] OFF
INSERT [dbo].[ca_transportista] ([idpersona], [tiempo]) VALUES (1, 120)
INSERT [dbo].[ca_transportista] ([idpersona], [tiempo]) VALUES (2, 120)
INSERT [dbo].[ca_transportista] ([idpersona], [tiempo]) VALUES (3, 120)
INSERT [dbo].[ca_transportista] ([idpersona], [tiempo]) VALUES (4, 120)
SET IDENTITY_INSERT [dbo].[ca_ubicacion] ON 

INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (1, 1, N'-15.873178', N'-72.9778', CAST(N'2015-03-01 12:19:09.000' AS DateTime), N'Cuno Cuno, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (2, 1, N'-14.388461', N'-75.0432', CAST(N'2015-03-01 14:19:50.000' AS DateTime), N'Carretera a Ocaña, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (3, 1, N'-11.023767', N'-77.1746', CAST(N'2015-03-01 15:20:19.000' AS DateTime), N'18, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (4, 1, N'-9.488685', N'-78.25128', CAST(N'2015-03-01 16:20:50.000' AS DateTime), N'14A, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (5, 2, N'-12.336314', N'-76.5593', CAST(N'2015-03-02 12:21:40.000' AS DateTime), N'721, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (6, 2, N'-12.314848', N'-75.9221', CAST(N'2015-03-02 13:22:11.000' AS DateTime), N'Carretera Cañete Yauyos, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (7, 2, N'-11.713092', N'-75.0872', CAST(N'2015-03-13 15:22:31.000' AS DateTime), N'Calle, Comas, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (8, 2, N'-10.159845', N'-75.4827', CAST(N'2015-03-13 18:22:58.000' AS DateTime), N'PE 5NA, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (9, 3, N'-10.159845', N'-75.4827', CAST(N'2015-03-03 13:23:34.000' AS DateTime), N'PE 5NA, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (10, 3, N'-9.315265', N'-77.94367', CAST(N'2015-03-13 14:24:01.000' AS DateTime), N'Yungay Province, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (11, 3, N'-4.364557', N'-77.39435', CAST(N'2015-03-03 15:24:30.000' AS DateTime), N'Datem del Marañón Province, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (12, 3, N'-3.772793', N'-73.30744', CAST(N'2015-03-13 16:24:53.000' AS DateTime), N'Calle las Flores, Iquitos, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (13, 4, N'-8.425170', N'-74.58185', CAST(N'2015-03-04 13:25:15.000' AS DateTime), N'Calle Dario Rodriguez Lopez, Pucallpa, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (14, 4, N'-13.022288', N'-74.2083', CAST(N'2015-03-04 14:25:42.000' AS DateTime), N'Carretera Huanta-Ayacucho, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (15, 4, N'-10.376052', N'-71.6375', CAST(N'2015-03-04 16:26:07.000' AS DateTime), N'Purús Province, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (16, 4, N'-12.100090', N'-71.6594', CAST(N'2015-03-04 17:26:31.000' AS DateTime), N'Manú Province, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (17, 5, N'-12.06028377', N'-76.97694314', CAST(N'2015-03-12 18:59:51.147' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (18, 5, N'-12.06032597', N'-76.97676358', CAST(N'2015-03-12 19:00:24.233' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (19, 5, N'-12.06033612', N'-76.97667617', CAST(N'2015-03-12 19:00:53.203' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (20, 5, N'-12.06031824', N'-76.9766821', CAST(N'2015-03-12 19:01:58.757' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (21, 5, N'-12.06029546', N'-76.97660878', CAST(N'2015-03-12 19:02:28.647' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (22, 5, N'-12.05957036', N'-76.97503219', CAST(N'2015-03-12 19:03:33.353' AS DateTime), N'Avenida Nicolás de Ayllón N°2648, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (23, 5, N'-12.05903708', N'-76.97387765', CAST(N'2015-03-12 19:04:38.983' AS DateTime), N'Carretera Central, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (24, 5, N'-12.05825289', N'-76.97261705', CAST(N'2015-03-12 19:05:12.883' AS DateTime), N'Carretera Central, Santa Anita 15023, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (25, 5, N'-12.05742064', N'-76.97086705', CAST(N'2015-03-12 19:06:35.220' AS DateTime), N'Carretera Central, Ate 15023, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (26, 5, N'-12.05731854', N'-76.97090561', CAST(N'2015-03-12 19:07:25.127' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (27, 5, N'-12.05692506', N'-76.97072863', CAST(N'2015-03-12 19:08:05.687' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (28, 5, N'-12.05693733', N'-76.97050501', CAST(N'2015-03-12 19:08:41.207' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (29, 5, N'-12.05637829', N'-76.9705464', CAST(N'2015-03-12 19:09:14.983' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (30, 5, N'-12.05653125', N'-76.97059254', CAST(N'2015-03-12 19:10:04.527' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (31, 5, N'-12.05611128', N'-76.97110998', CAST(N'2015-03-12 19:10:44.870' AS DateTime), N'Minería, Lima 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (32, 5, N'-12.05680474', N'-76.97088579', CAST(N'2015-03-12 19:14:14.817' AS DateTime), N'Carretera Central, Santa Anita 15008, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (33, 6, N'-12.07725355', N'-77.08331709', CAST(N'2015-03-13 20:08:44.500' AS DateTime), N'Avenida la Marina, Lima 15088, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (34, 6, N'-12.07810218', N'-77.08327308', CAST(N'2015-03-13 20:12:45.647' AS DateTime), N'Avenida la Marina, Lima 15088, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (35, 6, N'-12.07798225', N'-77.08375639', CAST(N'2015-03-13 20:14:52.570' AS DateTime), N'Avenida la Marina, San Miguel 15088, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (36, 6, N'-12.07823915', N'-77.0823014', CAST(N'2015-03-13 20:17:13.830' AS DateTime), N'Avenida la Marina, San Miguel 15087, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (37, 6, N'-12.07913864', N'-77.07802174', CAST(N'2015-03-13 20:18:59.537' AS DateTime), N'Avenida la Marina, Pueblo Libre 15084, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (38, 6, N'-12.08309027', N'-77.06760699', CAST(N'2015-03-13 20:24:13.957' AS DateTime), N'Avenida la Marina, Pueblo Libre 15086, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (39, 6, N'-12.08911238', N'-77.05946876', CAST(N'2015-03-13 20:26:49.677' AS DateTime), N'Avenida Pershing 210, Magdalena del Mar 15076, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (40, 6, N'-12.09257581', N'-77.05407811', CAST(N'2015-03-13 20:30:49.377' AS DateTime), N'Avenida Pershing 960, San Isidro 15076, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (41, 6, N'-12.09400621', N'-77.04548649', CAST(N'2015-03-13 20:35:01.443' AS DateTime), N'Avenida Javier Prado Oeste, Lima 15073, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (42, 6, N'-12.09319472', N'-77.03888896', CAST(N'2015-03-13 20:37:02.953' AS DateTime), N'Orrantia, San Isidro, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (43, 6, N'-12.09271261', N'-77.03477674', CAST(N'2015-03-13 20:38:51.937' AS DateTime), N'Avenida Javier Prado Oeste 440, San Isidro 15073, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (44, 6, N'-12.09188958', N'-77.03076141', CAST(N'2015-03-13 20:43:15.187' AS DateTime), N'Avenida Javier Prado Este, Lima 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (45, 6, N'-12.09125032', N'-77.02478894', CAST(N'2015-03-13 20:47:01.390' AS DateTime), N'Avenida Javier Prado Este 790, San Isidro 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (46, 6, N'-12.08896108', N'-77.00799084', CAST(N'2015-03-13 20:51:33.207' AS DateTime), N'Avenida Javier Prado Este 1692, San Isidro 15036, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (47, 6, N'-12.08891626', N'-77.00798739', CAST(N'2015-03-13 20:53:55.293' AS DateTime), N'Avenida Javier Prado Este 1692, San Isidro 15036, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (48, 6, N'-12.08875429', N'-77.00777476', CAST(N'2015-03-13 20:58:16.627' AS DateTime), N'Avenida Javier Prado Este 1692, San Isidro 15036, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (49, 7, N'-12.08917588', N'-77.00816936', CAST(N'2015-03-13 21:12:41.063' AS DateTime), N'Avenida Javier Prado Este 1692, San Isidro 15036, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (50, 7, N'-12.0888812', N'-77.00776983', CAST(N'2015-03-13 21:14:45.507' AS DateTime), N'Avenida Javier Prado Este 1692, San Isidro 15036, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (51, 7, N'-12.08590276', N'-77.00813752', CAST(N'2015-03-13 21:18:53.580' AS DateTime), N'Avenida Guardia Civil, San Borja 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (52, 7, N'-12.08476695', N'-77.00852976', CAST(N'2015-03-13 21:20:55.607' AS DateTime), N'Avenida Canadá, San Borja 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (53, 7, N'-12.08428908', N'-77.00453406', CAST(N'2015-03-13 21:22:57.863' AS DateTime), N'Avenida Canadá, Lima 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (54, 7, N'-12.08360874', N'-77.00120037', CAST(N'2015-03-13 21:25:01.213' AS DateTime), N'Avenida Canadá, Lima 15021, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (55, 7, N'-12.07915123', N'-76.99080238', CAST(N'2015-03-13 21:29:17.430' AS DateTime), N'Avenida Canadá 4036, San Luis 15021, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (56, 7, N'-12.07277738', N'-76.99244234', CAST(N'2015-03-13 21:34:36.127' AS DateTime), N'Mariscal Domingo Nieto, San Luis 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (57, 7, N'-12.06607734', N'-76.97834518', CAST(N'2015-03-13 21:40:37.770' AS DateTime), N'Luis Galvani, Lima 3, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (58, 7, N'-12.0674396', N'-76.97515034', CAST(N'2015-03-13 21:44:32.023' AS DateTime), N'Pasaje Damaso, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (59, 8, N'-12.06764389', N'-76.97458907', CAST(N'2015-03-15 04:24:33.110' AS DateTime), N'Pasaje Juan Sifuentes, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (60, 8, N'-12.06764802', N'-76.97442647', CAST(N'2015-03-15 04:26:05.463' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (61, 8, N'-12.06787218', N'-76.97453486', CAST(N'2015-03-15 04:27:02.980' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (62, 8, N'-12.06775098', N'-76.97444859', CAST(N'2015-03-15 12:20:00.160' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (63, 8, N'-12.06768458', N'-76.97446483', CAST(N'2015-03-15 14:04:24.627' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (64, 7, N'-12.06629998', N'-76.97587254', CAST(N'2015-03-15 15:23:37.340' AS DateTime), N'Calle Benjamín Franklin, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (65, 7, N'-12.06082658', N'-76.97817796', CAST(N'2015-03-15 15:25:36.963' AS DateTime), N'Avenida Nicolás de Ayllón 2309, El Agustino 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (66, 7, N'-12.06291478', N'-76.98186753', CAST(N'2015-03-15 15:27:42.093' AS DateTime), N'Avenida Nicolás de Ayllón 2309, El Agustino 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (67, 7, N'-12.06329812', N'-77.00157586', CAST(N'2015-03-15 15:33:32.940' AS DateTime), N'Avenida Nicolás de Ayllón 1179, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (68, 7, N'-12.05557294', N'-77.01281788', CAST(N'2015-03-15 15:36:12.390' AS DateTime), N'Avenida Nicolás de Ayllón, Lima 15018, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (69, 7, N'-12.05801539', N'-77.02158697', CAST(N'2015-03-15 15:39:50.697' AS DateTime), N'Via Expresa Grau, La Victoria, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (70, 7, N'-12.05964083', N'-77.03473149', CAST(N'2015-03-15 15:41:57.123' AS DateTime), N'Via Expresa Grau, Lima 15001, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (71, 7, N'-12.06007569', N'-77.0374396', CAST(N'2015-03-15 15:45:39.737' AS DateTime), N'Paseo Colon 125, Lima 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (72, 9, N'-12.05998163', N'-77.03741908', CAST(N'2015-03-15 19:19:22.467' AS DateTime), N'Paseo Colon 125, Lima 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (73, 9, N'-12.05917482', N'-77.03058856', CAST(N'2015-03-15 19:21:28.063' AS DateTime), N'Via Expresa Grau, La Victoria 15033, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (74, 9, N'-12.05892583', N'-77.02961523', CAST(N'2015-03-15 19:23:35.237' AS DateTime), N'Avenida Miguel Grau, Lima 15001, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (75, 9, N'-12.05857464', N'-77.02657264', CAST(N'2015-03-15 19:25:45.590' AS DateTime), N'Via Expresa Grau, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (76, 9, N'-12.05738764', N'-77.01705389', CAST(N'2015-03-15 19:29:27.423' AS DateTime), N'Grau, Lima, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (77, 9, N'-12.05931075', N'-77.00815195', CAST(N'2015-03-15 19:33:41.583' AS DateTime), N'Avenida Nicolás de Ayllón, Lima, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (78, 9, N'-12.06374461', N'-76.99984225', CAST(N'2015-03-15 19:35:58.753' AS DateTime), N'Avenida Circunvalación, La Victoria 15019, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (79, 9, N'-12.07239281', N'-76.98854716', CAST(N'2015-03-15 19:41:24.783' AS DateTime), N'De Las Torres, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (80, 9, N'-12.07143832', N'-76.98124583', CAST(N'2015-03-15 19:43:31.643' AS DateTime), N'Santa Rosa, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (81, 9, N'-12.06994443', N'-76.97579719', CAST(N'2015-03-15 19:45:35.523' AS DateTime), N'Separadora Industrial, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (82, 9, N'-12.06756611', N'-76.9746059', CAST(N'2015-03-15 19:49:28.997' AS DateTime), N'Pasaje Juan Sifuentes, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (83, 10, N'-12.0677449', N'-76.97452539', CAST(N'2015-03-16 15:09:40.560' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (84, 10, N'-12.06769682', N'-76.97483487', CAST(N'2015-03-16 15:11:48.483' AS DateTime), N'Pasaje Juan Sifuentes, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (85, 10, N'-12.06616198', N'-76.97605986', CAST(N'2015-03-16 15:16:12.017' AS DateTime), N'Michael Faraday, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (86, 10, N'-12.07059203', N'-76.97910543', CAST(N'2015-03-16 15:20:12.897' AS DateTime), N'Rio De Janeiro, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (87, 10, N'-12.0749934', N'-76.98116137', CAST(N'2015-03-16 15:23:59.927' AS DateTime), N'Condorcanqui, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (88, 10, N'-12.077608', N'-76.98054418', CAST(N'2015-03-16 15:26:00.127' AS DateTime), N'Paz Soldan, Lima 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (89, 10, N'-12.0800446', N'-76.9868448', CAST(N'2015-03-16 15:29:49.323' AS DateTime), N'Sabilas, Ate 15022, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (90, 10, N'-12.08340382', N'-77.00004183', CAST(N'2015-03-16 15:35:39.017' AS DateTime), N'Avenida Canadá, Lima 15021, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (91, 10, N'-12.08459313', N'-77.01139101', CAST(N'2015-03-16 15:37:54.147' AS DateTime), N'Avenida Canadá, La Victoria 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (92, 10, N'-12.08275228', N'-77.01524984', CAST(N'2015-03-16 15:40:04.783' AS DateTime), N'Auto Boutique Bus Stop, Avenida Canadá, La Victoria 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (93, 10, N'-12.08168914', N'-77.02260299', CAST(N'2015-03-16 15:42:12.563' AS DateTime), N'Avenida Canadá, Lima 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (94, 10, N'-12.08242598', N'-77.02641981', CAST(N'2015-03-16 15:47:37.733' AS DateTime), N'Vía Expresa Paseo de la República, Lima 15034, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (95, 10, N'-12.08307832', N'-77.03295492', CAST(N'2015-03-16 15:49:43.143' AS DateTime), N'Avenida José Pardo de Zela 274, Lince 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (96, 10, N'-12.08507974', N'-77.03453802', CAST(N'2015-03-16 15:55:37.593' AS DateTime), N'Avenida Arequipa, Lince 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (97, 10, N'-12.09156198', N'-77.03307863', CAST(N'2015-03-16 15:57:50.850' AS DateTime), N'Avenida Arequipa 2645, San Isidro 15046, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (98, 10, N'-12.09657201', N'-77.03260274', CAST(N'2015-03-16 15:59:47.057' AS DateTime), N'Sector 4, San Isidro, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (99, 10, N'-12.10330252', N'-77.03161353', CAST(N'2015-03-16 16:03:46.143' AS DateTime), N'Avenida Arequipa 3675, San Isidro 15046, Peru')
GO
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (100, 10, N'-12.11327192', N'-77.03004903', CAST(N'2015-03-16 16:08:34.077' AS DateTime), N'Angamos - NS - SIT301 - SIT302 - SIT303, Avenida Arequipa, Miraflores 15074, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (101, 10, N'-12.11756413', N'-77.02921139', CAST(N'2015-03-16 16:09:52.453' AS DateTime), N'Avenida Arequipa 5131, Miraflores 15074, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (102, 10, N'-12.11940731', N'-77.02933092', CAST(N'2015-03-16 16:13:47.077' AS DateTime), N'Óvalo de Miraflores, Lima 15074, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (103, 1, N'-12.11935485', N'-77.03206197', CAST(N'2015-03-18 11:45:44.230' AS DateTime), N'Calle Bellavista 112, Lima 15074, Peru')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (104, 4, N'37.422005', N'-122.084095', CAST(N'2015-03-21 14:46:28.630' AS DateTime), N'1650 Charleston Road, Mountain View, CA 94043, USA')
INSERT [dbo].[ca_ubicacion] ([idubicacion], [idorden], [latitud], [longitud], [hora], [direccion]) VALUES (105, 4, N'-12.06763796', N'-76.97447057', CAST(N'2015-03-21 14:52:41.203' AS DateTime), N'Pasaje Miguel Valcárcel, Lima 15022, Peru')
SET IDENTITY_INSERT [dbo].[ca_ubicacion] OFF
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'00', N'00', N'AMAZONAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'00', N'CHACHAPOYAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'01', N'CHACHAPOYAS', N'-6.2301547', N'-77.8708478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'02', N'ASUNCION', N'-6', N'-77.666667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'03', N'BALSAS', N'-6.8450815', N'-78.0291706')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'04', N'CHETO', N'-6.2088888', N'-77.8718906')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'05', N'CHILIQUIN', N'-6.066667', N'-77.7')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'06', N'CHUQUIBAMBA', N'-6.9350216', N'-77.8545943')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'07', N'GRANADA', N'-6.05', N'-77.583333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'08', N'HUANCAS', N'-6.1739749', N'-77.864598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'09', N'LA JALCA', N'-6.483333', N'-77.816667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'10', N'LEIMEBAMBA', N'-6.7075744', N'-77.8035929')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'11', N'LEVANTO', N'-6.31', N'-77.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'12', N'MAGDALENA', N'-6.3740538', N'-77.9003183')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'13', N'MARISCAL CASTILLA', N'-6.2301547', N'-77.8708478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'14', N'MOLINOPAMPA', N'-6.2084193', N'-77.668645')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'15', N'MONTEVIDEO', N'-6.2301547', N'-77.8708478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'16', N'OLLEROS', N'-6.2301547', N'-77.8708478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'17', N'QUINJALCA', N'-6.250698', N'-77.738129')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'18', N'SAN FRANCISCO DE DAGUAS', N'-6.2301547', N'-77.8708478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'19', N'SAN ISIDRO DE MAINO', N'-6.3371022', N'-77.8817452')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'20', N'SOLOCO', N'-6.250698', N'-77.738129')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'01', N'21', N'SONCHE', N'-6.103333', N'-77.891944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'00', N'BAGUA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'01', N'BAGUA', N'-5.6361357', N'-78.5307552')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'02', N'ARAMANGO', N'-5.416389', N'-78.435833')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'03', N'COPALLIN', N'-5.67', N'-78.42')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'04', N'EL PARCO', N'-5.624722', N'-78.474722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'05', N'IMAZA', N'-5.6361357', N'-78.5307552')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'02', N'06', N'LA PECA', N'-5.611111', N'-78.435')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'00', N'BONGARÁ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'01', N'JUMBILLA', N'-5.857687', N'-77.792343')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'02', N'CHISQUILLA', N'-6.029095', N'-77.939651')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'03', N'CHURUJA', N'-6.029095', N'-77.939651')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'04', N'COROSHA', N'-5.8314736', N'-77.8224332')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'05', N'CUISPES', N'-5.9285726', N'-77.9438811')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'06', N'FLORIDA', N'-5.833333', N'-77.916667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'07', N'JAZAN', N'-5.9435412', N'-77.9767202')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'08', N'RECTA', N'-5.9', N'-77.733333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'09', N'SAN CARLOS', N'-5.9649082', N'-77.9467371')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'10', N'SHIPASBAMBA', N'-5.90697', N'-78.043243')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'11', N'VALERA', N'-6.0427749', N'-77.9190463')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'03', N'12', N'YAMBRASBAMBA', N'-5.75', N'-77.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'04', N'00', N'CONDORCANQUI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'04', N'01', N'NIEVA', N'-4.6010065', N'-77.8610254')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'04', N'02', N'EL CENEPA', N'-4.651111', N'-78.148056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'04', N'03', N'RIO SANTIAGO', N'-3.0239751', N'-77.8335968')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'00', N'LUYA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'01', N'LAMUD', N'-6.1362221', N'-77.9505261')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'02', N'CAMPORREDONDO', N'-6.214865', N'-78.32021')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'03', N'COCABAMBA', N'-6.6', N'-78.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'04', N'COLCAMAR', N'-6.3004157', N'-77.9733351')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'05', N'CONILA', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'06', N'INGUILPATA', N'-6.2401592', N'-77.9535797')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'07', N'LONGUITA', N'-6.416667', N'-77.8833329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'08', N'LONYA CHICO', N'-6.2306088', N'-77.9554253')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'09', N'LUYA', N'-6.1362221', N'-77.9505261')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'10', N'LUYA VIEJO', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'11', N'MARIA', N'-6.711574', N'-77.9536509')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'12', N'OCALLI', N'-6.2221076', N'-78.2362225')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'13', N'OCUMAL', N'-6.416667', N'-78.116667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'14', N'PISUQUIA', N'-6.533333', N'-78.033333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'15', N'PROVIDENCIA', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'16', N'SAN CRISTOBAL', N'-6.7047222', N'-77.8283333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'17', N'SAN FRANCISCO DEL YESO', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'18', N'SAN JERONIMO', N'-5.974799', N'-78.032043')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'19', N'SAN JUAN DE LOPECANCHA', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'20', N'SANTA CATALINA', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'21', N'SANTO TOMAS', N'-6.5724216', N'-77.8655496')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'22', N'TINGO', N'-6.3723166', N'-77.9096036')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'05', N'23', N'TRITA', N'-6.190088', N'-78.2020387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'00', N'RODRÍGUEZ DE MENDOZA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'01', N'SAN NICOLAS', N'-6.3867084', N'-77.5053269')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'02', N'CHIRIMOTO', N'-6.516667', N'-77.4')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'03', N'COCHAMAL', N'-6.4086822', N'-77.5777031')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'04', N'HUAMBO', N'-6.4316632', N'-77.5311297')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'05', N'LIMABAMBA', N'-6.439263', N'-77.470573')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'06', N'LONGAR', N'-6.3870559', N'-77.5461785')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'07', N'MARISCAL BENAVIDES', N'-6.3867084', N'-77.5053269')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'08', N'MILPUC', N'-6.4529461', N'-77.4556598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'09', N'OMIA', N'-6.416667', N'-77.316667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'10', N'SANTA ROSA', N'-6.4529461', N'-77.4556598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'11', N'TOTORA', N'-6.380158', N'-77.4242972')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'06', N'12', N'VISTA ALEGRE', N'-6.15', N'-77.35')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'00', N'UTCUBAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'01', N'BAGUA GRANDE', N'-5.757222', N'-78.445278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'02', N'CAJARURO', N'-5.736111', N'-78.426111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'03', N'CUMBA', N'-5.9341855', N'-78.6646942')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'04', N'EL MILAGRO', N'-5.635', N'-78.561111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'05', N'JAMALCA', N'-5.867578', N'-78.27961')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'06', N'LONYA GRANDE', N'-6.0971422', N'-78.4222665')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'01', N'07', N'07', N'YAMON', N'-5.7650472', N'-78.4448088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'00', N'00', N'ÁNCASH', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'00', N'HUARAZ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'01', N'HUARAZ', N'-9.5261154', N'-77.5287792')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'02', N'COCHABAMBA', N'-9.483333', N'-77.866667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'03', N'COLCABAMBA', N'-9.5946851', N'-77.8088512')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'04', N'HUANCHAY', N'-9.726048', N'-77.843513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'05', N'INDEPENDENCIA', N'-9.5395626', N'-77.5230093')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'06', N'JANGAS', N'-9.5275995', N'-77.5257546')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'07', N'LA LIBERTAD', N'-9.5275995', N'-77.5257546')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'08', N'OLLEROS', N'-9.6621954', N'-77.467329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'09', N'PAMPAS GRANDE', N'-9.6574629', N'-77.8267218')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'10', N'PARIACOTO', N'-9.5614635', N'-77.8924608')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'11', N'PIRA', N'-9.581512', N'-77.7072909')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'01', N'12', N'TARICA', N'-9.3928599', N'-77.575554')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'00', N'AIJA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'01', N'AIJA', N'-9.780803', N'-77.6092188')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'02', N'CORIS', N'-9.824074', N'-77.726913')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'03', N'HUACLLAN', N'-9.7968977', N'-77.6750869')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'04', N'LA MERCED', N'-9.733056', N'-77.616944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'02', N'05', N'SUCCHA', N'-9.8232056', N'-77.6493992')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'00', N'ANTONIO RAYMONDI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'01', N'LLAMELLIN', N'-9.1034282', N'-77.014704')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'02', N'ACZO', N'-9.158274', N'-76.96936')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'03', N'CHACCHO', N'-9.060109', N'-77.058789')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'04', N'CHINGAS', N'-9.1194883', N'-76.9909475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'05', N'MIRGAS', N'-9.0791501', N'-77.0924196')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'03', N'06', N'SAN JUAN DE RONTOY', N'-9.1770075', N'-77.0037442')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'04', N'00', N'ASUNCIÓN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'04', N'01', N'CHACAS', N'-9.1620842', N'-77.3683319')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'04', N'02', N'ACOCHACA', N'-9.1142902', N'-77.367973')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'00', N'BOLOGNESI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'01', N'CHIQUIAN', N'-10.151', N'-77.156')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'02', N'ABELARDO PARDO LEZAMETA', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'03', N'ANTONIO RAYMONDI', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'04', N'AQUIA', N'-10.0745443', N'-77.1449212')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'05', N'CAJACAY', N'-10.15641', N'-77.443871')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'06', N'CANIS', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'07', N'COLQUIOC', N'-9.8975064', N'-76.9398195')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'08', N'HUALLANCA', N'-9.8975064', N'-76.9398195')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'09', N'HUASTA', N'-10.1239403', N'-77.1463593')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'10', N'HUAYLLACAYAN', N'-10.2446831', N'-77.4349222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'11', N'LA PRIMAVERA', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'12', N'MANGAS', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'13', N'PACLLON', N'-10.2348671', N'-77.0729954')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'14', N'SAN MIGUEL DE CORPANQUI', N'-10.285083', N'-77.1987')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'05', N'15', N'TICLLOS', N'-10.254683', N'-77.190931')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'00', N'CARHUAZ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'01', N'CARHUAZ', N'-9.281389', N'-77.646389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'02', N'ACOPAMPA', N'-9.2939318', N'-77.6242574')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'03', N'AMASHCA', N'-9.2390157', N'-77.6471693')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'04', N'ANTA', N'-9.3583473', N'-77.5999083')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'05', N'ATAQUERO', N'-9.2707568', N'-77.6808128')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'06', N'MARCARA', N'-9.3224332', N'-77.6034894')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'07', N'PARIAHUANCA', N'-9.365146', N'-77.5805685')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'08', N'SAN MIGUEL DE ACO', N'-9.3601019', N'-77.553344')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'09', N'SHILLA', N'-9.2314283', N'-77.6242574')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'10', N'TINCO', N'-9.2707568', N'-77.6808128')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'06', N'11', N'YUNGAR', N'-9.3790548', N'-77.5891644')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'07', N'00', N'CARLOS FERMÍN FITZCARRALD', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'07', N'01', N'SAN LUIS', N'-9.0956187', N'-77.328135')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'07', N'02', N'SAN NICOLAS', N'-8.9754819', N'-77.1895149')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'07', N'03', N'YAUYA', N'-9.0099745', N'-77.2405153')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'08', N'00', N'CASMA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'08', N'01', N'CASMA', N'-9.4718308', N'-78.3006626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'08', N'02', N'BUENA VISTA ALTA', N'-9.4309697', N'-78.2041756')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'08', N'03', N'COMANDANTE NOEL', N'-9.4718308', N'-78.3006626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'08', N'04', N'YAUTAN', N'-9.5131891', N'-77.995277')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'00', N'CORONGO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'01', N'CORONGO', N'-8.583333', N'-77.916667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'02', N'ACO', N'-8.583333', N'-77.916667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'03', N'BAMBAS', N'-8.602114', N'-77.9945633')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'04', N'CUSCA', N'-8.516667', N'-77.866667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'05', N'LA PAMPA', N'-8.663898', N'-77.910316')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'06', N'YANAC', N'-8.620944', N'-77.86676')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'09', N'07', N'YUPAN', N'-8.622056', N'-77.973587')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'00', N'HUARI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'01', N'HUARI', N'-9.3483845', N'-77.1708039')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'02', N'ANRA', N'-9.2392972', N'-76.9153281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'03', N'CAJAY', N'-9.3253022', N'-77.1577471')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'04', N'CHAVIN DE HUANTAR', N'-9.5954724', N'-77.175836')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'05', N'HUACACHI', N'-9.3160805', N'-76.938379')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'06', N'HUACCHIS', N'-9.20033', N'-76.7878')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'07', N'HUACHIS', N'-9.416667', N'-77.116667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'08', N'HUANTAR', N'-9.4518894', N'-77.1765548')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'09', N'MASIN', N'-9.3660702', N'-77.097455')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'10', N'PAUCAS', N'-9.103679', N'-76.886337')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'11', N'PONTO', N'-9.3260198', N'-77.0053459')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'12', N'RAHUAPAMPA', N'-9.3483845', N'-77.1708039')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'13', N'RAPAYAN', N'-9.2', N'-76.76')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'14', N'SAN MARCOS', N'-9.5232546', N'-77.1564253')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'15', N'SAN PEDRO DE CHANA', N'-9.4022148', N'-77.0096651')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'10', N'16', N'UCO', N'-9.19', N'-76.93')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'00', N'HUARMEY', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'01', N'HUARMEY', N'-10.0664169', N'-78.1506824')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'02', N'COCHAPETI', N'-9.983333', N'-77.65')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'03', N'CULEBRAS', N'-9.948668', N'-78.226662')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'04', N'HUAYAN', N'-9.8740941', N'-77.708722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'11', N'05', N'MALVAS', N'-9.9304279', N'-77.6579077')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'00', N'HUAYLAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'01', N'CARAZ', N'-9.05', N'-77.81')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'02', N'HUALLANCA', N'-8.8190203', N'-77.8628117')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'03', N'HUATA', N'-9.016111', N'-77.860833')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'04', N'HUAYLAS', N'-8.8710472', N'-77.8924608')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'05', N'MATO', N'-8.9634377', N'-77.8434283')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'06', N'PAMPAROMAS', N'-9.071815', N'-77.989159')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'07', N'PUEBLO LIBRE', N'-9.0990916', N'-77.803132')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'08', N'SANTA CRUZ', N'-8.89429', N'-77.7083')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'09', N'SANTO TORIBIO', N'-8.870556', N'-77.905278')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'12', N'10', N'YURACMARCA', N'-8.7381683', N'-77.9037977')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'00', N'MARISCAL LUZURIAGA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'01', N'PISCOBAMBA', N'-8.8667621', N'-77.3597194')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'02', N'CASCA', N'-8.866667', N'-77.416667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'03', N'ELEAZAR GUZMAN BARRON', N'-8.8401731', N'-77.3324425')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'04', N'FIDEL OLIVAS ESCUDERO', N'-8.8401731', N'-77.3324425')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'05', N'LLAMA', N'-8.8401731', N'-77.3324425')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'06', N'LLUMPA', N'-8.933278', N'-77.42086')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'07', N'LUCMA', N'-8.933278', N'-77.42086')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'13', N'08', N'MUSGA', N'-8.8401731', N'-77.3324425')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'00', N'OCROS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'01', N'OCROS', N'-10.403611', N'-77.396389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'02', N'ACAS', N'-10.4571094', N'-77.3270581')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'03', N'CAJAMARQUILLA', N'-10.3606843', N'-77.2258615')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'04', N'CARHUAPAMPA', N'-10.403611', N'-77.396389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'05', N'COCHAS', N'-10.64457', N'-77.551537')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'06', N'CONGAS', N'-10.333333', N'-77.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'07', N'LLIPA', N'-10.3929647', N'-77.1907513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'08', N'SAN CRISTOBAL DE RAJAN', N'-10.3867517', N'-77.2200373')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'09', N'SAN PEDRO', N'-10.403611', N'-77.396389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'14', N'10', N'SANTIAGO DE CHILCAS', N'-10.4380075', N'-77.36582')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'00', N'PALLASCA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'01', N'CABANA', N'-8.3944043', N'-78.006695')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'02', N'BOLOGNESI', N'-8.35', N'-78.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'03', N'CONCHUCOS', N'-8.269726', N'-77.857567')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'04', N'HUACASCHUQUE', N'-8.301379', N'-78.0084789')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'05', N'HUANDOVAL', N'-8.331677', N'-77.9745')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'06', N'LACABAMBA', N'-8.2614583', N'-77.8988897')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'07', N'LLAPO', N'-8.5139203', N'-78.0409416')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'08', N'PALLASCA', N'-8.25', N'-78.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'09', N'PAMPAS', N'-8.1952657', N'-77.8956722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'10', N'SANTA ROSA', N'-8.5268878', N'-78.0680458')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'15', N'11', N'TAUCA', N'-8.4680384', N'-78.0380882')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'16', N'00', N'POMABAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'16', N'01', N'POMABAMBA', N'-8.82', N'-77.460556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'16', N'02', N'HUAYLLAN', N'-8.8186084', N'-77.4628776')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'16', N'03', N'PAROBAMBA', N'-8.708189', N'-77.374123')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'16', N'04', N'QUINUABAMBA', N'-9.0545682', N'-78.576519')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'00', N'RECUAY', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'01', N'RECUAY', N'-9.72215', N'-77.456272')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'02', N'CATAC', N'-9.802222', N'-77.431111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'03', N'COTAPARACO', N'-9.9935309', N'-77.5862992')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'04', N'HUAYLLAPAMPA', N'-10.0554215', N'-77.5368628')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'05', N'LLACLLIN', N'-10.0682271', N'-77.621393')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'06', N'MARCA', N'-10.08446', N'-77.478661')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'07', N'PAMPAS CHICO', N'-10.116667', N'-77.4')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'08', N'PARARIN', N'-10.05357', N'-77.655724')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'09', N'TAPACOCHA', N'-10.0103836', N'-77.5695813')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'17', N'10', N'TICAPAMPA', N'-9.7609823', N'-77.4429463')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'00', N'SANTA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'01', N'CHIMBOTE', N'-9.0633364', N'-78.589011')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'02', N'CACERES DEL PERU', N'-9.1255505', N'-78.5309145')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'03', N'COISHCO', N'-9.023056', N'-78.615556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'04', N'MACATE', N'-8.7778814', N'-78.0651931')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'05', N'MORO', N'-9.1382287', N'-78.1835179')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'06', N'NEPEÑA', N'-9.1738986', N'-78.3600448')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'07', N'SAMANCO', N'-9.2599058', N'-78.4936632')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'08', N'SANTA', N'-8.9877356', N'-78.6141851')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'18', N'09', N'NUEVO CHIMBOTE', N'-9.1052648', N'-78.445126')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'00', N'SIHUAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'01', N'SIHUAS', N'-8.5547681', N'-77.6292697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'02', N'ACOBAMBA', N'-8.416667', N'-77.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'03', N'ALFONSO UGARTE', N'-8.5547681', N'-77.6292697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'04', N'CASHAPAMPA', N'-8.416667', N'-77.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'05', N'CHINGALPO', N'-8.344687', N'-77.537407')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'06', N'HUAYLLABAMBA', N'-8.5547681', N'-77.6292697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'07', N'QUICHES', N'-8.416667', N'-77.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'08', N'RAGASH', N'-8.5547681', N'-77.6292697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'09', N'SAN JUAN', N'-8.5547681', N'-77.6292697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'19', N'10', N'SICSIBAMBA', N'-8.625993', N'-77.585052')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'00', N'YUNGAY', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'01', N'YUNGAY', N'-9.139272', N'-77.745522')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'02', N'CASCAPARA', N'-9.2291399', N'-77.727226')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'03', N'MANCOS', N'-9.1896778', N'-77.7130151')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'04', N'MATACOTO', N'-9.1772269', N'-77.7459234')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'05', N'QUILLO', N'-9.32897', N'-78.051987')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'06', N'RANRAHIRCA', N'-9.1737279', N'-77.7230317')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'07', N'SHUPLUY', N'-9.2158474', N'-77.6940526')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'02', N'20', N'08', N'YANAMA', N'-9.026237', N'-77.484123')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'00', N'00', N'APURÍMAC', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'00', N'ABANCAY', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'01', N'ABANCAY', N'-13.633333', N'-72.883333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'02', N'CHACOCHE', N'-13.6218599', N'-72.8730547')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'03', N'CIRCA', N'-13.8791041', N'-72.875917')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'04', N'CURAHUASI', N'-13.5426013', N'-72.6967861')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'05', N'HUANIPACA', N'-13.8196508', N'-72.7999806')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'06', N'LAMBRAMA', N'-13.87028', N'-72.778954')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'07', N'PICHIRHUA', N'-13.86593', N'-73.068764')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'08', N'SAN PEDRO DE CACHORA', N'-13.5123375', N'-72.8131637')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'01', N'09', N'TAMBURCO', N'-13.616944', N'-72.871111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'00', N'ANDAHUAYLAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'01', N'ANDAHUAYLAS', N'-13.6575', N'-73.383333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'02', N'ANDARAPA', N'-13.527778', N'-73.363333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'03', N'CHIARA', N'-13.87016', N'-73.667793')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'04', N'HUANCARAMA', N'-13.6418002', N'-73.091991')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'05', N'HUANCARAY', N'-13.77085', N'-73.536636')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'06', N'HUAYANA', N'-13.6574363', N'-73.3788357')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'07', N'KISHUARA', N'-13.684022', N'-73.1268046')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'08', N'PACOBAMBA', N'-13.6574363', N'-73.3788357')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'09', N'PACUCHA', N'-13.608056', N'-73.343889')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'10', N'PAMPACHIRI', N'-14.19396', N'-73.54213')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'11', N'POMACOCHA', N'-14.083889', N'-73.588889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'12', N'SAN ANTONIO DE CACHI', N'-13.77377', N'-73.605743')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'13', N'SAN JERONIMO', N'-13.651111', N'-73.365')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'14', N'SAN MIGUEL DE CHACCRAMPA', N'-13.95', N'-73.6')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'15', N'SANTA MARIA DE CHICMO', N'-13.6575', N'-73.383333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'16', N'TALAVERA', N'-13.6574845', N'-73.4386466')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'17', N'TUMAY HUARACA', N'-13.6575', N'-73.383333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'18', N'TURPO', N'-13.77575', N'-73.4761429')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'19', N'KAQUIABAMBA', N'-14.083889', N'-73.588889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'02', N'20', N'JOSE MARIA ARGUEDAS', N'-13.6569026', N'-73.3877009')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'00', N'ANTABAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'01', N'ANTABAMBA', N'-14.3651534', N'-72.8778527')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'02', N'EL ORO', N'-14.3651534', N'-72.8778527')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'03', N'HUAQUIRCA', N'-14.3386959', N'-72.8936384')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'04', N'JUAN ESPINOZA MEDRANO', N'-14.3651534', N'-72.8778527')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'05', N'OROPESA', N'-14.2603902', N'-72.5633132')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'06', N'PACHACONAS', N'-14.2238172', N'-73.015602')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'03', N'07', N'SABAINO', N'-14.32663', N'-72.9516979')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'00', N'AYMARAES', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'01', N'CHALHUANCA', N'-14.2951956', N'-73.2423004')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'02', N'CAPAYA', N'-14.3793587', N'-73.1607752')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'03', N'CARAYBAMBA', N'-14.3793587', N'-73.1607752')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'04', N'CHAPIMARCA', N'-13.97797', N'-73.063881')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'05', N'COLCABAMBA', N'-14.007778', N'-73.247778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'06', N'COTARUSE', N'-14.4159515', N'-73.2046534')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'07', N'HUAYLLO', N'-14.1325', N'-73.268611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'08', N'JUSTO APU SAHUARAURA', N'-14.1333686', N'-73.1663153')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'09', N'LUCRE', N'-13.96778', N'-73.190552')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'10', N'POCOHUANCA', N'-14.216667', N'-73.083333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'11', N'SAN JUAN DE CHACÑA', N'-14.3267912', N'-73.1821623')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'12', N'SAÑAYCA', N'-14.204117', N'-73.3464212')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'13', N'SORAYA', N'-14.05968', N'-73.300659')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'14', N'TAPAIRIHUA', N'-14.1419669', N'-73.1399227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'15', N'TINTAY', N'-13.96778', N'-73.190552')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'16', N'TORAYA', N'-14.05968', N'-73.300659')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'04', N'17', N'YANACA', N'-14.3267912', N'-73.1821623')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'00', N'COTABAMBAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'01', N'TAMBOBAMBA', N'-13.945728', N'-72.1756733')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'02', N'COTABAMBAS', N'-13.75711', N'-72.363632')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'03', N'COYLLURQUI', N'-13.8402574', N'-72.431169')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'04', N'HAQUIRA', N'-14.2234', N'-72.194618')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'05', N'MARA', N'-14.10047', N'-72.108879')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'05', N'06', N'CHALLHUAHUACHO', N'-14.1187849', N'-72.2475967')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'00', N'CHINCHEROS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'01', N'CHINCHEROS', N'-13.5177661', N'-73.723513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'02', N'ANCO_HUALLO', N'-13.5177661', N'-73.723513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'03', N'COCHARCAS', N'-13.61652', N'-73.738617')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'04', N'HUACCANA', N'-13.3891604', N'-73.6895755')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'05', N'OCOBAMBA', N'-13.4827301', N'-73.5600275')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'06', N'ONGOY', N'-13.4030258', N'-73.6679059')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'07', N'URANMARCA', N'-13.6721337', N'-73.6693409')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'06', N'08', N'RANRACANCHA', N'-13.5177661', N'-73.723513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'00', N'GRAU', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'01', N'CHUQUIBAMBILLA', N'-14.11414', N'-72.714928')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'02', N'CURPAHUASI', N'-14.07109', N'-72.676201')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'03', N'GAMARRA', N'-13.8720839', N'-72.5085372')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'04', N'HUAYLLATI', N'-14.23792', N'-72.591949')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'05', N'MAMARA', N'-14.23792', N'-72.591949')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'06', N'MICAELA BASTIDAS', N'-14.1151863', N'-72.6154865')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'07', N'PATAYPAMPA', N'-14.16568', N'-72.658867')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'08', N'PROGRESO', N'-14.0749161', N'-72.4742969')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'09', N'SAN ANTONIO', N'-5.1979132', N'-80.6287413')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'10', N'SANTA ROSA', N'-14.13452', N'-72.662079')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'11', N'TURPAY', N'-14.23592', N'-72.629868')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'12', N'VILCABAMBA', N'-14.0777235', N'-72.6247262')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'13', N'VIRUNDO', N'-14.2606', N'-72.683563')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'03', N'07', N'14', N'CURASCO', N'-14.0617304', N'-72.5692828')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'00', N'00', N'AREQUIPA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'00', N'AREQUIPA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'01', N'AREQUIPA', N'-16.4090474', N'-71.537451')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'02', N'ALTO SELVA ALEGRE', N'-16.378903', N'-71.520636')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'03', N'CAYMA', N'-16.381528', N'-71.545561')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'04', N'CERRO COLORADO', N'-16.3814477', N'-71.5557385')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'05', N'CHARACATO', N'-16.4728798', N'-71.4829052')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'06', N'CHIGUATA', N'-16.4', N'-71.4')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'07', N'JACOBO HUNTER', N'-16.4478087', N'-71.5548944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'08', N'LA JOYA', N'-16.726111', N'-71.861111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'09', N'MARIANO MELGAR', N'-16.4', N'-71.483056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'10', N'MIRAFLORES', N'-16.394169', N'-71.522283')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'11', N'MOLLEBAYA', N'-16.5058863', N'-71.4714928')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'12', N'PAUCARPATA', N'-16.4153922', N'-71.4714928')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'13', N'POCSI', N'-16.516111', N'-71.388056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'14', N'POLOBAYA', N'-16.565', N'-71.368889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'15', N'QUEQUEÑA', N'-16.558056', N'-71.451111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'16', N'SABANDIA', N'-16.4544375', N'-71.4655565')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'17', N'SACHACA', N'-16.425', N'-71.566111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'18', N'SAN JUAN DE SIGUAS', N'-16.4090474', N'-71.537451')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'19', N'SAN JUAN DE TARUCANI', N'-16.1838075', N'-71.0609195')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'20', N'SANTA ISABEL DE SIGUAS', N'-16.4906246', N'-72.0912562')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'21', N'SANTA RITA DE SIGUAS', N'-16.4906246', N'-72.0912562')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'22', N'SOCABAYA', N'-16.47', N'-71.54')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'23', N'TIABAYA', N'-16.4359692', N'-71.6050339')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'24', N'UCHUMAYO', N'-16.4216675', N'-71.6347027')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'25', N'VITOR', N'-16.4243944', N'-71.8203229')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'26', N'YANAHUARA', N'-16.387378', N'-71.5421')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'27', N'YARABAMBA', N'-16.546944', N'-71.476944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'28', N'YURA', N'-16.3110873', N'-71.6317359')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'01', N'29', N'JOSE LUIS BUSTAMANTE Y RIVERO', N'-16.42655', N'-71.523928')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'00', N'CAMANÁ', NULL, NULL)
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'01', N'CAMANA', N'-16.6235522', N'-72.7104708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'02', N'JOSE MARIA QUIMPER', N'-16.6235522', N'-72.7104708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'03', N'MARIANO NICOLAS VALCARCEL', N'-16.6235522', N'-72.7104708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'04', N'MARISCAL CACERES', N'-16.6235522', N'-72.7104708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'05', N'NICOLAS DE PIEROLA', N'-16.623554', N'-72.7114941')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'06', N'OCOÑA', N'-16.430785', N'-73.1069298')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'07', N'QUILCA', N'-16.7125', N'-72.423333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'02', N'08', N'SAMUEL PASTOR', N'-16.6208228', N'-72.7095473')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'00', N'CARAVELÍ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'01', N'CARAVELI', N'-15.7774', N'-73.373283')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'02', N'ACARI', N'-15.433333', N'-74.616667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'03', N'ATICO', N'-16.236262', N'-73.6992374')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'04', N'ATIQUIPA', N'-15.80092', N'-74.378639')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'05', N'BELLA UNION', N'-15.4529463', N'-74.6620003')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'06', N'CAHUACHO', N'-15.8468141', N'-74.2560806')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'07', N'CHALA', N'-15.8468141', N'-74.2560806')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'08', N'CHAPARRA', N'-15.74447', N'-73.871483')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'09', N'HUANUHUANU', N'-15.5606386', N'-73.6893433')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'10', N'JAQUI', N'-15.48824', N'-74.445282')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'11', N'LOMAS', N'-16.2586111', N'-73.4130556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'12', N'QUICACHA', N'-15.625465', N'-73.7985281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'03', N'13', N'YAUCA', N'-15.67164', N'-74.536774')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'00', N'CASTILLA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'01', N'APLAO', N'-16.0710704', N'-72.4879444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'02', N'ANDAGUA', N'-15.4985936', N'-72.3562713')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'03', N'AYO', N'-15.6835726', N'-72.2704277')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'04', N'CHACHAS', N'-15.5190392', N'-72.2615459')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'05', N'CHILCAYMARCA', N'-15.267332', N'-72.3399927')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'06', N'CHOCO', N'-15.576624', N'-72.1293262')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'07', N'HUANCARQUI', N'-16.0922549', N'-72.4701945')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'08', N'MACHAGUAY', N'-15.64274', N'-72.50293')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'09', N'ORCOPAMPA', N'-15.267332', N'-72.3399927')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'10', N'PAMPACOLCA', N'-15.7141349', N'-72.57224')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'11', N'TIPAN', N'-15.7226628', N'-72.5021342')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'12', N'UÑON', N'-15.73588', N'-72.433884')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'13', N'URACA', N'-16.2333333', N'-72.55')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'04', N'14', N'VIRACO', N'-15.66758', N'-72.534439')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'00', N'CAYLLOMA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'01', N'CHIVAY', N'-15.633333', N'-71.6')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'02', N'ACHOMA', N'-15.6627675', N'-71.6992231')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'03', N'CABANACONDE', N'-15.6225478', N'-71.9801443')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'04', N'CALLALLI', N'-15.5059445', N'-71.4412594')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'05', N'CAYLLOMA', N'-15.1881716', N'-71.7733933')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'06', N'COPORAQUE', N'-15.6285897', N'-71.6458278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'07', N'HUAMBO', N'-15.73144', N'-72.1082897')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'08', N'HUANCA', N'-16.0342971', N'-71.8782382')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'09', N'ICHUPAMPA', N'-15.6500913', N'-71.6869874')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'10', N'LARI', N'-15.6208297', N'-71.7689206')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'11', N'LLUTA', N'-16.0159972', N'-72.0149638')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'12', N'MACA', N'-15.6418418', N'-71.7674379')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'13', N'MADRIGAL', N'-15.6086159', N'-71.8074703')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'14', N'SAN ANTONIO DE CHUCA', N'-15.928889', N'-71.105278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'15', N'SIBAYO', N'-15.49357', N'-71.465973')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'16', N'TAPAY', N'-15.5771262', N'-71.9390226')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'17', N'TISCO', N'-15.566017', N'-71.7622481')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'18', N'TUTI', N'-15.53735', N'-71.558258')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'19', N'YANQUE', N'-15.6501', N'-71.6584358')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'05', N'20', N'MAJES', N'-16.2395887', N'-72.236379')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'00', N'CONDESUYOS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'01', N'CHUQUIBAMBA', N'-15.84834', N'-72.657494')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'02', N'ANDARAY', N'-15.81143', N'-72.858566')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'03', N'CAYARANI', N'-14.68116', N'-72.020866')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'04', N'CHICHAS', N'-15.78163', N'-72.881012')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'05', N'IRAY', N'-15.78163', N'-72.881012')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'06', N'RIO GRANDE', N'-15.742916', N'-72.8042797')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'07', N'SALAMANCA', N'-15.78163', N'-72.881012')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'06', N'08', N'YANAQUIHUA', N'-15.78163', N'-72.881012')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'00', N'ISLAY', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'01', N'MOLLENDO', N'-17.016667', N'-72.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'02', N'COCACHACRA', N'-17.0918434', N'-71.7711448')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'03', N'DEAN VALDIVIA', N'-17.0931817', N'-71.7673507')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'04', N'ISLAY', N'-17.002399', N'-72.09668')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'05', N'MEJIA', N'-17.1264493', N'-71.8689917')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'07', N'06', N'PUNTA DE BOMBON', N'-17.1679082', N'-71.794868')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'00', N'LA UNIÒN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'01', N'COTAHUASI', N'-15.2122806', N'-72.8901725')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'02', N'ALCA', N'-15.14503', N'-72.769402')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'03', N'CHARCANA', N'-15.2411526', N'-73.0708224')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'04', N'HUAYNACOTAS', N'-15.1061111', N'-72.7966667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'05', N'PAMPAMARCA', N'-15.13588', N'-72.90506')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'06', N'PUYCA', N'-16.4090474', N'-71.537451')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'07', N'QUECHUALLA', N'-15.323611', N'-73.059444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'08', N'SAYLA', N'-15.3199908', N'-73.2214522')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'09', N'TAURIA', N'-15.3533909', N'-73.2337779')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'10', N'TOMEPAMPA', N'-15.1709148', N'-72.8308692')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'04', N'08', N'11', N'TORO', N'-15.2645569', N'-72.9268626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'00', N'00', N'AYACUCHO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'00', N'HUAMANGA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'01', N'AYACUCHO', N'-13.1638737', N'-74.2235641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'02', N'ACOCRO', N'-13.2181105', N'-74.0424972')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'03', N'ACOS VINCHOS', N'-13.1129764', N'-74.0994827')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'04', N'CARMEN ALTO', N'-13.1760533', N'-74.2222488')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'05', N'CHIARA', N'-13.1638737', N'-74.2235641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'06', N'OCROS', N'-13.40151', N'-73.908447')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'07', N'PACAYCASA', N'-13.056944', N'-74.213611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'08', N'QUINUA', N'-13.05526', N'-74.139107')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'09', N'SAN JOSE DE TICLLAS', N'-13.1638737', N'-74.2235641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'10', N'SAN JUAN BAUTISTA', N'-13.1638737', N'-74.2235641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'11', N'SANTIAGO DE PISCHA', N'-13.066667', N'-74.3')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'12', N'SOCOS', N'-13.0841667', N'-73.9977778')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'13', N'TAMBILLO', N'-13.1945992', N'-74.1103173')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'14', N'VINCHOS', N'-13.24994', N'-74.343857')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'15', N'JESUS NAZARENO', N'-13.155128', N'-74.218414')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'01', N'16', N'ANDRES AVELINO CACERES DORREGARAY', N'-13.1638737', N'-74.2235641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'00', N'CANGALLO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'01', N'CANGALLO', N'-13.6289', N'-74.128227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'02', N'CHUSCHI', N'-13.58849', N'-74.360153')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'03', N'LOS MOROCHUCOS', N'-13.6289', N'-74.128227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'04', N'MARIA PARADO DE BELLIDO', N'-13.6289', N'-74.128227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'05', N'PARAS', N'-13.58481', N'-74.524353')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'02', N'06', N'TOTOS', N'-13.58481', N'-74.524353')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'03', N'00', N'HUANCA SANCOS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'03', N'01', N'SANCOS', N'-13.9202424', N'-74.3345526')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'03', N'02', N'CARAPO', N'-13.838889', N'-74.311944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'03', N'03', N'SACSAMARCA', N'-13.9448918', N'-74.3132878')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'03', N'04', N'SANTIAGO DE LUCANAMARCA', N'-13.9202424', N'-74.3345526')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'00', N'HUANTA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'01', N'HUANTA', N'-12.939722', N'-74.2475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'02', N'AYAHUANCO', N'-12.9378279', N'-74.2549074')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'03', N'HUAMANGUILLA', N'-12.9942711', N'-74.1770589')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'04', N'IGUAIN', N'-12.9412012', N'-74.2461756')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'05', N'LURICOCHA', N'-12.8994627', N'-74.2751517')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'06', N'SANTILLANA', N'-12.9378279', N'-74.2549074')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'07', N'SIVIA', N'-12.5125', N'-73.857778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'08', N'LLOCHEGUA', N'-12.4095046', N'-73.9080581')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'09', N'CANAYRE', N'-12.2826649', N'-74.0248712')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'04', N'10', N'UCHURACCAY', N'-12.8259454', N'-74.1115165')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'00', N'LA MAR', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'01', N'SAN MIGUEL', N'-13.012606', N'-73.980964')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'02', N'ANCO', N'-13.116609', N'-73.6904092')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'03', N'AYNA', N'-12.66933', N'-73.922768')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'04', N'CHILCAS', N'-13.18365', N'-73.906227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'05', N'CHUNGUI', N'-13.2194333', N'-73.6198139')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'06', N'LUIS CARRANZA', N'-12.9320806', N'-73.7477857')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'07', N'SANTA ROSA', N'-12.6878911', N'-73.7374886')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'08', N'TAMBO', N'-12.95689', N'-74.023193')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'09', N'SAMUGARI', N'-12.9320806', N'-73.7477857')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'05', N'10', N'ANCHIHUAY', N'-13.0235299', N'-73.737053')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'00', N'LUCANAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'01', N'PUQUIO', N'-14.693889', N'-74.124167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'02', N'AUCARA', N'-14.27373', N'-74.074432')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'03', N'CABANA', N'-14.2906979', N'-73.9668408')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'04', N'CARMEN SALCEDO', N'-14.6192', N'-74.239182')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'05', N'CHAVIÑA', N'-14.98306', N'-73.841164')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'06', N'CHIPAO', N'-14.24916', N'-73.946533')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'07', N'HUAC-HUAS', N'-14.03493', N'-74.897476')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'08', N'LARAMATE', N'-14.25575', N'-74.8591919')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'09', N'LEONCIO PRADO', N'-14.6192', N'-74.239182')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'10', N'LLAUTA', N'-14.4089787', N'-74.9110991')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'11', N'LUCANAS', N'-14.6192', N'-74.239182')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'12', N'OCAÑA', N'-14.40066', N'-74.825012')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'13', N'OTOCA', N'-14.48967', N'-74.684341')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'14', N'SAISA', N'-14.6192', N'-74.239182')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'15', N'SAN CRISTOBAL', N'-14.75321', N'-74.225616')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'16', N'SAN JUAN', N'-14.6515619', N'-74.1988975')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'17', N'SAN PEDRO', N'-14.77248', N'-74.098793')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'18', N'SAN PEDRO DE PALCO', N'-14.6044111', N'-74.9145538')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'19', N'SANCOS', N'-15.0620972', N'-73.9514279')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'20', N'SANTA ANA DE HUAYCAHUACHO', N'-14.6192', N'-74.239182')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'06', N'21', N'SANTA LUCIA', N'-14.98186', N'-74.529922')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'00', N'PARINACOCHAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'01', N'CORACORA', N'-15.016994', N'-73.780419')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'02', N'CHUMPI', N'-15.10129', N'-73.754257')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'03', N'CORONEL CASTAÑEDA', N'-15.0347298', N'-73.6065223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'04', N'PACAPAUSA', N'-14.96617', N'-73.3855899')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'05', N'PULLO', N'-15.21759', N'-73.83345')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'06', N'PUYUSCA', N'-15.0347298', N'-73.6065223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'07', N'SAN FRANCISCO DE RAVACAYCO', N'-15.0347298', N'-73.6065223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'07', N'08', N'UPAHUACHO', N'-14.901667', N'-73.401111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'00', N'PÀUCAR DEL SARA SARA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'01', N'PAUSA', N'-15.29557', N'-73.3480529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'02', N'COLTA', N'-15.1632747', N'-73.293029')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'03', N'CORCULLA', N'-15.27628', N'-73.203308')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'04', N'LAMPA', N'-15.1844999', N'-73.348027')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'05', N'MARCABAMBA', N'-15.1471649', N'-73.3406579')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'06', N'OYOLO', N'-15.18834', N'-73.185188')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'07', N'PARARCA', N'-15.329444', N'-73.444722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'08', N'SAN JAVIER DE ALPABAMBA', N'-15.08065', N'-73.347488')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'09', N'SAN JOSE DE USHUA', N'-15.2261935', N'-73.2284005')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'08', N'10', N'SARA SARA', N'-15.329444', N'-73.444722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'00', N'SUCRE', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'01', N'QUEROBAMBA', N'-14.0121048', N'-73.8385843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'02', N'BELEN', N'-14.1385675', N'-73.7007088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'03', N'CHALCOS', N'-13.8556', N'-73.758263')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'04', N'CHILCAYOC', N'-14.1385675', N'-73.7007088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'05', N'HUACAÑA', N'-14.1731008', N'-73.885275')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'06', N'MORCOLLA', N'-14.1102622', N'-73.8720449')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'07', N'PAICO', N'-14.0494', N'-73.651283')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'08', N'SAN PEDRO DE LARCAY', N'-14.1385675', N'-73.7007088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'09', N'SAN SALVADOR DE QUIJE', N'-14.1385675', N'-73.7007088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'10', N'SANTIAGO DE PAUCARAY', N'-14.1385675', N'-73.7007088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'09', N'11', N'SORAS', N'-14.116667', N'-73.616667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'00', N'VÍCTOR FAJARDO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'01', N'HUANCAPI', N'-13.7543026', N'-74.0667302')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'02', N'ALCAMENCA', N'-13.7204119', N'-74.1709702')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'03', N'APONGO', N'-14', N'-73.933333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'04', N'ASQUIPATA', N'-13.7204119', N'-74.1709702')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'05', N'CANARIA', N'-13.927778', N'-73.9075')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'06', N'CAYARA', N'-13.796667', N'-73.988056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'07', N'COLCA', N'-13.714722', N'-74.033056')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'08', N'HUAMANQUIQUIA', N'-13.71027', N'-74.2520289')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'09', N'HUANCARAYLLA', N'-13.68954', N'-74.140961')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'10', N'HUAYA', N'-13.84783', N'-73.9521468')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'11', N'SARHUA', N'-13.674167', N'-74.3199999')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'10', N'12', N'VILCANCHOS', N'-13.6107918', N'-74.532225')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'00', N'VILCAS HUAMÁN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'01', N'VILCAS HUAMAN', N'-13.65311', N'-73.95396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'02', N'ACCOMARCA', N'-13.65311', N'-73.95396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'03', N'CARHUANCA', N'-13.7544', N'-73.787239')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'04', N'CONCEPCION', N'-13.5376', N'-73.879822')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'05', N'HUAMBALPA', N'-13.65311', N'-73.95396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'06', N'INDEPENDENCIA', N'-11.9777495', N'-77.0384372')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'07', N'SAURAMA', N'-13.65311', N'-73.95396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'05', N'11', N'08', N'VISCHONGO', N'-13.589688', N'-73.9962255')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'00', N'00', N'CAJAMARCA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'00', N'CAJAMARCA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'01', N'CAJAMARCA', N'-7.1617465', N'-78.5127855')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'02', N'ASUNCION', N'-7.324656', N'-78.5156793')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'03', N'CHETILLA', N'-7.15', N'-78.666667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'04', N'COSPAN', N'-7.427345', N'-78.54454')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'05', N'ENCAÑADA', N'-7.0859542', N'-78.3436859')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'06', N'JESUS', N'-7.2476352', N'-78.3813785')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'07', N'LLACANORA', N'-7.193833', N'-78.426165')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'08', N'LOS BAÑOS DEL INCA', N'-7.156113', N'-78.468452')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'09', N'MAGDALENA', N'-7.2507002', N'-78.6583124')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'10', N'MATARA', N'-7.2557429', N'-78.2597173')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'11', N'NAMORA', N'-7.2038055', N'-78.3244788')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'01', N'12', N'SAN JUAN', N'-7.1633212', N'-78.5084154')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'02', N'00', N'CAJABAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'02', N'01', N'CAJABAMBA', N'-7.623722', N'-78.046031')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'02', N'02', N'CACHACHI', N'-7.4509461', N'-78.2696832')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'02', N'03', N'CONDEBAMBA', N'-7.623722', N'-78.046031')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'02', N'04', N'SITACOCHA', N'-7.520823', N'-77.972656')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'00', N'CELENDÍN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'01', N'CELENDIN', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'02', N'CHUMUCH', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'03', N'CORTEGANA', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'04', N'HUASMIN', N'-6.8379417', N'-78.2451004')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'05', N'JORGE CHAVEZ', N'-6.8710702', N'-78.1489841')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'06', N'JOSE GALVEZ', N'-6.9259763', N'-78.1325689')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'07', N'MIGUEL IGLESIAS', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'08', N'OXAMARCA', N'-7.0459234', N'-78.0423683')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'09', N'SOROCHUCO', N'-6.906714', N'-78.25705')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'10', N'SUCRE', N'-6.9415153', N'-78.1350635')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'11', N'UTCO', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'03', N'12', N'LA LIBERTAD DE PALLAN', N'-6.865906', N'-78.144892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'00', N'CHOTA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'01', N'CHOTA', N'-6.561389', N'-78.648611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'02', N'ANGUIA', N'-6.316667', N'-78.6')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'03', N'CHADIN', N'-6.466667', N'-78.3833329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'04', N'CHIGUIRIP', N'-6.4301048', N'-78.720695')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'05', N'CHIMBAN', N'-6.25', N'-78.466667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'06', N'CHOROPAMPA', N'-6.4750115', N'-78.8856773')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'07', N'COCHABAMBA', N'-6.4750115', N'-78.8856773')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'08', N'CONCHAN', N'-6.439373', N'-78.654907')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'09', N'HUAMBOS', N'-6.4537339', N'-78.9613486')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'10', N'LAJAS', N'-6.5588437', N'-78.7348674')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'11', N'LLAMA', N'-6.5117', N'-79.1187209')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'12', N'MIRACOSTA', N'-6.405571', N'-79.2831681')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'13', N'PACCHA', N'-6.4973476', N'-78.423322')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'14', N'PION', N'-6.166667', N'-78.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'15', N'QUEROCOTO', N'-6.4', N'-79.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'16', N'SAN JUAN DE LICUPIS', N'-6.4240524', N'-79.242648')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'17', N'TACABAMBA', N'-6.3941905', N'-78.611005')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'18', N'TOCMOCHE', N'-6.4131052', N'-79.3613399')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'04', N'19', N'CHALAMARCA', N'-6.5139395', N'-78.5185197')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'00', N'CONTUMAZÁ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'01', N'CONTUMAZA', N'-7.368658', N'-78.804626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'02', N'CHILETE', N'-7.2207391', N'-78.83968')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'03', N'CUPISNIQUE', N'-7.3442209', N'-78.8370886')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'04', N'GUZMANGO', N'-7.383333', N'-78.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'05', N'SAN BENITO', N'-7.425', N'-78.927403')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'06', N'SANTA CRUZ DE TOLED', N'-7.3442209', N'-78.8370886')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'07', N'TANTARICA', N'-7.2822222', N'-78.9691667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'05', N'08', N'YONAN', N'-7.2554184', N'-79.0945109')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'00', N'CUTERVO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'01', N'CUTERVO', N'-6.380706', N'-78.817978')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'02', N'CALLAYUC', N'-6.133333', N'-79')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'03', N'CHOROS', N'-5.896111', N'-78.690278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'04', N'CUJILLO', N'-6.107046', N'-78.5970229')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'05', N'LA RAMADA', N'-6.2530226', N'-78.5756229')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'06', N'PIMPINGOS', N'-6.0621994', N'-78.7582474')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'07', N'QUEROCOTILLO', N'-6.2796316', N'-79.026305')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'08', N'SAN ANDRES DE CUTERVO', N'-6.380706', N'-78.817978')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'09', N'SAN JUAN DE CUTERVO', N'-6.3895128', N'-78.8172108')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'10', N'SAN LUIS DE LUCMA', N'-6.3', N'-78.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'11', N'SANTA CRUZ', N'-6.6262244', N'-78.9459906')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'12', N'SANTO DOMINGO DE LA CAPILLA', N'-6.3', N'-78.866667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'13', N'SANTO TOMAS', N'-6.1531266', N'-78.685964')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'14', N'SOCOTA', N'-6.314167', N'-78.693932')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'06', N'15', N'TORIBIO CASANOVA', N'-6.3799909', N'-78.8147263')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'07', N'00', N'HUALGAYOC', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'07', N'01', N'BAMBAMARCA', N'-6.6795866', N'-78.5192276')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'07', N'02', N'CHUGUR', N'-6.6712034', N'-78.7383574')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'07', N'03', N'HUALGAYOC', N'-6.76286', N'-78.608063')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'00', N'JAÉN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'01', N'JAEN', N'-5.708333', N'-78.808333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'02', N'BELLAVISTA', N'-5.6581417', N'-78.6880908')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'03', N'CHONTALI', N'-5.644722', N'-79.0875')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'04', N'COLASAY', N'-5.977658', N'-79.068733')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'05', N'HUABAL', N'-5.708333', N'-78.808333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'06', N'LAS PIRIAS', N'-5.626474', N'-78.8538353')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'07', N'POMAHUACA', N'-5.9345929', N'-79.222328')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'08', N'PUCARA', N'-6.039239', N'-79.130863')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'09', N'SALLIQUE', N'-5.654209', N'-79.318031')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'10', N'SAN FELIPE', N'-5.770584', N'-79.313438')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'11', N'SAN JOSE DEL ALTO', N'-5.434563', N'-79.078407')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'08', N'12', N'SANTA ROSA', N'-5.7085649', N'-78.8108323')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'00', N'SAN IGNACIO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'01', N'SAN IGNACIO', N'-5.1465764', N'-79.002342')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'02', N'CHIRINOS', N'-5.301476', N'-78.896858')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'03', N'HUARANGO', N'-5.2714643', N'-78.7752476')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'04', N'LA COIPA', N'-5.1465764', N'-79.002342')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'05', N'NAMBALLE', N'-5.0039977', N'-79.0878065')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'06', N'SAN JOSE DE LOURDES', N'-5.099444', N'-78.891667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'09', N'07', N'TABACONAS', N'-5.312658', N'-79.282959')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'00', N'SAN MARCOS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'01', N'PEDRO GALVEZ', N'-7.335278', N'-78.169722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'02', N'CHANCAY', N'-7.3923281', N'-78.1237686')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'03', N'EDUARDO VILLANUEVA', N'-7.4616134', N'-78.1282264')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'04', N'GREGORIO PITA', N'-7.274886', N'-78.1667567')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'05', N'ICHOCAN', N'-7.364571', N'-78.1271401')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'06', N'JOSE MANUEL QUIROZ', N'-7.335278', N'-78.169722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'10', N'07', N'JOSE SABOGAL', N'-7.250979', N'-78.0368006')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'00', N'SAN MIGUEL', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'01', N'SAN MIGUEL', N'-7.000332', N'-78.852386')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'02', N'BOLIVAR', N'-7.0017627', N'-78.8516128')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'03', N'CALQUIS', N'-7.0066185', N'-78.8442743')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'04', N'CATILLUC', N'-6.801706', N'-78.7772942')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'05', N'EL PRADO', N'-12.1358338', N'-76.9606807')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'06', N'LA FLORIDA', N'-6.8638981', N'-79.1217997')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'07', N'LLAPA', N'-6.979787', N'-78.8078231')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'08', N'NANCHOC', N'-6.9592677', N'-79.2420766')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'09', N'NIEPOS', N'-6.924112', N'-79.124367')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'10', N'SAN GREGORIO', N'-7.05', N'-79.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'11', N'SAN SILVESTRE DE COCHAN', N'-6.9777809', N'-78.7740541')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'12', N'TONGOD', N'-6.7562674', N'-78.824788')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'11', N'13', N'UNION AGUA BLANCA', N'-7.0465643', N'-79.0595622')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'12', N'00', N'SAN PABLO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'12', N'01', N'SAN PABLO', N'-7.115', N'-78.821667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'12', N'02', N'SAN BERNARDINO', N'-7.188092', N'-78.828201')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'12', N'03', N'SAN LUIS', N'-12.0490968', N'-76.980574')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'12', N'04', N'TUMBADEN', N'-7.115', N'-78.821667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'00', N'SANTA CRUZ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'01', N'SANTA CRUZ', N'-6.6245221', N'-78.93522')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'02', N'ANDABAMBA', N'-6.6763361', N'-78.8198591')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'03', N'CATACHE', N'-6.6758708', N'-79.032016')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'04', N'CHANCAYBAÑOS', N'-6.583333', N'-78.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'05', N'LA ESPERANZA', N'-6.5919893', N'-78.8955815')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'06', N'NINABAMBA', N'-6.6763361', N'-78.8198591')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'07', N'PULAN', N'-6.739477', N'-78.9206914')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'08', N'SAUCEPAMPA', N'-6.6910331', N'-78.9168016')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'09', N'SEXI', N'-6.6679953', N'-78.9740725')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'10', N'UTICYACU', N'-6.633333', N'-78.8')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'06', N'13', N'11', N'YAUYUCAN', N'-6.6763361', N'-78.8198591')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'00', N'00', N'CALLAO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'00', N'PROV. CONST. DEL CALLAO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'01', N'CALLAO', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'02', N'BELLAVISTA', N'-12.0581033', N'-77.1449379')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'03', N'CARMEN DE LA LEGUA REYNOSO', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'04', N'LA PERLA', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'05', N'LA PUNTA', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'06', N'VENTANILLA', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'07', N'01', N'07', N'MI PERU', N'-12.0508491', N'-77.1259843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'00', N'00', N'CUSCO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'00', N'CUSCO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'01', N'CUSCO', N'-13.53195', N'-71.9674626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'02', N'CCORCA', N'-13.5832348', N'-72.0601491')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'03', N'POROY', N'-13.5019104', N'-72.0320017')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'04', N'SAN JERONIMO', N'-13.54918', N'-71.893158')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'05', N'SAN SEBASTIAN', N'-13.5300867', N'-71.9380635')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'06', N'SANTIAGO', N'-13.5364771', N'-71.9862918')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'07', N'SAYLLA', N'-13.566667', N'-71.816667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'01', N'08', N'WANCHAQ', N'-13.5346909', N'-71.9490257')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'00', N'ACOMAYO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'01', N'ACOMAYO', N'-13.92399', N'-71.69326')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'02', N'ACOPIA', N'-14.0655', N'-71.491699')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'03', N'ACOS', N'-13.95975', N'-71.744949')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'04', N'MOSOC LLACTA', N'-13.92399', N'-71.69326')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'05', N'POMACANCHI', N'-14.037', N'-71.571')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'06', N'RONDOCAN', N'-13.79169', N'-71.793152')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'02', N'07', N'SANGARARA', N'-13.9569', N'-71.6054')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'00', N'ANTA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'01', N'ANTA', N'-13.479597', N'-72.1110396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'02', N'ANCAHUASI', N'-13.4557', N'-72.3005')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'03', N'CACHIMAYO', N'-13.4794019', N'-72.0660746')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'04', N'CHINCHAYPUJIO', N'-13.479597', N'-72.1110396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'05', N'HUAROCONDO', N'-13.4133237', N'-72.2082487')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'06', N'LIMATAMBO', N'-13.48804', N'-72.4493789')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'07', N'MOLLEPATA', N'-13.51603', N'-72.54776')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'08', N'PUCYURA', N'-13.479597', N'-72.1110396')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'03', N'09', N'ZURITE', N'-13.4555528', N'-72.2555459')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'00', N'CALCA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'01', N'CALCA', N'-13.324084', N'-71.9549533')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'02', N'COYA', N'-13.3882656', N'-71.9030828')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'03', N'LAMAY', N'-13.3645964', N'-71.9208679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'04', N'LARES', N'-13.1053016', N'-72.0445943')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'05', N'PISAC', N'-13.424167', N'-71.857778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'06', N'SAN SALVADOR', N'-13.4932812', N'-71.7844893')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'07', N'TARAY', N'-13.4265254', N'-71.8667683')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'04', N'08', N'YANATILE', N'-13.324084', N'-71.9549533')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'00', N'CANAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'01', N'YANAOCA', N'-14.23146', N'-71.438766')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'02', N'CHECCA', N'-14.4765263', N'-71.3957971')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'03', N'KUNTURKANKI', N'-14.50557', N'-71.155296')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'04', N'LANGUI', N'-14.46031', N'-71.227638')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'05', N'LAYO', N'-14.50557', N'-71.155296')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'06', N'PAMPAMARCA', N'-14.1462865', N'-71.4603621')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'07', N'QUEHUE', N'-14.3808339', N'-71.4551677')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'05', N'08', N'TUPAC AMARU', N'-14.2169651', N'-71.4320747')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'00', N'CANCHIS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'01', N'SICUANI', N'-14.2713299', N'-71.2220832')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'02', N'CHECACUPE', N'-14.03752', N'-71.456909')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'03', N'COMBAPATA', N'-14.1007487', N'-71.4306785')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'04', N'MARANGANI', N'-14.3568964', N'-71.1693594')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'05', N'PITUMARCA', N'-13.9792358', N'-71.4165779')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'06', N'SAN PABLO', N'-14.21527', N'-71.318413')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'07', N'SAN PEDRO', N'-14.1870735', N'-71.3430976')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'06', N'08', N'TINTA', N'-14.144444', N'-71.405556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'00', N'CHUMBIVILCAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'01', N'SANTO TOMAS', N'-14.45', N'-72.080833')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'02', N'CAPACMARCA', N'-14.4208399', N'-72.0468164')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'03', N'CHAMACA', N'-14.3005171', N'-71.8497212')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'04', N'COLQUEMARCA', N'-14.2908', N'-72.044647')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'05', N'LIVITACA', N'-14.3138438', N'-71.6890217')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'06', N'LLUSCO', N'-14.34823', N'-72.121559')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'07', N'QUIÑOTA', N'-14.31779', N'-72.149719')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'07', N'08', N'VELILLE', N'-14.51688', N'-71.88636')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'00', N'ESPINAR', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'01', N'ESPINAR', N'-14.7895845', N'-71.412125')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'02', N'CONDOROMA', N'-15.25055', N'-71.0927279')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'03', N'COPORAQUE', N'-14.7981305', N'-71.5323346')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'04', N'OCORURO', N'-14.7895845', N'-71.412125')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'05', N'PALLPATA', N'-14.7895845', N'-71.412125')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'06', N'PICHIGUA', N'-14.6784615', N'-71.4047033')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'07', N'SUYCKUTAMBO', N'-15.085', N'-71.76223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'08', N'08', N'ALTO PICHIGUA', N'-14.6784615', N'-71.4047033')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'00', N'LA CONVENCIÓN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'01', N'SANTA ANA', N'-12.8684848', N'-72.694957')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'02', N'ECHARATE', N'-12.73574', N'-72.614288')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'03', N'HUAYOPATA', N'-12.99976', N'-72.535667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'04', N'MARANURA', N'-12.94844', N'-72.667999')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'05', N'OCOBAMBA', N'-12.83269', N'-72.317337')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'06', N'QUELLOUNO', N'-12.59594', N'-72.80661')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'07', N'KIMBIRI', N'-12.6187328', N'-73.7874983')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'08', N'SANTA TERESA', N'-13.10534', N'-72.630867')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'09', N'VILCABAMBA', N'-13.1201994', N'-72.976321')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'10', N'PICHARI', N'-12.5177532', N'-73.8271024')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'11', N'INKAWASI', N'-13.25', N'-73.35')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'09', N'12', N'VILLA VIRGEN', N'-13.0026676', N'-73.5130291')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'00', N'PARURO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'01', N'PARURO', N'-13.763333', N'-71.849444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'02', N'ACCHA', N'-13.9705607', N'-71.8326771')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'03', N'CCAPI', N'-13.86157', N'-72.0849379')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'04', N'COLCHA', N'-13.8526595', N'-71.8030225')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'05', N'HUANOQUITE', N'-13.6819889', N'-72.0165932')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'06', N'OMACHA', N'-14.07972', N'-71.74614')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'07', N'PACCARITAMBO', N'-13.763333', N'-71.849444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'08', N'PILLPINTO', N'-13.763333', N'-71.849444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'10', N'09', N'YAURISQUE', N'-13.67337', N'-71.925346')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'00', N'PAUCARTAMBO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'01', N'PAUCARTAMBO', N'-13.315556', N'-71.591667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'02', N'CAICAY', N'-13.597034', N'-71.6962569')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'03', N'CHALLABAMBA', N'-13.2119634', N'-71.6499069')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'04', N'COLQUEPATA', N'-13.3721', N'-71.677223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'05', N'HUANCARANI', N'-13.5034494', N'-71.6559608')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'11', N'06', N'KOSÑIPATA', N'-13.315556', N'-71.591667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'00', N'QUISPICANCHI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'01', N'URCOS', N'-13.686111', N'-71.622778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'02', N'ANDAHUAYLILLAS', N'-13.671111', N'-71.673889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'03', N'CAMANTI', N'-13.2315017', N'-70.754233')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'04', N'CCARHUAYO', N'-13.5300746', N'-71.9554343')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'05', N'CCATCA', N'-13.5300746', N'-71.9554343')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'06', N'CUSIPATA', N'-13.91127', N'-71.502403')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'07', N'HUARO', N'-13.5253841', N'-71.9453208')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'08', N'LUCRE', N'-13.6339254', N'-71.7340737')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'09', N'MARCAPATA', N'-13.50351', N'-70.895042')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'10', N'OCONGATE', N'-13.63372', N'-71.398193')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'11', N'OROPESA', N'-13.597486', N'-71.7666965')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'12', N'12', N'QUIQUIJANA', N'-13.82901', N'-71.539787')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'00', N'URUBAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'01', N'URUBAMBA', N'-13.3057641', N'-72.1156281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'02', N'CHINCHERO', N'-13.3964033', N'-72.0514291')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'03', N'HUAYLLABAMBA', N'-13.3379818', N'-72.0645776')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'04', N'MACHUPICCHU', N'-13.1547062', N'-72.5254412')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'05', N'MARAS', N'-13.332778', N'-72.156389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'06', N'OLLANTAYTAMBO', N'-13.2583689', N'-72.2642679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'08', N'13', N'07', N'YUCAY', N'-13.316667', N'-72.089167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'00', N'00', N'HUANCAVELICA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'00', N'HUANCAVELICA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'01', N'HUANCAVELICA', N'-12.786389', N'-74.975556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'02', N'ACOBAMBILLA', N'-12.67442', N'-75.325157')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'03', N'ACORIA', N'-12.6429', N'-74.8616')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'04', N'CONAYCA', N'-12.5199', N'-75.007')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'05', N'CUENCA', N'-12.786389', N'-74.975556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'06', N'HUACHOCOLPA', N'-13.03502', N'-74.9443129')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'07', N'HUAYLLAHUARA', N'-12.41632', N'-75.178978')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'08', N'IZCUCHACA', N'-12.5006', N'-74.9973')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'09', N'LARIA', N'-12.786389', N'-74.975556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'10', N'MANTA', N'-12.4217301', N'-75.1517603')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'11', N'MARISCAL CACERES', N'-12.7846519', N'-74.988725')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'12', N'MOYA', N'-12.4217301', N'-75.1517603')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'13', N'NUEVO OCCORO', N'-12.60062', N'-75.018517')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'14', N'PALCA', N'-12.6568981', N'-74.9802679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'15', N'PILCHACA', N'-12.4', N'-75.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'16', N'VILCA', N'-12.48564', N'-75.188667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'17', N'YAULI', N'-12.7707', N'-74.8491')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'18', N'ASCENSION', N'-12.7847772', N'-74.9744743')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'01', N'19', N'HUANDO', N'-12.5644', N'-74.9473')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'00', N'ACOBAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'01', N'ACOBAMBA', N'-12.8418', N'-74.5708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'02', N'ANDABAMBA', N'-12.8418', N'-74.5708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'03', N'ANTA', N'-12.8418', N'-74.5708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'04', N'CAJA', N'-12.883333', N'-74.466667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'05', N'MARCAS', N'-12.8902', N'-74.3979')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'06', N'PAUCARA', N'-12.7299', N'-74.6662')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'07', N'POMACOCHA', N'-12.85', N'-74.516667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'02', N'08', N'ROSARIO', N'-12.8418', N'-74.5708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'00', N'ANGARAES', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'01', N'LIRCAY', N'-12.9896', N'-74.7205')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'02', N'ANCHONGA', N'-12.9131', N'-74.6914')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'03', N'CALLANMARCA', N'-12.8669', N'-74.6231')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'04', N'CCOCHACCASA', N'-12.9275', N'-74.77')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'05', N'CHINCHO', N'-12.9936125', N'-74.3693626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'06', N'CONGALLA', N'-12.9601749', N'-74.4921261')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'07', N'HUANCA-HUANCA', N'-12.9189', N'-74.6101')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'08', N'HUAYLLAY GRANDE', N'-12.9424', N'-74.7018')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'09', N'JULCAMARCA', N'-13.02483', N'-74.448357')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'10', N'SAN ANTONIO DE ANTAPARCO', N'-12.9900984', N'-74.6868815')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'11', N'SANTO TOMAS DE PATA', N'-12.9900984', N'-74.6868815')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'03', N'12', N'SECCLLA', N'-13.0512', N'-74.4839')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'00', N'CASTROVIRREYNA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'01', N'CASTROVIRREYNA', N'-13.28918', N'-75.318153')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'02', N'ARMA', N'-13.13736', N'-75.54245')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'03', N'AURAHUA', N'-13.04519', N'-75.573677')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'04', N'CAPILLAS', N'-13.2136265', N'-75.4344727')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'05', N'CHUPAMARCA', N'-13.2136265', N'-75.4344727')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'06', N'COCAS', N'-13.1092708', N'-75.6579602')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'07', N'HUACHOS', N'-13.24679', N'-75.534477')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'08', N'HUAMATAMBO', N'-12.785907', N'-74.9787157')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'09', N'MOLLEPAMPA', N'-13.3112', N'-75.41')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'10', N'SAN JUAN', N'-12.9827778', N'-75.1572222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'11', N'SANTA ANA', N'-13.0730531', N'-75.1397677')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'12', N'TANTARA', N'-13.0739', N'-75.6447')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'04', N'13', N'TICRAPO', N'-13.3833585', N'-75.4361391')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'00', N'CHURCAMPA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'01', N'CHURCAMPA', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'02', N'ANCO', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'03', N'CHINCHIHUASI', N'-12.5170504', N'-74.5453324')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'04', N'EL CARMEN', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'05', N'LA MERCED', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'06', N'LOCROJA', N'-12.70587', N'-74.464996')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'07', N'PAUCARBAMBA', N'-12.55', N'-74.55')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'08', N'SAN MIGUEL DE MAYOCC', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'09', N'SAN PEDRO DE CORIS', N'-12.5782849', N'-74.4103707')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'10', N'PACHAMARCA', N'-12.7392', N'-74.3877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'05', N'11', N'COSME', N'-12.54866', N'-74.6698')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'00', N'HUAYTARÁ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'01', N'HUAYTARA', N'-13.604444', N'-75.353111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'02', N'AYAVI', N'-13.70855', N'-75.346451')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'03', N'CORDOVA', N'-14.04605', N'-75.185898')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'04', N'HUAYACUNDO ARMA', N'-13.534', N'-75.3146')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'05', N'LARAMARCA', N'-13.833333', N'-75.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'06', N'OCOYO', N'-14.05', N'-74.966667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'07', N'PILPICHACA', N'-13.3261109', N'-74.9975')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'08', N'QUERCO', N'-13.982222', N'-74.975556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'09', N'QUITO-ARMA', N'-13.5285', N'-75.3276')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'10', N'SAN ANTONIO DE CUSICANCHA', N'-13.50116', N'-75.294937')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'11', N'SAN FRANCISCO DE SANGAYAICO', N'-13.795', N'-75.249')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'12', N'SAN ISIDRO', N'-13.604444', N'-75.353111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'13', N'SANTIAGO DE CHOCORVOS', N'-13.8254042', N'-75.2575976')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'14', N'SANTIAGO DE QUIRAHUARA', N'-13.604444', N'-75.353111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'15', N'SANTO DOMINGO DE CAPILLAS', N'-13.604444', N'-75.353111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'06', N'16', N'TAMBO', N'-13.6891917', N'-75.2753168')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'00', N'TAYACAJA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'01', N'PAMPAS', N'-12.3992902', N'-74.8659421')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'02', N'ACOSTAMBO', N'-12.36265', N'-75.060783')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'03', N'ACRAQUIA', N'-12.4068', N'-74.9014')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'04', N'AHUAYCHA', N'-12.4074', N'-74.8914')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'05', N'COLCABAMBA', N'-12.4', N'-74.7')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'06', N'DANIEL HERNANDEZ', N'-12.3773561', N'-74.8536372')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'07', N'HUACHOCOLPA', N'-11.983333', N'-74.516667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'09', N'HUARIBAMBA', N'-12.266667', N'-74.95')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'10', N'ÑAHUIMPUQUIO', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'11', N'PAZOS', N'-12.26767', N'-75.072388')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'13', N'QUISHUAR', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'14', N'SALCABAMBA', N'-12.16473', N'-74.900963')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'15', N'SALCAHUASI', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'16', N'SAN MARCOS DE ROCCHAC', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'17', N'SURCUBAMBA', N'-12.1163', N'-74.6302')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'18', N'TINTAY PUNCU', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'19', N'QUICHUAS', N'-12.4726152', N'-74.7675419')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'09', N'07', N'20', N'ANDAYMARCA', N'-12.2866576', N'-74.8741045')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'00', N'00', N'HUÁNUCO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'00', N'HUÁNUCO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'01', N'HUANUCO', N'-9.9298454', N'-76.2432653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'02', N'AMARILIS', N'-9.941667', N'-76.240278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'03', N'CHINCHAO', N'-9.633333', N'-76.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'04', N'CHURUBAMBA', N'-9.833333', N'-76.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'05', N'MARGOS', N'-10.0054766', N'-76.5224188')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'06', N'QUISQUI (KICHKI)', N'-9.9298454', N'-76.2432653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'07', N'SAN FRANCISCO DE CAYRAN', N'-9.9298454', N'-76.2432653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'08', N'SAN PEDRO DE CHAULAN', N'-10.0560366', N'-76.485529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'09', N'SANTA MARIA DEL VALLE', N'-9.8622904', N'-76.1696791')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'10', N'YARUMAYO', N'-9.95', N'-76.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'11', N'PILLCO MARCA', N'-9.9583593', N'-76.2508086')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'01', N'12', N'YACUS', N'-9.9298454', N'-76.2432653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'00', N'AMBO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'01', N'AMBO', N'-10.133333', N'-76.2')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'02', N'CAYNA', N'-10.233333', N'-76.4')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'03', N'COLPAS', N'-10.233333', N'-76.4')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'04', N'CONCHAMARCA', N'-10.05', N'-76.166667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'05', N'HUACAR', N'-10.1597498', N'-76.2334278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'06', N'SAN FRANCISCO', N'-10.3429185', N'-76.291355')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'07', N'SAN RAFAEL', N'-10.32553', N'-76.087997')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'02', N'08', N'TOMAY KICHWA', N'-10.133333', N'-76.2')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'00', N'DOS DE MAYO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'01', N'LA UNION', N'-9.7744129', N'-76.785759')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'07', N'CHUQUIS', N'-9.6781738', N'-76.7033471')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'11', N'MARIAS', N'-9.6073986', N'-76.7033471')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'13', N'PACHAS', N'-9.642799', N'-76.7736769')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'16', N'QUIVILLA', N'-9.548008', N'-76.66935')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'17', N'RIPAN', N'-9.5900174', N'-76.5025742')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'21', N'SHUNQUI', N'-9.5900174', N'-76.5025742')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'22', N'SILLAPATA', N'-9.5900174', N'-76.5025742')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'03', N'23', N'YANAS', N'-9.5900174', N'-76.5025742')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'04', N'00', N'HUACAYBAMBA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'04', N'01', N'HUACAYBAMBA', N'-9.0369777', N'-76.9535038')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'04', N'02', N'CANCHABAMBA', N'-9.0369777', N'-76.9535038')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'04', N'03', N'COCHABAMBA', N'-9.0950095', N'-76.8366194')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'04', N'04', N'PINRA', N'-8.913432', N'-76.889427')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'00', N'HUAMALÍES', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'01', N'LLATA', N'-9.434236', N'-76.782417')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'02', N'ARANCAY', N'-9.3746119', N'-76.5488232')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'03', N'CHAVIN DE PARIARCA', N'-9.4241077', N'-76.7700807')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'04', N'JACAS GRANDE', N'-9.4', N'-76.566667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'05', N'JIRCAN', N'-9.2459156', N'-76.7195828')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'06', N'MIRAFLORES', N'-9.333333', N'-76.75')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'07', N'MONZON', N'-9.2150194', N'-76.2128664')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'08', N'PUNCHAO', N'-9.4611795', N'-76.8209606')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'09', N'PUÑOS', N'-9.5028572', N'-76.8850673')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'10', N'SINGA', N'-9.27793', N'-76.7193829')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'05', N'11', N'TANTAMAYO', N'-9.3929796', N'-76.7188613')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'00', N'LEONCIO PRADO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'01', N'RUPA-RUPA', N'-9.0072526', N'-75.9927652')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'02', N'DANIEL ALOMIA ROBLES', N'-9.0072526', N'-75.9927652')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'03', N'HERMILIO VALDIZAN', N'-9.113689', N'-75.846832')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'04', N'JOSE CRESPO Y CASTILLO', N'-8.9323927', N'-76.105122')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'05', N'LUYANDO', N'-9.0072526', N'-75.9927652')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'06', N'06', N'MARIANO DAMASO BERAUN', N'-9.385742', N'-76.0043731')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'07', N'00', N'MARAÑÓN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'07', N'01', N'HUACRACHUCO', N'-8.637081', N'-77.068703')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'07', N'02', N'CHOLON', N'-8.7385018', N'-76.2325749')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'07', N'03', N'SAN BUENAVENTURA', N'-8.6900569', N'-76.7336521')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'08', N'00', N'PACHITEA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'08', N'01', N'PANAO', N'-9.8998206', N'-75.9922372')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'08', N'02', N'CHAGLLA', N'-9.8441095', N'-75.8984154')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'08', N'03', N'MOLINO', N'-9.883333', N'-76.05')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'08', N'04', N'UMARI', N'-9.8447222', N'-76.0575')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'00', N'PUERTO INCA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'01', N'PUERTO INCA', N'-9.3775677', N'-74.9647145')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'02', N'CODO DEL POZUZO', N'-9.6734062', N'-75.4621467')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'03', N'HONORIA', N'-8.7695621', N'-74.7088325')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'04', N'TOURNAVISTA', N'-8.929933', N'-74.7059059')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'09', N'05', N'YUYAPICHIS', N'-9.6277897', N'-74.9749415')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'00', N'LAURICOCHA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'01', N'JESUS', N'-10.0340399', N'-76.581879')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'02', N'BAÑOS', N'-10.072778', N'-76.733611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'03', N'JIVIA', N'-10.0231658', N'-76.6809744')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'04', N'QUEROPALCA', N'-10.072778', N'-76.733611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'05', N'RONDOS', N'-9.980556', N'-76.686111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'06', N'SAN FRANCISCO DE ASIS', N'-10.316667', N'-76.7')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'10', N'07', N'SAN MIGUEL DE CAURI', N'-10.10712', N'-76.601273')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'00', N'YAROWILCA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'01', N'CHAVINILLO', N'-9.783333', N'-76.583333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'02', N'CAHUAC', N'-9.8535874', N'-76.631796')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'03', N'CHACABAMBA', N'-9.7678836', N'-76.5950555')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'04', N'APARICIO POMARES', N'-9.7678836', N'-76.5950555')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'05', N'JACAS CHICO', N'-9.866667', N'-76.533333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'06', N'OBAS', N'-9.771006', N'-76.6613239')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'07', N'PAMPAMARCA', N'-9.7054114', N'-76.7033471')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'10', N'11', N'08', N'CHORAS', N'-9.9301545', N'-76.5603828')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'00', N'00', N'ICA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'00', N'ICA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'01', N'ICA', N'-14.07546', N'-75.7341811')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'02', N'LA TINGUIÑA', N'-14.039', N'-75.7121')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'03', N'LOS AQUIJES', N'-14.0963', N'-75.6914')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'04', N'OCUCAJE', N'-14.3562', N'-75.6769489')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'05', N'PACHACUTEC', N'-14.1523', N'-75.6917')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'06', N'PARCONA', N'-14.0541843', N'-75.6999842')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'07', N'PUEBLO NUEVO', N'-14.1296017', N'-75.707022')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'08', N'SALAS', N'-13.4779896', N'-76.175838')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'09', N'SAN JOSE DE LOS MOLINOS', N'-13.9329', N'-75.6709')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'10', N'SAN JUAN BAUTISTA', N'-14.0113', N'-75.7351')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'11', N'SANTIAGO', N'-14.1856', N'-75.7146')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'12', N'SUBTANJALLA', N'-14.0202665', N'-75.763151')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'13', N'TATE', N'-14.1573211', N'-75.7015587')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'01', N'14', N'YAUCA DEL ROSARIO', N'-14.1395407', N'-75.5753382')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'00', N'CHINCHA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'01', N'CHINCHA ALTA', N'-13.42553', N'-76.136711')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'02', N'ALTO LARAN', N'-13.4426', N'-76.0829')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'03', N'CHAVIN', N'-13.4193404', N'-76.1303678')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'04', N'CHINCHA BAJA', N'-13.459', N'-76.1617')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'05', N'EL CARMEN', N'-13.4998', N'-76.0575')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'06', N'GROCIO PRADO', N'-13.3577348', N'-76.1899661')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'07', N'PUEBLO NUEVO', N'-14.0692867', N'-75.7251143')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'08', N'SAN JUAN DE YANAC', N'-13.22288', N'-75.794434')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'09', N'SAN PEDRO DE HUACARPANA', N'-13.1210331', N'-75.7836589')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'10', N'SUNAMPE', N'-13.4272965', N'-76.1642459')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'02', N'11', N'TAMBO DE MORA', N'-13.4585', N'-76.1827')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'00', N'NAZCA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'01', N'NASCA', N'-14.8358687', N'-74.9327583')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'02', N'CHANGUILLO', N'-14.67278', N'-75.225304')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'03', N'EL INGENIO', N'-14.65067', N'-75.0634')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'04', N'MARCONA', N'-15.3617', N'-75.1666')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'03', N'05', N'VISTA ALEGRE', N'-14.8478001', N'-74.9427223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'00', N'PALPA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'01', N'PALPA', N'-14.5337', N'-75.1852')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'02', N'LLIPATA', N'-14.5376236', N'-75.1838713')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'03', N'RIO GRANDE', N'-14.5201', N'-75.2015')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'04', N'SANTA CRUZ', N'-14.50873', N'-75.245148')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'04', N'05', N'TIBILLO', N'-14.4165591', N'-75.2063942')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'00', N'PISCO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'01', N'PISCO', N'-13.709981', N'-76.203206')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'02', N'HUANCANO', N'-13.60609', N'-75.624092')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'03', N'HUMAY', N'-13.72334', N'-75.893738')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'04', N'INDEPENDENCIA', N'-13.7305084', N'-76.2223731')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'05', N'PARACAS', N'-13.8409149', N'-76.2508304')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'06', N'SAN ANDRES', N'-13.7308', N'-76.2213')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'07', N'SAN CLEMENTE', N'-13.6808', N'-76.1575')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'11', N'05', N'08', N'TUPAC AMARU INCA', N'-13.7131766', N'-76.1529055')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'00', N'00', N'JUNÍN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'00', N'HUANCAYO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'01', N'HUANCAYO', N'-12.0540664', N'-75.1953934')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'04', N'CARHUACALLANGA', N'-12.0734849', N'-75.2116648')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'05', N'CHACAPAMPA', N'-12.0686357', N'-75.2102976')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'06', N'CHICCHE', N'-12.0734849', N'-75.2116648')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'07', N'CHILCA', N'-12.0791642', N'-75.2021575')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'08', N'CHONGOS ALTO', N'-12.28572', N'-75.327972')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'11', N'CHUPURO', N'-12.1450047', N'-75.2278626')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'12', N'COLCA', N'-12.32828', N'-75.2310789')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'13', N'CULLHUAS', N'-12.23146', N'-75.164368')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'14', N'EL TAMBO', N'-12.0272165', N'-75.2128996')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'16', N'HUACRAPUQUIO', N'-12.0734849', N'-75.2116648')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'17', N'HUALHUAS', N'-11.9720885', N'-75.2535674')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'19', N'HUANCAN', N'-12.1076823', N'-75.2099821')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'20', N'HUASICANCHA', N'-12.32137', N'-75.298729')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'21', N'HUAYUCACHI', N'-12.15024', N'-75.229111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'22', N'INGENIO', N'-11.8901631', N'-75.2665')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'24', N'PARIAHUANCA', N'-11.97884', N'-74.936272')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'25', N'PILCOMAYO', N'-12.0442537', N'-75.2535192')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'26', N'PUCARA', N'-11.8822222', N'-74.925')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'27', N'QUICHUAY', N'-11.8887963', N'-75.2865498')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'28', N'QUILCAS', N'-11.9400813', N'-75.258844')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'29', N'SAN AGUSTIN', N'-12.0496067', N'-75.1984167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'30', N'SAN JERONIMO DE TUNAN', N'-11.9495581', N'-75.2823806')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'32', N'SAÑO', N'-11.9595235', N'-75.258844')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'33', N'SAPALLANGA', N'-12.1437238', N'-75.1621968')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'34', N'SICAYA', N'-12.015194', N'-75.28015')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'35', N'SANTO DOMINGO DE ACOBAMBA', N'-11.80203', N'-74.778511')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'01', N'36', N'VIQUES', N'-12.18217', N'-75.221817')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'00', N'CONCEPCIÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'01', N'CONCEPCION', N'-11.918478', N'-75.312889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'02', N'ACO', N'-11.9589659', N'-75.3659943')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'03', N'ANDAMARCA', N'-11.73691', N'-74.825752')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'04', N'CHAMBARA', N'-12.0271668', N'-75.3743736')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'05', N'COCHAS', N'-11.6311111', N'-75.1352778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'06', N'COMAS', N'-11.722374', N'-75.0826507')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'07', N'HEROINAS TOLEDO', N'-11.9138073', N'-75.3162253')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'08', N'MANZANARES', N'-12.0203438', N'-75.3441329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'09', N'MARISCAL CASTILLA', N'-11.944249', N'-75.2952504')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'10', N'MATAHUASI', N'-11.8920309', N'-75.3477767')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'11', N'MITO', N'-11.9373954', N'-75.3390315')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'12', N'NUEVE DE JULIO', N'-11.9174624', N'-75.3138757')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'13', N'ORCOTUNA', N'-11.9684535', N'-75.3091483')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'14', N'SAN JOSE DE QUERO', N'-12.09778', N'-75.547478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'02', N'15', N'SANTA ROSA DE OCOPA', N'-11.8773455', N'-75.293111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'00', N'CHANCHAMAYO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'01', N'CHANCHAMAYO', N'-11.124722', N'-75.356944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'02', N'PERENE', N'-10.947222', N'-75.226111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'03', N'PICHANAQUI', N'-10.9265815', N'-74.8745545')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'04', N'SAN LUIS DE SHUARO', N'-10.888419', N'-75.290195')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'05', N'SAN RAMON', N'-11.124722', N'-75.356944')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'03', N'06', N'VITOC', N'-11.2085735', N'-75.3353875')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'00', N'JAUJA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'01', N'JAUJA', N'-11.775', N'-75.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'02', N'ACOLLA', N'-11.73804', N'-75.547943')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'03', N'APATA', N'-11.8542782', N'-75.3557927')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'04', N'ATAURA', N'-11.8024518', N'-75.439571')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'05', N'CANCHAYLLO', N'-11.82198', N'-75.730667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'06', N'CURICACA', N'-11.775', N'-75.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'07', N'EL MANTARO', N'-11.822224', N'-75.3929523')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'08', N'HUAMALI', N'-11.8073201', N'-75.4264609')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'09', N'HUARIPAMPA', N'-11.8090872', N'-75.4737974')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'10', N'HUERTAS', N'-11.7659957', N'-75.4723411')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'11', N'JANJAILLO', N'-11.7893516', N'-75.4244579')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'12', N'JULCAN', N'-11.7607554', N'-75.4381143')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'13', N'LEONOR ORDOÑEZ', N'-11.775', N'-75.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'14', N'LLOCLLAPAMPA', N'-11.775', N'-75.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'15', N'MARCO', N'-11.7386611', N'-75.5611485')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'16', N'MASMA', N'-11.7843129', N'-75.4242758')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'17', N'MASMA CHICCHE', N'-11.7860043', N'-75.3817865')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'18', N'MOLINOS', N'-11.7382104', N'-75.444669')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'19', N'MONOBAMBA', N'-11.3625301', N'-75.3237262')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'20', N'MUQUI', N'-11.83294', N'-75.42997')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'21', N'MUQUIYAUYO', N'-11.8163553', N'-75.4534081')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'22', N'PACA', N'-11.7126152', N'-75.5131117')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'23', N'PACCHA', N'-11.8532073', N'-75.508016')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'24', N'PANCAN', N'-11.748639', N'-75.4854472')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'25', N'PARCO', N'-11.83314', N'-75.636681')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'26', N'POMACANCHA', N'-11.7', N'-75.666667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'27', N'RICRAN', N'-11.775', N'-75.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'28', N'SAN LORENZO', N'-11.8460153', N'-75.3834811')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'29', N'SAN PEDRO DE CHUNAN', N'-11.7265971', N'-75.4883595')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'30', N'SAUSA', N'-11.7938523', N'-75.4846036')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'31', N'SINCOS', N'-11.8913253', N'-75.3871239')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'32', N'TUNAN MARCA', N'-11.7194156', N'-75.5917092')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'33', N'YAULI', N'-11.7147532', N'-75.4737974')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'04', N'34', N'YAUYOS', N'-11.7833189', N'-75.4950848')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'05', N'00', N'JUNÍN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'05', N'01', N'JUNIN', N'-11.15', N'-75.983333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'05', N'02', N'CARHUAMAYO', N'-10.9207843', N'-76.0594972')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'05', N'03', N'ONDORES', N'-11.06612', N'-76.158401')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'05', N'04', N'ULCUMAYO', N'-10.9688336', N'-75.8780855')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'00', N'SATIPO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'01', N'SATIPO', N'-11.254228', N'-74.636736')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'02', N'COVIRIALI', N'-11.2529018', N'-74.6400555')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'03', N'LLAYLLA', N'-11.4317888', N'-74.4848003')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'04', N'MAZAMARI', N'-11.3322542', N'-74.528751')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'05', N'PAMPA HERMOSA', N'-11.3782685', N'-74.7517705')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'06', N'PANGOA', N'-11.4317888', N'-74.4848003')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'07', N'RIO NEGRO', N'-11.2084381', N'-74.6590728')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'06', N'08', N'RIO TAMBO', N'-11.165556', N'-74.235278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'00', N'TARMA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'01', N'TARMA', N'-11.4193347', N'-75.6889493')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'02', N'ACOBAMBA', N'-11.353', N'-75.6603')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'03', N'HUARICOLCA', N'-11.5090653', N'-75.6528116')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'04', N'HUASAHUASI', N'-11.2648012', N'-75.6491753')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'05', N'LA UNION', N'-11.4142107', N'-75.6831714')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'06', N'PALCA', N'-11.346389', N'-75.568333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'07', N'PALCAMAYO', N'-11.2957096', N'-75.7727595')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'08', N'SAN PEDRO DE CAJAS', N'-11.2493815', N'-75.8577528')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'07', N'09', N'TAPO', N'-11.3901242', N'-75.5636954')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'00', N'YAULI ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'01', N'LA OROYA', N'-11.5254018', N'-75.8984154')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'02', N'CHACAPALPA', N'-11.72447', N'-75.773888')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'03', N'HUAY-HUAY', N'-11.0788889', N'-76.3969444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'04', N'MARCAPOMACOCHA', N'-11.4071923', N'-76.3369549')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'05', N'MOROCOCHA', N'-11.61131', N'-76.139236')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'06', N'PACCHA', N'-11.4749953', N'-75.9586615')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'07', N'SANTA BARBARA DE CARHUACAYAN', N'-11.20841', N'-76.288498')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'08', N'SANTA ROSA DE SACCO', N'-11.580292', N'-75.95721')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'09', N'SUITUCANCHA', N'-11.7747715', N'-75.9199905')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'08', N'10', N'YAULI', N'-11.6807308', N'-76.0943011')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'00', N'CHUPACA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'01', N'CHUPACA', N'-12.062003', N'-75.287178')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'02', N'AHUAC', N'-12.0781283', N'-75.3131574')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'03', N'CHONGOS BAJO', N'-12.1330922', N'-75.2683228')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'04', N'HUACHAC', N'-12', N'-75.333333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'05', N'HUAMANCACA CHICO', N'-12.0866548', N'-75.2406085')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'06', N'SAN JUAN DE ISCOS', N'-12.1003084', N'-75.292382')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'07', N'SAN JUAN DE JARPA', N'-12.1199024', N'-75.437386')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'08', N'TRES DE DICIEMBRE', N'-12.0842334', N'-75.2049237')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'12', N'09', N'09', N'YANACANCHA', N'-12.2', N'-75.416667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'00', N'00', N'LA LIBERTAD', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'00', N'TRUJILLO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'01', N'TRUJILLO', N'-8.1090524', N'-79.0215336')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'02', N'EL PORVENIR', N'-8.0615088', N'-79.0067016')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'03', N'FLORENCIA DE MORA', N'-8.081258', N'-79.023378')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'04', N'HUANCHACO', N'-8.0884404', N'-79.0872788')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'05', N'LA ESPERANZA', N'-8.0580651', N'-79.0552494')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'06', N'LAREDO', N'-8.086531', N'-78.959819')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'07', N'MOCHE', N'-8.166667', N'-79')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'08', N'POROTO', N'-8.011464', N'-78.767983')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'09', N'SALAVERRY', N'-8.221394', N'-78.976381')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'10', N'SIMBAL', N'-7.976347', N'-78.813633')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'01', N'11', N'VICTOR LARCO HERRERA', N'-8.133333', N'-79.05')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'00', N'ASCOPE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'01', N'ASCOPE', N'-7.7146867', N'-79.1071344')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'02', N'CHICAMA', N'-7.844742', N'-79.146956')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'03', N'CHOCOPE', N'-7.791794', N'-79.222806')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'04', N'MAGDALENA DE CAO', N'-7.877344', N'-79.294517')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'05', N'PAIJAN', N'-7.73115', N'-79.303875')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'06', N'RAZURI', N'-7.7126099', N'-79.390716')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'07', N'SANTIAGO DE CAO', N'-7.959225', N'-79.241892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'02', N'08', N'CASA GRANDE', N'-7.744583', N'-79.188144')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'00', N'BOLÍVAR ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'01', N'BOLIVAR', N'-7.1492232', N'-77.7065754')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'02', N'BAMBAMARCA', N'-7.4404366', N'-77.6915479')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'03', N'CONDORMARCA', N'-7.5427122', N'-77.5886558')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'04', N'LONGOTEA', N'-7.043508', N'-77.873172')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'05', N'UCHUMARCA', N'-7.0469809', N'-77.8045618')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'03', N'06', N'UCUNCHA', N'-7.1658799', N'-77.8603108')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'04', N'00', N'CHEPÉN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'04', N'01', N'CHEPEN', N'-7.227131', N'-79.429836')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'04', N'02', N'PACANGA', N'-7.171356', N'-79.485836')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'04', N'03', N'PUEBLO NUEVO', N'-7.189056', N'-79.5136')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'05', N'00', N'JULCÁN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'05', N'01', N'JULCAN', N'-8.0442754', N'-78.4880543')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'05', N'02', N'CALAMARCA', N'-8.1705968', N'-78.4105275')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'05', N'03', N'CARABAMBA', N'-8.1127439', N'-78.6077497')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'05', N'04', N'HUASO', N'-8.2247451', N'-78.4137263')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'00', N'OTUZCO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'01', N'OTUZCO', N'-7.9035359', N'-78.5646656')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'02', N'AGALLPAMPA', N'-7.9823215', N'-78.5457801')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'04', N'CHARAT', N'-7.8236568', N'-78.4478594')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'05', N'HUARANCHAL', N'-7.6897944', N'-78.4418001')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'06', N'LA CUESTA', N'-7.918516', N'-78.705509')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'08', N'MACHE', N'-8.030556', N'-78.534722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'10', N'PARANDAY', N'-7.8850869', N'-78.70971')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'11', N'SALPO', N'-8', N'-78.616667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'13', N'SINSICAP', N'-7.8505288', N'-78.7554137')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'06', N'14', N'USQUIL', N'-7.8165708', N'-78.416925')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'00', N'PACASMAYO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'01', N'SAN PEDRO DE LLOC', N'-7.416667', N'-79.5')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'02', N'GUADALUPE', N'-7.246867', N'-79.473103')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'03', N'JEQUETEPEQUE', N'-7.3379214', N'-79.5630919')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'04', N'PACASMAYO', N'-7.4040051', N'-79.565078')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'07', N'05', N'SAN JOSE', N'-7.347211', N'-79.4577314')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'00', N'PATAZ ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'01', N'TAYABAMBA', N'-8.276667', N'-77.296389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'02', N'BULDIBUYO', N'-8.1266534', N'-77.3948829')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'03', N'CHILLIA', N'-8.1243632', N'-77.5146453')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'04', N'HUANCASPATA', N'-8.2825504', N'-77.2967416')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'05', N'HUAYLILLAS', N'-8.189186', N'-77.319061')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'06', N'HUAYO', N'-8.0047566', N'-77.5923877')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'07', N'ONGON', N'-8.2090919', N'-76.9830277')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'08', N'PARCOY', N'-8.0340519', N'-77.4798769')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'09', N'PATAZ', N'-7.7877469', N'-77.5948946')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'10', N'PIAS', N'-7.8719207', N'-77.5465368')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'11', N'SANTIAGO DE CHALLAS', N'-8.4388642', N'-77.3205965')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'12', N'TAURIJA', N'-8.3089874', N'-77.4228625')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'08', N'13', N'URPAY', N'-8.3478186', N'-77.3895014')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'00', N'SÁNCHEZ CARRIÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'01', N'HUAMACHUCO', N'-7.816461', N'-78.0452048')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'02', N'CHUGAY', N'-7.7817534', N'-77.8688851')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'03', N'COCHORCO', N'-7.8096126', N'-77.687075')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'04', N'CURGOS', N'-7.8612166', N'-77.9417391')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'05', N'MARCABAL', N'-7.7061422', N'-78.0327377')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'06', N'SANAGORAN', N'-7.7865645', N'-78.1414598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'07', N'SARIN', N'-7.9329235', N'-77.8595963')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'09', N'08', N'SARTIMBAMBA', N'-7.6992269', N'-77.7434198')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'00', N'SANTIAGO DE CHUCO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'01', N'SANTIAGO DE CHUCO', N'-8.1468836', N'-78.1721189')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'02', N'ANGASMARCA', N'-8.132709', N'-78.0552079')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'03', N'CACHICADAN', N'-8.0932859', N'-78.1500297')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'04', N'MOLLEBAMBA', N'-8.1711489', N'-77.9731512')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'05', N'MOLLEPATA', N'-8.191194', N'-77.955389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'06', N'QUIRUVILCA', N'-8.0023449', N'-78.3095598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'07', N'SANTA CRUZ DE CHUCA', N'-8.1202057', N'-78.1425468')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'10', N'08', N'SITABAMBA', N'-8.0212573', N'-77.7294705')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'11', N'00', N'GRAN CHIMÚ ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'11', N'01', N'CASCAS', N'-7.479722', N'-78.817778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'11', N'02', N'LUCMA', N'-7.6406393', N'-78.5525873')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'11', N'03', N'MARMOT', N'-7.5934228', N'-78.7022678')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'11', N'04', N'SAYAPULLO', N'-7.594182', N'-78.466042')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'12', N'00', N'VIRÚ ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'12', N'01', N'VIRU', N'-8.4165648', N'-78.7518716')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'12', N'02', N'CHAO', N'-8.540297', N'-78.677489')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'13', N'12', N'03', N'GUADALUPITO', N'-8.951186', N'-78.624864')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'00', N'00', N'LAMBAYEQUE', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'00', N'CHICLAYO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'01', N'CHICLAYO', N'-6.7765974', N'-79.8442978')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'02', N'CHONGOYAPE', N'-6.6376499', N'-79.3887901')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'03', N'ETEN', N'-6.9118212', N'-79.8660836')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'04', N'ETEN PUERTO', N'-6.9066715', N'-79.8588208')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'05', N'JOSE LEONARDO ORTIZ', N'-6.7448809', N'-79.8464804')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'06', N'LA VICTORIA', N'-6.797698', N'-79.8464804')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'07', N'LAGUNAS', N'-7.0533253', N'-79.7189719')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'08', N'MONSEFU', N'-6.877836', N'-79.871867')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'09', N'NUEVA ARICA', N'-6.8726113', N'-79.3423312')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'10', N'OYOTUN', N'-6.851955', N'-79.3043021')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'11', N'PICSI', N'-6.7195469', N'-79.7708275')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'12', N'PIMENTEL', N'-6.8324793', N'-79.929616')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'13', N'REQUE', N'-6.8631248', N'-79.8156667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'14', N'SANTA ROSA', N'-6.8759629', N'-79.9220686')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'15', N'SAÑA', N'-6.90821', N'-79.5772008')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'16', N'CAYALTI', N'-6.886811', N'-79.5659633')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'17', N'PATAPO', N'-6.7376852', N'-79.6305599')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'18', N'POMALCA', N'-6.768777', N'-79.7820735')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'19', N'PUCALA', N'-6.7807732', N'-79.6095008')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'01', N'20', N'TUMAN', N'-6.7418146', N'-79.7007211')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'00', N'FERREÑAFE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'01', N'FERREÑAFE', N'-6.6382226', N'-79.7904475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'02', N'CAÑARIS', N'-6.6404975', N'-79.7969281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'03', N'INCAHUASI', N'-6.6400667', N'-79.7920239')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'04', N'MANUEL ANTONIO MESONES MURO', N'-6.6400667', N'-79.7920239')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'05', N'PITIPO', N'-6.5664', N'-79.7808')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'02', N'06', N'PUEBLO NUEVO', N'-6.6404975', N'-79.7969281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'00', N'LAMBAYEQUE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'01', N'LAMBAYEQUE', N'-6.7', N'-79.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'02', N'CHOCHOPE', N'-6.7', N'-79.9')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'03', N'ILLIMO', N'-6.4711647', N'-79.8576828')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'04', N'JAYANCA', N'-6.3929812', N'-79.8226708')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'05', N'MOCHUMI', N'-6.544167', N'-79.864167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'06', N'MORROPE', N'-6.5413435', N'-80.0129679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'07', N'MOTUPE', N'-6.1512014', N'-79.7147468')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'08', N'OLMOS', N'-5.9873416', N'-79.7455956')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'09', N'PACORA', N'-6.4141438', N'-79.8968798')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'10', N'SALAS', N'-6.2746751', N'-79.6080967')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'11', N'SAN JOSE', N'-6.764576', N'-79.9682293')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'14', N'03', N'12', N'TUCUME', N'-6.5130072', N'-79.8464804')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'00', N'00', N'LIMA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'00', N'LIMA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'01', N'LIMA', N'-12.046374', N'-77.0427934')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'02', N'ANCON', N'-11.733333', N'-77.15')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'03', N'ATE', N'-12.0266998', N'-76.8895843')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'04', N'BARRANCO', N'-12.141667', N'-77.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'05', N'BREÑA', N'-12.0584783', N'-77.0506617')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'06', N'CARABAYLLO', N'-11.85', N'-77.033333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'07', N'CHACLACAYO', N'-11.983333', N'-76.766667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'08', N'CHORRILLOS', N'-12.1936474', N'-76.9834123')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'09', N'CIENEGUILLA', N'-12.1815714', N'-76.940905')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'10', N'COMAS', N'-11.9299805', N'-77.053541')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'11', N'EL AGUSTINO', N'-12.0479963', N'-77.0006529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'12', N'INDEPENDENCIA', N'-11.9929208', N'-77.0518169')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'13', N'JESUS MARIA', N'-12.0750295', N'-77.0435289')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'14', N'LA MOLINA', N'-12.0820196', N'-76.928234')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'15', N'LA VICTORIA', N'-12.0734497', N'-77.0162899')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'16', N'LINCE', N'-12.0853194', N'-77.0357761')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'17', N'LOS OLIVOS', N'-11.9594023', N'-77.0760457')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'18', N'LURIGANCHO', N'-12.0032563', N'-76.9179994')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'19', N'LURIN', N'-12.2330797', N'-76.9104675')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'20', N'MAGDALENA DEL MAR', N'-12.0690518', N'-77.0505509')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'21', N'PUEBLO LIBRE', N'-12.0042877', N'-76.9913075')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'22', N'MIRAFLORES', N'-12.111062', N'-77.0315913')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'23', N'PACHACAMAC', N'-12.2925666', N'-76.8549314')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'24', N'PUCUSANA', N'-12.4650793', N'-76.7682775')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'25', N'PUENTE PIEDRA', N'-11.8612531', N'-77.0788818')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'26', N'PUNTA HERMOSA', N'-12.2422749', N'-76.9461071')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'27', N'PUNTA NEGRA', N'-12.368056', N'-76.797222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'28', N'RIMAC', N'-12.0271206', N'-77.0362378')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'29', N'SAN BARTOLO', N'-12.0869829', N'-76.8983524')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'30', N'SAN BORJA', N'-12.0972833', N'-76.9951041')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'31', N'SAN ISIDRO', N'-12.0971829', N'-77.032585')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'32', N'SAN JUAN DE LURIGANCHO', N'-11.9689301', N'-76.9939836')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'33', N'SAN JUAN DE MIRAFLORES', N'-12.1317362', N'-76.9666326')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'34', N'SAN LUIS', N'-12.075556', N'-76.996111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'35', N'SAN MARTIN DE PORRES', N'-11.9815573', N'-77.096882')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'36', N'SAN MIGUEL', N'-12.077493', N'-77.0934017')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'37', N'SANTA ANITA', N'-12.2244477', N'-76.848312')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'38', N'SANTA MARIA DEL MAR', N'-12.1360206', N'-77.0276375')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'39', N'SANTA ROSA', N'-12.0325986', N'-77.0136242')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'40', N'SANTIAGO DE SURCO', N'-12.102847', N'-76.9727278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'41', N'SURQUILLO', N'-12.1177468', N'-77.0319784')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'42', N'VILLA EL SALVADOR', N'-12.2162218', N'-76.9415442')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'01', N'43', N'VILLA MARIA DEL TRIUNFO', N'-12.1691928', N'-76.9478962')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'00', N'BARRANCA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'01', N'BARRANCA', N'-10.7525', N'-77.7615')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'02', N'PARAMONGA', N'-10.6784649', N'-77.8195739')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'03', N'PATIVILCA', N'-10.695833', N'-77.774167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'04', N'SUPE', N'-10.7987521', N'-77.7137306')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'02', N'05', N'SUPE PUERTO', N'-10.801667', N'-77.743611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'00', N'CAJATAMBO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'01', N'CAJATAMBO', N'-10.4713', N'-76.9933')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'02', N'COPA', N'-10.4713', N'-76.9933')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'03', N'GORGOR', N'-10.4713', N'-76.9933')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'04', N'HUANCAPON', N'-10.566667', N'-77.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'03', N'05', N'MANAS', N'-10.54781', N'-77.178993')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'00', N'CANTA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'01', N'CANTA', N'-11.4691392', N'-76.6232202')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'02', N'ARAHUAY', N'-11.6213', N'-76.6703')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'03', N'HUAMANTANGA', N'-11.4989', N'-76.7491')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'04', N'HUAROS', N'-11.41294', N'-76.580009')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'05', N'LACHAQUI', N'-11.5529', N'-76.6266')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'06', N'SAN BUENAVENTURA', N'-11.4893', N'-76.662')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'04', N'07', N'SANTA ROSA DE QUIVES', N'-11.6684084', N'-76.789553')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'00', N'CAÑETE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'01', N'SAN VICENTE DE CAÑETE', N'-13.0777', N'-76.3874')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'02', N'ASIA', N'-12.778611', N'-76.556667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'03', N'CALANGO', N'-12.5263', N'-76.5438')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'04', N'CERRO AZUL', N'-13.0242806', N'-76.4789355')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'05', N'CHILCA', N'-12.5173729', N'-76.7339898')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'06', N'COAYLLO', N'-12.0025519', N'-77.0562569')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'07', N'IMPERIAL', N'-13.061', N'-76.3529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'08', N'LUNAHUANA', N'-13.027715', N'-76.1319953')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'09', N'MALA', N'-12.6575', N'-76.629167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'10', N'NUEVO IMPERIAL', N'-12.9214387', N'-76.247912')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'11', N'PACARAN', N'-12.8662', N'-76.0545')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'12', N'QUILMANA', N'-12.959444', N'-76.388056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'13', N'SAN ANTONIO', N'-12.6437', N'-76.6516')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'14', N'SAN LUIS', N'-13.0511', N'-76.4305')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'15', N'SANTA CRUZ DE FLORES', N'-12.5491095', N'-76.6528225')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'05', N'16', N'ZUÑIGA', N'-12.8599', N'-76.0226')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'00', N'HUARAL ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'01', N'HUARAL', N'-11.5', N'-77.21')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'02', N'ATAVILLOS ALTO', N'-11.5', N'-77.21')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'03', N'ATAVILLOS BAJO', N'-11.5', N'-77.21')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'04', N'AUCALLAMA', N'-11.565556', N'-77.173889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'05', N'CHANCAY', N'-11.568577', N'-77.269657')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'06', N'IHUARI', N'-11.1888928', N'-76.9520617')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'07', N'LAMPIAN', N'-11.186111', N'-76.648056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'08', N'PACARAOS', N'-11.186111', N'-76.648056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'09', N'SAN MIGUEL DE ACOS', N'-11.27727', N'-76.825211')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'10', N'SANTA CRUZ DE ANDAMARCA', N'-11.5', N'-77.21')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'11', N'SUMBILCA', N'-11.407222', N'-76.819722')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'06', N'12', N'VEINTISIETE DE NOVIEMBRE', N'-11.5', N'-77.21')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'00', N'HUAROCHIRÍ ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'01', N'MATUCANA', N'-11.844722', N'-76.386111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'02', N'ANTIOQUIA', N'-12.080722', N'-76.510611')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'03', N'CALLAHUANCA', N'-11.8265', N'-76.6186')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'04', N'CARAMPOMA', N'-11.66243', N'-76.525146')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'05', N'CHICLA', N'-11.705', N'-76.2686')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'06', N'CUENCA', N'-11.6551492', N'-76.5026246')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'07', N'HUACHUPAMPA', N'-12.0389447', N'-76.9534584')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'08', N'HUANZA', N'-11.6551492', N'-76.5026246')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'09', N'HUAROCHIRI', N'-12.1364', N'-76.235')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'10', N'LAHUAYTAMBO', N'-12.0965', N'-76.3889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'11', N'LANGA', N'-12.125278', N'-76.423333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'12', N'LARAOS', N'-12.1364', N'-76.235')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'13', N'MARIATANA', N'-12.2372', N'-76.3258')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'14', N'RICARDO PALMA', N'-12.0389447', N'-76.9534584')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'15', N'SAN ANDRES DE TUPICOCHA', N'-12.0019', N'-76.4746')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'16', N'SAN ANTONIO', N'-11.8891552', N'-76.6539054')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'17', N'SAN BARTOLOME', N'-11.9118', N'-76.5292')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'18', N'SAN DAMIAN', N'-12.0174', N'-76.3918')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'19', N'SAN JUAN DE IRIS', N'-12.1135', N'-76.1826')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'20', N'SAN JUAN DE TANTARANCHE', N'-12.1135', N'-76.1826')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'21', N'SAN LORENZO DE QUINTI', N'-12.1454907', N'-76.2124231')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'22', N'SAN MATEO', N'-11.7586', N'-76.3')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'23', N'SAN MATEO DE OTAO', N'-11.9142587', N'-76.6095408')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'24', N'SAN PEDRO DE CASTA', N'-11.7571884', N'-76.5972223')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'25', N'SAN PEDRO DE HUANCAYRE', N'-12.1364', N'-76.235')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'26', N'SANGALLAYA', N'-12.161', N'-76.2291')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'27', N'SANTA CRUZ DE COCACHACRA', N'-11.9123455', N'-76.5398222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'28', N'SANTA EULALIA', N'-11.9012', N'-76.6641')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'29', N'SANTIAGO DE ANCHUCAYA', N'-12.0955', N'-76.2302')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'30', N'SANTIAGO DE TUNA', N'-11.9840934', N'-76.5253394')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'31', N'SANTO DOMINGO DE LOS OLLEROS', N'-12.2179111', N'-76.5148607')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'07', N'32', N'SURCO', N'-11.90065', N'-76.4476169')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'00', N'HUAURA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'01', N'HUACHO', N'-11.1227218', N'-77.6105679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'02', N'AMBAR', N'-10.7563', N'-77.272')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'03', N'CALETA DE CARQUIN', N'-11.0895978', N'-77.6283747')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'04', N'CHECRAS', N'-11.0228059', N'-77.6425894')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'05', N'HUALMAY', N'-11.0967', N'-77.6129')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'06', N'HUAURA', N'-11.0690354', N'-77.6135158')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'07', N'LEONCIO PRADO', N'-11.0228059', N'-77.6425894')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'08', N'PACCHO', N'-10.9575', N'-76.933')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'09', N'SANTA LEONOR', N'-11.0690354', N'-77.6135158')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'10', N'SANTA MARIA', N'-11.091667', N'-77.573056')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'11', N'SAYAN', N'-11.1348', N'-77.1922')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'08', N'12', N'VEGUETA', N'-11.0208', N'-77.6376')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'00', N'OYÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'01', N'OYON', N'-10.669167', N'-76.772778')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'02', N'ANDAJES', N'-10.7925437', N'-76.9092965')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'03', N'CAUJUL', N'-10.8050342', N'-76.9794276')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'04', N'COCHAMARCA', N'-10.9370959', N'-77.1031336')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'05', N'NAVAN', N'-10.8382703', N'-77.0139841')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'09', N'06', N'PACHANGARA', N'-10.7813762', N'-76.8137088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'00', N'YAUYOS ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'01', N'YAUYOS', N'-12.4600662', N'-75.9180163')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'02', N'ALIS', N'-12.281', N'-75.7864')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'03', N'ALLAUCA', N'-12.592222', N'-76.036667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'04', N'AYAVIRI', N'-12.3820714', N'-76.1385183')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'05', N'AZANGARO', N'-13', N'-75.8369')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'06', N'CACRA', N'-11.9447575', N'-77.0337989')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'07', N'CARANIA', N'-12.3455', N'-75.8697')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'08', N'CATAHUASI', N'-12.7995188', N'-75.891902')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'09', N'CHOCOS', N'-12.9142837', N'-75.8624732')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'10', N'COCHAS', N'-12.296389', N'-76.158889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'11', N'COLONIA', N'-12.6336', N'-75.8903')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'12', N'HONGOS', N'-12.4600662', N'-75.9180163')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'13', N'HUAMPARA', N'-12.3601571', N'-76.1678676')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'14', N'HUANCAYA', N'-12.2034', N'-75.7993')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'15', N'HUANGASCAR', N'-12.899', N'-75.8315')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'16', N'HUANTAN', N'-12.4563', N'-75.8116')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'17', N'HUAÑEC', N'-12.2944', N'-76.1388')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'18', N'LARAOS', N'-12.3468', N'-75.7856')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'19', N'LINCHA', N'-12.8', N'-75.666667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'20', N'MADEAN', N'-12.9446615', N'-75.776756')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'21', N'MIRAFLORES', N'-12.2742', N'-75.8503')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'22', N'OMAS', N'-12.514817', N'-76.289167')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'23', N'PUTINZA', N'-12.6692717', N'-75.9488642')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'24', N'QUINCHES', N'-12.3075', N'-76.142222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'25', N'QUINOCAY', N'-12.3625', N'-76.2266')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'26', N'SAN JOAQUIN', N'-12.2841', N'-76.1469')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'27', N'SAN PEDRO DE PILAS', N'-12.454567', N'-76.226667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'28', N'TANTA', N'-12.1224733', N'-76.0134411')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'29', N'TAURIPAMPA', N'-12.6168399', N'-76.1627954')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'30', N'TOMAS', N'-12.2383', N'-75.746')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'31', N'TUPE', N'-12.7414', N'-75.8094')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'32', N'VIÑAC', N'-12.9305', N'-75.7805')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'15', N'10', N'33', N'VITIS', N'-12.2239', N'-75.8079')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'00', N'00', N'LORETO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'00', N'MAYNAS ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'01', N'IQUITOS', N'-3.7436735', N'-73.2516326')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'02', N'ALTO NANAY', N'-3.1386638', N'-74.4056612')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'03', N'FERNANDO LORES', N'-2.6684059', N'-73.8419063')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'04', N'INDIANA', N'-3.501427', N'-73.048096')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'05', N'LAS AMAZONAS', N'-2.6684059', N'-73.8419063')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'06', N'MAZAN', N'-3.4964936', N'-73.0899622')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'07', N'NAPO', N'-3.7450974', N'-73.2482745')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'08', N'PUNCHANA', N'-3.7260518', N'-73.2483604')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'10', N'TORRES CAUSANA', N'-1.121294', N'-75.0362169')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'12', N'BELEN', N'-3.7665519', N'-73.2455741')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'01', N'13', N'SAN JUAN BAUTISTA', N'-3.7739833', N'-73.2660385')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'00', N'ALTO AMAZONAS ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'01', N'YURIMAGUAS', N'-5.9007717', N'-76.1129048')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'02', N'BALSAPUERTO', N'-5.8283383', N'-76.5632726')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'05', N'JEBEROS', N'-5.283333', N'-76.283333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'06', N'LAGUNAS', N'-5.2368931', N'-75.6557206')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'10', N'SANTA CRUZ', N'-5.55', N'-75.8')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'02', N'11', N'TENIENTE CESAR LOPEZ ROJAS', N'-5.4037807', N'-76.2710833')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'00', N'LORETO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'01', N'NAUTA', N'-4.508333', N'-73.583333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'02', N'PARINARI', N'-4.571925', N'-74.463654')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'03', N'TIGRE', N'-2.55', N'-75.6333329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'04', N'TROMPETEROS', N'-3.833333', N'-75.083333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'03', N'05', N'URARINAS', N'-5.4037807', N'-76.2710833')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'04', N'00', N'MARISCAL RAMÓN CASTILLA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'04', N'01', N'RAMON CASTILLA', N'-3.9079703', N'-70.5141523')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'04', N'02', N'PEBAS', N'-3.3290656', N'-71.8541684')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'04', N'03', N'YAVARI', N'-4.4867582', N'-71.8258124')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'04', N'04', N'SAN PABLO', N'-3.9216667', N'-71.1861111')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'00', N'REQUENA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'01', N'REQUENA', N'-4.986713', N'-73.984573')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'02', N'ALTO TAPICHE', N'-6.0259119', N'-74.0938461')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'03', N'CAPELO', N'-4.986713', N'-73.984573')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'04', N'EMILIO SAN MARTIN', N'-4.986713', N'-73.984573')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'05', N'MAQUIA', N'-6.6', N'-74.8333333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'06', N'PUINAHUA', N'-6.0259119', N'-74.0938461')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'07', N'SAQUENA', N'-4.6616838', N'-73.5446889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'08', N'SOPLIN', N'-4.986713', N'-73.984573')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'09', N'TAPICHE', N'-7.4486666', N'-73.9407939')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'10', N'JENARO HERRERA', N'-4.907916', N'-73.6668655')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'05', N'11', N'YAQUERANA', N'-6.0259119', N'-74.0938461')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'00', N'UCAYALI ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'01', N'CONTAMANA', N'-7.3472841', N'-75.0056186')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'02', N'INAHUAYA', N'-7.1986064', N'-75.3412179')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'03', N'PADRE MARQUEZ', N'-7.1986064', N'-75.3412179')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'04', N'PAMPA HERMOSA', N'-7.2', N'-75.3')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'05', N'SARAYACU', N'-6.733333', N'-75.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'06', N'06', N'VARGAS GUERRA', N'-7.3515736', N'-75.0110301')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'00', N'DATEM DEL MARAÑÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'01', N'BARRANCA', N'-4.8321889', N'-76.697867')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'02', N'CAHUAPANAS', N'-5.25', N'-76.983333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'03', N'MANSERICHE', N'-4.4610848', N'-77.5787115')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'04', N'MORONA', N'-4.733333', N'-77.066667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'05', N'PASTAZA', N'-3.9627901', N'-76.8259652')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'07', N'06', N'ANDOAS', N'-2.9051835', N'-76.4027937')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'08', N'00', N'PUTUMAYO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'08', N'01', N'PUTUMAYO', N'-0.3570393', N'-74.6880717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'08', N'02', N'ROSA PANDURO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'08', N'03', N'TENIENTE MANUEL CLAVERO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'16', N'08', N'04', N'YAGUAS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'00', N'00', N'MADRE DE DIOS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'01', N'00', N'TAMBOPATA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'01', N'01', N'TAMBOPATA', N'-12.5923972', N'-69.1943192')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'01', N'02', N'INAMBARI', N'-12.716667', N'-69.733333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'01', N'03', N'LAS PIEDRAS', N'-12.49867', N'-69.22892')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'01', N'04', N'LABERINTO', N'-12.5825295', N'-69.1932762')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'02', N'00', N'MANU ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'02', N'01', N'MANU', N'-12.28568', N'-70.9040069')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'02', N'02', N'FITZCARRALD', N'-12.5333333', N'-70.4833333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'02', N'03', N'MADRE DE DIOS', N'-12.5986', N'-70.090584')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'02', N'04', N'HUEPETUHE', N'-12.5986', N'-70.090584')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'03', N'00', N'TAHUAMANU ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'03', N'01', N'IÑAPARI', N'-10.947678', N'-69.5764')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'03', N'02', N'IBERIA', N'-11.4077673', N'-69.4887886')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'17', N'03', N'03', N'TAHUAMANU', N'-11.3964', N'-69.472481')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'00', N'00', N'MOQUEGUA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'00', N'MARISCAL NIETO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'01', N'MOQUEGUA', N'-17.1927361', N'-70.9328138')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'02', N'CARUMAS', N'-16.816667', N'-70.716667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'03', N'CUCHUMBAYA', N'-17.0820021', N'-70.8175278')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'04', N'SAMEGUA', N'-17.1819', N'-70.8999')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'05', N'SAN CRISTOBAL', N'-16.8175', N'-71.0216667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'01', N'06', N'TORATA', N'-17.0766', N'-70.8443')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'00', N'GENERAL SÁNCHEZ CERRO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'01', N'OMATE', N'-16.6739', N'-70.9701')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'02', N'CHOJATA', N'-16.4', N'-70.733333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'03', N'COALAQUE', N'-16.6491362', N'-71.0248775')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'04', N'ICHUÑA', N'-16.1399754', N'-70.5363313')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'05', N'LA CAPILLA', N'-16.7536111', N'-71.1988889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'06', N'LLOQUE', N'-16.2835065', N'-70.7168469')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'07', N'MATALAQUE', N'-16.4833329', N'-70.816667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'08', N'PUQUINA', N'-16.6105826', N'-71.2116875')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'09', N'QUINISTAQUILLAS', N'-16.75', N'-70.8833329')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'10', N'UBINAS', N'-16.3867', N'-70.8559')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'02', N'11', N'YUNGA', N'-16.2835065', N'-70.7168469')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'03', N'00', N'ILO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'03', N'01', N'ILO', N'-17.6475', N'-71.3398')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'03', N'02', N'EL ALGARROBAL', N'-17.6223246', N'-71.2710875')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'18', N'03', N'03', N'PACOCHA', N'-17.583333', N'-71.333333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'00', N'00', N'PASCO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'00', N'PASCO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'01', N'CHAUPIMARCA', N'-10.6851355', N'-76.2543628')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'02', N'HUACHON', N'-10.6405796', N'-75.949227')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'03', N'HUARIACA', N'-10.4420957', N'-76.1894551')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'04', N'HUAYLLAY', N'-10.9999', N'-76.3653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'05', N'NINACACA', N'-10.8556054', N'-76.1102499')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'06', N'PALLANCHACRA', N'-10.4152155', N'-76.2356005')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'07', N'PAUCARTAMBO', N'-10.7599544', N'-75.737149')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'08', N'SAN FRANCISCO DE ASIS DE YARUSYACAN', N'-10.7581899', N'-76.1783739')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'09', N'SIMON BOLIVAR', N'-10.6899416', N'-76.2585095')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'10', N'TICLACAYAN', N'-10.5341505', N'-76.1639984')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'11', N'TINYAHUARCO', N'-10.8613889', N'-76.5188889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'12', N'VICCO', N'-10.8436946', N'-76.2421185')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'01', N'13', N'YANACANCHA', N'-10.6659733', N'-76.2529586')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'00', N'DANIEL ALCIDES CARRIÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'01', N'YANAHUANCA', N'-10.491389', N'-76.513611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'02', N'CHACAYAN', N'-10.40267', N'-76.424622')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'03', N'GOYLLARISQUIZGA', N'-10.4734509', N'-76.4089438')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'04', N'PAUCAR', N'-10.4644912', N'-76.5025742')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'05', N'SAN PEDRO DE PILLAO', N'-10.4388098', N'-76.4960691')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'06', N'SANTA ANA DE TUSI', N'-10.466667', N'-76.266667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'07', N'TAPUC', N'-10.4552324', N'-76.4628157')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'02', N'08', N'VILCABAMBA', N'-10.44979', N'-76.456261')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'00', N'OXAPAMPA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'01', N'OXAPAMPA', N'-10.590278', N'-75.398611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'02', N'CHONTABAMBA', N'-10.6034231', N'-75.4399152')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'03', N'HUANCABAMBA', N'-10.4274987', N'-75.5235713')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'04', N'PALCAZU', N'-10.55', N'-75.566667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'05', N'POZUZO', N'-10.0680289', N'-75.5516879')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'06', N'PUERTO BERMUDEZ', N'-10.2928412', N'-74.9413361')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'07', N'VILLA RICA', N'-10.719444', N'-75.269444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'19', N'03', N'08', N'CONSTITUCION', N'-9.8637997', N'-75.0066684')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'00', N'00', N'PIURA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'00', N'PIURA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'01', N'PIURA', N'-5.2', N'-80.633333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'04', N'CASTILLA', N'-5.2', N'-80.633333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'05', N'CATACAOS', N'-5.265278', N'-80.675')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'07', N'CURA MORI', N'-5.3254915', N'-80.6632103')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'08', N'EL TALLAN', N'-5.411732', N'-80.6805455')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'09', N'LA ARENA', N'-5.3416704', N'-80.7075809')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'10', N'LA UNION', N'-5.3914364', N'-80.7491563')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'11', N'LAS LOMAS', N'-4.662186', N'-80.2404959')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'14', N'TAMBO GRANDE', N'-4.9295129', N'-80.3408061')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'01', N'15', N'VEINTISEIS DE OCTUBRE', N'-5.1847075', N'-80.6741438')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'00', N'AYABACA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'01', N'AYABACA', N'-4.6266252', N'-79.7119419')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'02', N'FRIAS', N'-4.9316', N'-79.9472')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'03', N'JILILI', N'-4.581521', N'-79.796898')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'04', N'LAGUNAS', N'-4.7', N'-79.55')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'05', N'MONTERO', N'-4.6322', N'-79.8289')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'06', N'PACAIPAMPA', N'-4.9949766', N'-79.6697288')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'07', N'PAIMAS', N'-4.775637', N'-79.9798969')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'08', N'SAPILLICA', N'-4.775637', N'-79.9798969')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'09', N'SICCHEZ', N'-4.5125', N'-80.0027')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'02', N'10', N'SUYO', N'-4.5125', N'-80.0027')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'00', N'HUANCABAMBA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'01', N'HUANCABAMBA', N'-5.2389913', N'-79.4506989')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'02', N'CANCHAQUE', N'-5.3764', N'-79.6063')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'03', N'EL CARMEN DE LA FRONTERA', N'-5.2389913', N'-79.4506989')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'04', N'HUARMACA', N'-5.183333', N'-79.683333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'05', N'LALAQUIZ', N'-5.183333', N'-79.683333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'06', N'SAN MIGUEL DE EL FAIQUE', N'-5.4019', N'-79.6062')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'07', N'SONDOR', N'-5.312583', N'-79.4107439')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'03', N'08', N'SONDORILLO', N'-5.333493', N'-79.428596')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'00', N'MORROPÓN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'01', N'CHULUCANAS', N'-5.0965', N'-80.1609')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'02', N'BUENOS AIRES', N'-5.2666238', N'-79.96539')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'03', N'CHALACO', N'-5.1843', N'-79.9717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'04', N'LA MATANZA', N'-5.2107', N'-80.0884')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'05', N'MORROPON', N'-5.1843', N'-79.9717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'06', N'SALITRAL', N'-4.8898587', N'-80.6806337')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'07', N'SAN JUAN DE BIGOTE', N'-5.1843', N'-79.9717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'08', N'SANTA CATALINA DE MOSSA', N'-5.1843', N'-79.9717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'09', N'SANTO DOMINGO', N'-5.0293409', N'-79.8800739')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'04', N'10', N'YAMANGO', N'-5.1843', N'-79.9717')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'00', N'PAITA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'01', N'PAITA', N'-5.0938488', N'-81.0962172')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'02', N'AMOTAPE', N'-4.8815', N'-81.015')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'03', N'ARENAL', N'-4.8905153', N'-81.0368211')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'04', N'COLAN', N'-5.0063', N'-81.0589')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'05', N'LA HUACA', N'-4.91', N'-80.9617')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'06', N'TAMARINDO', N'-4.8781', N'-80.9758')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'05', N'07', N'VICHAYAL', N'-4.8649135', N'-81.0700994')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'00', N'SULLANA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'01', N'SULLANA', N'-4.903638', N'-80.6864323')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'02', N'BELLAVISTA', N'-4.8901', N'-80.6807')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'03', N'IGNACIO ESCUDERO', N'-4.8442379', N'-80.8737685')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'04', N'LANCONES', N'-4.6408', N'-80.5487')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'05', N'MARCAVELICA', N'-4.8816', N'-80.7034')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'06', N'MIGUEL CHECA', N'-4.903638', N'-80.6864323')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'07', N'QUERECOTILLO', N'-4.8383044', N'-80.6482153')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'06', N'08', N'SALITRAL', N'-4.8574', N'-80.6812')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'00', N'TALARA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'01', N'PARIÑAS', N'-4.579903', N'-81.271878')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'02', N'EL ALTO', N'-4.2679', N'-81.2191')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'03', N'LA BREA', N'-4.6528857', N'-81.3052118')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'04', N'LOBITOS', N'-4.4528', N'-81.2777')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'05', N'LOS ORGANOS', N'-4.1764859', N'-81.1237446')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'07', N'06', N'MANCORA', N'-4.1031', N'-81.0481')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'00', N'SECHURA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'01', N'SECHURA', N'-5.5622396', N'-80.8187744')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'02', N'BELLAVISTA DE LA UNION', N'-5.4233589', N'-80.7527999')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'03', N'BERNAL', N'-5.4629', N'-80.7424')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'04', N'CRISTO NOS VALGA', N'-5.5622396', N'-80.8187744')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'05', N'VICE', N'-5.4216', N'-80.7743')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'20', N'08', N'06', N'RINCONADA LLICUAR', N'-5.5622396', N'-80.8187744')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'00', N'00', N'PUNO', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'00', N'PUNO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'01', N'PUNO', N'-15.8402218', N'-70.0218805')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'02', N'ACORA', N'-15.9736676', N'-69.7971978')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'03', N'AMANTANI', N'-15.6662082', N'-69.710821')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'04', N'ATUNCOLLA', N'-15.8420734', N'-70.0321738')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'05', N'CAPACHICA', N'-15.63954', N'-69.836761')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'06', N'CHUCUITO', N'-15.893889', N'-69.888889')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'07', N'COATA', N'-15.57735', N'-69.956642')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'08', N'HUATA', N'-15.62266', N'-69.983749')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'09', N'MAÑAZO', N'-15.8003597', N'-70.3435088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'10', N'PAUCARCOLLA', N'-15.7451604', N'-70.05478')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'11', N'PICHACANI', N'-16.1', N'-70.15')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'12', N'PLATERIA', N'-15.9504109', N'-69.8314481')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'13', N'SAN ANTONIO', N'-15.5', N'-70.016667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'14', N'TIQUILLACA', N'-15.7976534', N'-70.1879993')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'01', N'15', N'VILQUE', N'-15.7665609', N'-70.2594346')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'00', N'AZÁNGARO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'01', N'AZANGARO', N'-14.909889', N'-70.197417')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'02', N'ACHAYA', N'-15.27119', N'-70.143593')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'03', N'ARAPA', N'-15.14538', N'-70.1185')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'04', N'ASILLO', N'-14.79434', N'-70.358002')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'05', N'CAMINACA', N'-15.3238828', N'-70.0737598')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'06', N'CHUPA', N'-15.10893', N'-69.998154')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'07', N'JOSE DOMINGO CHOQUEHUANCA', N'-15.0308247', N'-70.3375571')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'08', N'MUÑANI', N'-14.77242', N'-69.953537')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'09', N'POTONI', N'-14.9022746', N'-70.1914791')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'10', N'SAMAN', N'-15.2924572', N'-70.0168186')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'11', N'SAN ANTON', N'-14.5819', N'-70.315498')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'12', N'SAN JOSE', N'-14.9029771', N'-70.1921533')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'13', N'SAN JUAN DE SALINAS', N'-14.9091351', N'-70.1932937')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'14', N'SANTIAGO DE PUPUJA', N'-15.05843', N'-70.277893')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'02', N'15', N'TIRAPATA', N'-14.9551334', N'-70.4018679')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'00', N'CARABAYA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'01', N'MACUSANI', N'-14.068611', N'-70.431389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'02', N'AJOYANI', N'-14.1', N'-70.2')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'03', N'AYAPATA', N'-13.777778', N'-70.3225')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'04', N'COASA', N'-14.10284', N'-70.011032')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'05', N'CORANI', N'-13.88991', N'-70.647842')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'06', N'CRUCERO', N'-14.34538', N'-70.0320969')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'07', N'ITUATA', N'-13.916667', N'-70.233333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'08', N'OLLACHEA', N'-13.7947125', N'-70.4719705')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'09', N'SAN GABAN', N'-13.6530542', N'-70.2408325')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'03', N'10', N'USICAYOS', N'-14.14061', N'-69.878677')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'00', N'CHUCUITO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'01', N'JULI', N'-16.2142869', N'-69.4575979')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'02', N'DESAGUADERO', N'-16.5631251', N'-69.040395')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'03', N'HUACULLANI', N'-16.630951', N'-69.319977')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'04', N'KELLUYO', N'-16.7053271', N'-69.2436406')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'05', N'PISACOMA', N'-16.6912081', N'-69.3831079')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'06', N'POMATA', N'-16.266667', N'-69.3')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'04', N'07', N'ZEPITA', N'-16.5', N'-69.1')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'00', N'EL COLLAO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'01', N'ILAVE', N'-16.0825395', N'-69.6384724')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'02', N'CAPAZO', N'-16.7303182', N'-69.7644353')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'03', N'PILCUYO', N'-16.1113707', N'-69.5558757')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'04', N'SANTA ROSA', N'-16.766667', N'-69.85')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'05', N'05', N'CONDURIRI', N'-16.7303182', N'-69.7644353')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'00', N'HUANCANÉ ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'01', N'HUANCANE', N'-15.202222', N'-69.761389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'02', N'COJATA', N'-15.0139992', N'-69.3667194')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'03', N'HUATASANI', N'-15.0553205', N'-69.8024099')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'04', N'INCHUPALLA', N'-15.00646', N'-69.683113')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'05', N'PUSI', N'-15.4419436', N'-69.9289784')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'06', N'ROSASPATA', N'-15.24014', N'-69.527634')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'07', N'TARACO', N'-15.2982834', N'-69.9818327')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'06', N'08', N'VILQUE CHICO', N'-15.2159658', N'-69.6892254')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'00', N'LAMPA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'01', N'LAMPA', N'-15.363611', N'-70.365556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'02', N'CABANILLA', N'-15.6412156', N'-70.3494605')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'03', N'CALAPUJA', N'-15.31982', N'-70.224693')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'04', N'NICASIO', N'-15.24381', N'-70.265129')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'05', N'OCUVIRI', N'-15.12142', N'-70.929367')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'06', N'PALCA', N'-15.3536556', N'-70.3857788')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'07', N'PARATIA', N'-15.46557', N'-70.609261')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'08', N'PUCARA', N'-15.0418557', N'-70.3673152')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'09', N'SANTA LUCIA', N'-15.6962651', N'-70.6051447')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'07', N'10', N'VILAVILA', N'-15.363611', N'-70.365556')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'00', N'MELGAR ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'01', N'AYAVIRI', N'-14.881822', N'-70.590061')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'02', N'ANTAUTA', N'-14.4', N'-70.366667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'03', N'CUPI', N'-14.904254', N'-70.8669938')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'04', N'LLALLI', N'-14.9479605', N'-70.8796276')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'05', N'MACARI', N'-14.7704597', N'-70.9026649')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'06', N'NUÑOA', N'-14.4760253', N'-70.6365505')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'07', N'ORURILLO', N'-14.72796', N'-70.52285')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'08', N'SANTA ROSA', N'-14.61148', N'-70.791023')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'08', N'09', N'UMACHIRI', N'-14.852605', N'-70.7540166')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'09', N'00', N'MOHO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'09', N'01', N'MOHO', N'-15.360764', N'-69.499844')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'09', N'02', N'CONIMA', N'-15.4601506', N'-69.4355341')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'09', N'03', N'HUAYRAPATA', N'-15.3216698', N'-69.3443711')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'09', N'04', N'TILALI', N'-15.5159884', N'-69.346606')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'00', N'SAN ANTONIO DE PUTINA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'01', N'PUTINA', N'-14.91256', N'-69.874893')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'02', N'ANANEA', N'-14.68055', N'-69.534882')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'03', N'PEDRO VILCA APAZA', N'-14.9138999', N'-69.8679304')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'04', N'QUILCAPUNCU', N'-14.8925425', N'-69.7331607')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'10', N'05', N'SINA', N'-14.50176', N'-69.29467')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'11', N'00', N'SAN ROMÁN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'11', N'01', N'JULIACA', N'-15.4996879', N'-70.129653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'11', N'02', N'CABANA', N'-15.6505624', N'-70.3219334')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'11', N'03', N'CABANILLAS', N'-15.6412156', N'-70.3494605')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'11', N'04', N'CARACOTO', N'-15.567828', N'-70.102503')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'00', N'SANDIA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'01', N'SANDIA', N'-14.24498', N'-69.431091')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'02', N'CUYOCUYO', N'-14.483333', N'-69.55')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'03', N'LIMBANI', N'-14.13785', N'-69.699913')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'04', N'PATAMBUCO', N'-14.27079', N'-69.567879')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'05', N'PHARA', N'-14.07567', N'-69.539993')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'06', N'QUIACA', N'-14.43104', N'-69.352242')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'07', N'SAN JUAN DEL ORO', N'-14.27757', N'-69.215172')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'08', N'YANAHUAYA', N'-14.24498', N'-69.431091')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'09', N'ALTO INAMBARI', N'-14.24498', N'-69.431091')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'12', N'10', N'SAN PEDRO DE PUTINA PUNCO', N'-14.24498', N'-69.431091')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'00', N'YUNGUYO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'01', N'YUNGUYO', N'-16.244183', N'-69.092764')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'02', N'ANAPIA', N'-16.3134825', N'-68.857087')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'03', N'COPANI', N'-16.3997875', N'-69.040457')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'04', N'CUTURAPI', N'-16.2697729', N'-69.1774906')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'05', N'OLLARAYA', N'-16.2195757', N'-68.990812')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'06', N'TINICACHI', N'-16.2041369', N'-68.963262')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'21', N'13', N'07', N'UNICACHI', N'-16.227869', N'-68.9599205')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'00', N'00', N'SAN MARTÍN', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'00', N'MOYOBAMBA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'01', N'MOYOBAMBA', N'-6.033333', N'-76.966667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'02', N'CALZADA', N'-6.0313458', N'-77.0650809')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'03', N'HABANA', N'-6.0784837', N'-77.0881034')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'04', N'JEPELACIO', N'-6.1105195', N'-76.9153281')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'05', N'SORITOR', N'-6.1382732', N'-77.0967357')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'01', N'06', N'YANTALO', N'-5.9733653', N'-77.0190228')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'00', N'BELLAVISTA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'01', N'BELLAVISTA', N'-7.06685', N'-76.58475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'02', N'ALTO BIAVO', N'-7.06685', N'-76.58475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'03', N'BAJO BIAVO', N'-7.06685', N'-76.58475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'04', N'HUALLAGA', N'-7.06685', N'-76.58475')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'05', N'SAN PABLO', N'-7.0466664', N'-76.5842314')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'02', N'06', N'SAN RAFAEL', N'-7.0248629', N'-76.4635387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'00', N'EL DORADO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'01', N'SAN JOSE DE SISA', N'-6.6140423', N'-76.690357')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'02', N'AGUA BLANCA', N'-6.7253542', N'-76.6950296')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'03', N'SAN MARTIN', N'-6.5304119', N'-76.7798172')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'04', N'SANTA ROSA', N'-6.694286', N'-76.612587')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'03', N'05', N'SHATOJA', N'-6.5301408', N'-76.7206652')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'00', N'HUALLAGA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'01', N'SAPOSOA', N'-6.936367', N'-76.771817')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'02', N'ALTO SAPOSOA', N'-6.936367', N'-76.771817')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'03', N'EL ESLABON', N'-7.0218871', N'-76.7235513')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'04', N'PISCOYACU', N'-6.9811244', N'-76.766835')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'05', N'SACANCHE', N'-7.081475', N'-76.702454')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'04', N'06', N'TINGO DE SAPOSOA', N'-7.0930947', N'-76.6427152')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'00', N'LAMAS ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'01', N'LAMAS', N'-6.4243091', N'-76.5083562')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'02', N'ALONSO DE ALVARADO', N'-6.0429941', N'-76.9776356')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'03', N'BARRANQUITA', N'-6.245293', N'-76.0336')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'04', N'CAYNARACHI', N'-6.3275191', N'-76.2855634')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'05', N'CUÑUMBUQUI', N'-6.5106791', N'-76.4808893')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'06', N'PINTO RECODO', N'-6.3781409', N'-76.6044444')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'07', N'RUMISAPA', N'-6.4090135', N'-76.5928888')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'08', N'SAN ROQUE DE CUMBAZA', N'-6.3847578', N'-76.4375086')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'09', N'SHANAO', N'-6.4090135', N'-76.5928888')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'10', N'TABALOSOS', N'-6.3886231', N'-76.632607')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'05', N'11', N'ZAPATERO', N'-6.4243091', N'-76.5083562')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'00', N'MARISCAL CÁCERES ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'01', N'JUANJUI', N'-7.180239', N'-76.726467')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'02', N'CAMPANILLA', N'-7.4840286', N'-76.6506567')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'03', N'HUICUNGO', N'-7.3195036', N'-76.7769324')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'04', N'PACHIZA', N'-7.2949584', N'-76.7718838')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'06', N'05', N'PAJARILLO', N'-7.1785873', N'-76.6889136')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'00', N'PICOTA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'01', N'PICOTA', N'-6.920706', N'-76.330342')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'02', N'BUENOS AIRES', N'-6.790583', N'-76.3275467')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'03', N'CASPISAPA', N'-6.9579774', N'-76.4172594')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'04', N'PILLUANA', N'-6.7764491', N'-76.2899071')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'05', N'PUCACACA', N'-6.8506475', N'-76.3440537')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'06', N'SAN CRISTOBAL', N'-6.920706', N'-76.330342')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'07', N'SAN HILARION', N'-6.9993164', N'-76.4418473')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'08', N'SHAMBOYACU', N'-6.9918389', N'-76.2319793')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'09', N'TINGO DE PONASA', N'-6.936097', N'-76.2508086')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'07', N'10', N'TRES UNIDOS', N'-6.8054925', N'-76.2327036')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'00', N'RIOJA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'01', N'RIOJA', N'-6.0570484', N'-77.1657716')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'02', N'AWAJUN', N'-6.0570484', N'-77.1657716')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'03', N'ELIAS SOPLIN VARGAS', N'-6.0621211', N'-77.1673532')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'04', N'NUEVA CAJAMARCA', N'-5.946466', N'-77.303723')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'05', N'PARDO MIGUEL', N'-5.7333615', N'-77.5091242')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'06', N'POSIC', N'-6.0142447', N'-77.161458')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'07', N'SAN FERNANDO', N'-5.9004783', N'-77.2706868')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'08', N'YORONGOS', N'-5.816667', N'-77.35')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'08', N'09', N'YURACYACU', N'-5.9317384', N'-77.2261452')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'00', N'SAN MARTÍN ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'01', N'TARAPOTO', N'-6.4824784', N'-76.3726891')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'02', N'ALBERTO LEVEAU', N'-6.4908109', N'-76.3612403')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'03', N'CACATACHI', N'-6.4602108', N'-76.4503187')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'04', N'CHAZUTA', N'-6.5714219', N'-76.136344')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'05', N'CHIPURANA', N'-12.0273852', N'-77.0870627')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'06', N'EL PORVENIR', N'-7.0542237', N'-76.5704967')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'07', N'HUIMBAYOC', N'-6.4182669', N'-75.7676728')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'08', N'JUAN GUERRA', N'-6.5833792', N'-76.331889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'09', N'LA BANDA DE SHILCAYO', N'-6.4927163', N'-76.3463624')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'10', N'MORALES', N'-6.4793744', N'-76.3836955')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'11', N'PAPAPLAYA', N'-6.2105565', N'-75.7865653')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'12', N'SAN ANTONIO', N'-6.366667', N'-76.35')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'13', N'SAUCE', N'-6.6893864', N'-76.21025')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'09', N'14', N'SHAPAJA', N'-6.5801079', N'-76.2609463')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'00', N'TOCACHE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'01', N'TOCACHE', N'-8.1887017', N'-76.5186088')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'02', N'NUEVO PROGRESO', N'-8.4488985', N'-76.3246517')
GO
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'03', N'POLVORA', N'-7.9074924', N'-76.667982')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'04', N'SHUNTE', N'-8.2197716', N'-76.7798172')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'22', N'10', N'05', N'UCHIZA', N'-8.4592507', N'-76.4619911')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'00', N'00', N'TACNA', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'00', N'TACNA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'01', N'TACNA', N'-18.0065679', N'-70.2462741')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'02', N'ALTO DE LA ALIANZA', N'-17.9993018', N'-70.2455631')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'03', N'CALANA', N'-17.9389', N'-70.1862')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'04', N'CIUDAD NUEVA', N'-17.9837', N'-70.2356')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'05', N'INCLAN', N'-18.0133044', N'-70.2520797')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'06', N'PACHIA', N'-17.9344975', N'-70.1833452')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'07', N'PALCA', N'-17.776389', N'-69.958889')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'08', N'POCOLLAY', N'-17.996944', N'-70.221389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'09', N'SAMA', N'-17.7894598', N'-70.4989753')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'01', N'10', N'CORONEL GREGORIO ALBARRACIN LANCHIPA', N'-18.0065679', N'-70.2462741')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'00', N'CANDARAVE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'01', N'CANDARAVE', N'-17.2682', N'-70.2503')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'02', N'CAIRANI', N'-17.3005556', N'-70.3447222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'03', N'CAMILACA', N'-17.2425', N'-70.4083333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'04', N'CURIBAYA', N'-17.2682', N'-70.2503')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'05', N'HUANUARA', N'-17.3136', N'-70.3222')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'02', N'06', N'QUILAHUANI', N'-17.2682', N'-70.2503')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'03', N'00', N'JORGE BASADRE ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'03', N'01', N'LOCUMBA', N'-17.613836', N'-70.762514')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'03', N'02', N'ILABAYA', N'-17.4207', N'-70.5127')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'03', N'03', N'ITE', N'-17.833333', N'-70.966667')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'00', N'TARATA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'01', N'TARATA', N'-17.4776078', N'-70.0339387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'02', N'HEROES ALBARRACIN', N'-17.4776078', N'-70.0339387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'03', N'ESTIQUE', N'-17.543301', N'-70.017471')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'04', N'ESTIQUE-PAMPA', N'-17.5388', N'-70.0317')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'05', N'SITAJARA', N'-17.3508333', N'-70.0433333')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'06', N'SUSAPAYA', N'-17.4776078', N'-70.0339387')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'07', N'TARUCACHI', N'-17.5388', N'-70.0317')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'23', N'04', N'08', N'TICACO', N'-17.45', N'-70.05')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'00', N'00', N'TUMBES', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'00', N'TUMBES ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'01', N'TUMBES', N'-3.566667', N'-80.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'02', N'CORRALES', N'-3.601', N'-80.4807')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'03', N'LA CRUZ', N'-3.6683464', N'-80.4233658')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'04', N'PAMPAS DE HOSPITAL', N'-3.6927', N'-80.4389')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'05', N'SAN JACINTO', N'-3.643439', N'-80.446405')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'01', N'06', N'SAN JUAN DE LA VIRGEN', N'-3.566667', N'-80.45')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'02', N'00', N'CONTRALMIRANTE VILLAR ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'02', N'01', N'ZORRITOS', N'-3.6805', N'-80.6797')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'02', N'02', N'CASITAS', N'-3.9358313', N'-80.7214417')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'02', N'03', N'CANOAS DE PUNTA SAL', N'-3.9441772', N'-80.936131')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'03', N'00', N'ZARUMILLA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'03', N'01', N'ZARUMILLA', N'-3.5006', N'-80.275')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'03', N'02', N'AGUAS VERDES', N'-3.4818064', N'-80.2451919')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'03', N'03', N'MATAPALO', N'-3.4818064', N'-80.2451919')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'24', N'03', N'04', N'PAPAYAL', N'-3.5714', N'-80.2346')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'00', N'00', N'UCAYALI', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'00', N'CORONEL PORTILLO ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'01', N'CALLERIA', N'-8.3792869', N'-74.5448635')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'02', N'CAMPOVERDE', N'-8.47', N'-74.81')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'03', N'IPARIA', N'-9.306314', N'-74.4328')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'04', N'MASISEA', N'-8.606341', N'-74.314583')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'05', N'YARINACOCHA', N'-8.3631138', N'-74.5676809')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'06', N'NUEVA REQUENA', N'-8.334487', N'-74.562548')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'01', N'07', N'MANANTAY', N'-8.4115185', N'-74.5536515')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'02', N'00', N'ATALAYA ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'02', N'01', N'RAYMONDI', N'-10.7329963', N'-73.7541873')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'02', N'02', N'SEPAHUA', N'-11.14718', N'-73.035988')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'02', N'03', N'TAHUANIA', N'-9.6645236', N'-72.4731529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'02', N'04', N'YURUA', N'-9.6645236', N'-72.4731529')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'03', N'00', N'PADRE ABAD ', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'03', N'01', N'PADRE ABAD', N'-9.0367644', N'-75.5085611')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'03', N'02', N'IRAZOLA', N'-8.7313772', N'-75.5276699')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'03', N'03', N'CURIMANA', N'-8.4343', N'-75.154')
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'04', N'00', N'PURÚS', NULL, NULL)
INSERT [dbo].[ca_ubigeo] ([dep], [pro], [dis], [nombre], [latitud], [longitud]) VALUES (N'25', N'04', N'01', N'PURUS', N'-7.7501781', N'-67.2129996')
SET IDENTITY_INSERT [dbo].[ca_unidad] ON 

INSERT [dbo].[ca_unidad] ([idunidad], [nombre]) VALUES (1, N'Metros')
INSERT [dbo].[ca_unidad] ([idunidad], [nombre]) VALUES (2, N'Kilogramos')
SET IDENTITY_INSERT [dbo].[ca_unidad] OFF
INSERT [dbo].[cr_analista] ([idpersona], [autonomia]) VALUES (9, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[cr_analista] ([idpersona], [autonomia]) VALUES (10, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[cr_analista] ([idpersona], [autonomia]) VALUES (11, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[cr_analista] ([idpersona], [autonomia]) VALUES (12, CAST(10000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[cr_aprobacion] ON 

INSERT [dbo].[cr_aprobacion] ([idaprobacion], [descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[cr_aprobacion] ([idaprobacion], [descripcion]) VALUES (2, N'Aprobar')
INSERT [dbo].[cr_aprobacion] ([idaprobacion], [descripcion]) VALUES (3, N'Rechazar')
INSERT [dbo].[cr_aprobacion] ([idaprobacion], [descripcion]) VALUES (4, N'Recomendar aprobación')
SET IDENTITY_INSERT [dbo].[cr_aprobacion] OFF
SET IDENTITY_INSERT [dbo].[cr_habilitacion] ON 

INSERT [dbo].[cr_habilitacion] ([idhabilitacion], [descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[cr_habilitacion] ([idhabilitacion], [descripcion]) VALUES (2, N'Admitida')
INSERT [dbo].[cr_habilitacion] ([idhabilitacion], [descripcion]) VALUES (3, N'Aprobada')
INSERT [dbo].[cr_habilitacion] ([idhabilitacion], [descripcion]) VALUES (4, N'Rechazada')
SET IDENTITY_INSERT [dbo].[cr_habilitacion] OFF
SET IDENTITY_INSERT [dbo].[cr_motivo] ON 

INSERT [dbo].[cr_motivo] ([idmotivo], [descripcion]) VALUES (1, N'Apertura de línea')
INSERT [dbo].[cr_motivo] ([idmotivo], [descripcion]) VALUES (2, N'Aumento de línea')
INSERT [dbo].[cr_motivo] ([idmotivo], [descripcion]) VALUES (3, N'Exceso de línea')
SET IDENTITY_INSERT [dbo].[cr_motivo] OFF
SET IDENTITY_INSERT [dbo].[cr_periodo] ON 

INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (1, N'201401', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (2, N'201402', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (3, N'201403', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (4, N'201404', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (5, N'201405', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (6, N'201406', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (7, N'201407', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (8, N'201408', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (9, N'201409', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (10, N'201410', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (11, N'201411', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (12, N'201412', 1)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (13, N'201501', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (14, N'201502', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (15, N'201503', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (16, N'201504', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (17, N'201505', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (18, N'201506', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (19, N'201507', 0)
INSERT [dbo].[cr_periodo] ([idperiodo], [descripcion], [activo]) VALUES (20, N'201508', 0)
SET IDENTITY_INSERT [dbo].[cr_periodo] OFF


GO
ALTER TABLE [dbo].[ah_dispositivo] ADD UNIQUE
(
	[mac] ASC
)
GO


GO
ALTER TABLE [dbo].[ah_usuario] ADD UNIQUE
(
	[username] ASC
)
GO


GO
ALTER TABLE [dbo].[ah_vehiculo] ADD UNIQUE
(
	[placa] ASC
)
GO


GO
ALTER TABLE [dbo].[ca_cotizacion] ADD UNIQUE
(
	[numero] ASC
)
GO


GO
ALTER TABLE [dbo].[ca_orden] ADD UNIQUE
(
	[numero] ASC
)
GO


GO
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE
(
	[UserName] ASC
)
GO


GO
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE
(
	[RoleName] ASC
)
GO
ALTER TABLE [dbo].[ca_distancia] ADD  DEFAULT ((50)) FOR [distancia]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [deuda]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [entidad]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [normal]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [problema]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [deficiente]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [dudoso]
GO
ALTER TABLE [dbo].[cr_calificacion] ADD  DEFAULT ((0)) FOR [perdida]
GO
ALTER TABLE [dbo].[cr_crediticio] ADD  DEFAULT (getdate()) FOR [fechacreacion]
GO
ALTER TABLE [dbo].[cr_solicitud] ADD  DEFAULT ((0)) FOR [monto]
GO
ALTER TABLE [dbo].[cr_solicitud] ADD  DEFAULT (getdate()) FOR [fechacreacion]
GO
ALTER TABLE [dbo].[cr_solicitud] ADD  DEFAULT ((0)) FOR [aprobado]
GO
ALTER TABLE [dbo].[cr_solicitud] ADD  DEFAULT ((0)) FOR [garantizado]
GO
ALTER TABLE [dbo].[cr_solicitud] ADD  DEFAULT ((0)) FOR [garantia]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[ah_ubicacion] ADD FOREIGN KEY([idviaje])
REFERENCES [dbo].[ah_viaje] ([idviaje])
GO
ALTER TABLE [dbo].[ah_usuarioviaje] ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[ah_usuario] ([idusuario])
GO
ALTER TABLE [dbo].[ah_usuarioviaje] ADD FOREIGN KEY([idviaje])
REFERENCES [dbo].[ah_viaje] ([idviaje])
GO
ALTER TABLE [dbo].[ah_vehiculo] ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[ah_proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[ah_viaje] ADD FOREIGN KEY([iddispositivo])
REFERENCES [dbo].[ah_dispositivo] ([iddispositivo])
GO
ALTER TABLE [dbo].[ah_viaje] FOREIGN KEY([idvehiculo])
REFERENCES [dbo].[ah_vehiculo] ([idvehiculo])
GO
ALTER TABLE [dbo].[ca_carga] ADD FOREIGN KEY([idcargatipo])
REFERENCES [dbo].[ca_cargatipo] ([idcargatipo])
GO
ALTER TABLE [dbo].[ca_carga] ADD FOREIGN KEY([idcotizacion])
REFERENCES [dbo].[ca_cotizacion] ([idcotizacion])
GO
ALTER TABLE [dbo].[ca_carga] ADD FOREIGN KEY([idorden])
REFERENCES [dbo].[ca_orden] ([idorden])
GO
ALTER TABLE [dbo].[ca_carga] ADD FOREIGN KEY([idunidad])
REFERENCES [dbo].[ca_unidad] ([idunidad])
GO
ALTER TABLE [dbo].[ca_cliente] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_persona] ([idpersona])
GO
ALTER TABLE [dbo].[ca_cotizacion] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_cliente] ([idpersona])
GO
ALTER TABLE [dbo].[ca_cotizacion] ADD FOREIGN KEY([idservicio])
REFERENCES [dbo].[ca_servicio] ([idservicio])
GO
ALTER TABLE [dbo].[ca_cotizacion] ADD FOREIGN KEY([idep], [ipro], [idis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_cotizacion] ADD FOREIGN KEY([fdep], [fpro], [fdis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_distancia] ADD FOREIGN KEY([idep], [ipro], [idis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_distancia] ADD FOREIGN KEY([fdep], [fpro], [fdis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([idep], [ipro], [idis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([fdep], [fpro], [fdis])
REFERENCES [dbo].[ca_ubigeo] ([dep], [pro], [dis])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[ca_cliente] ([idpersona])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([idcotizacion])
REFERENCES [dbo].[ca_cotizacion] ([idcotizacion])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_transportista] ([idpersona])
GO
ALTER TABLE [dbo].[ca_orden] ADD FOREIGN KEY([idservicio])
REFERENCES [dbo].[ca_servicio] ([idservicio])
GO
ALTER TABLE [dbo].[ca_transportista] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_persona] ([idpersona])
GO
ALTER TABLE [dbo].[ca_ubicacion] ADD FOREIGN KEY([idorden])
REFERENCES [dbo].[ca_orden] ([idorden])
GO
ALTER TABLE [dbo].[cr_analista] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_persona] ([idpersona])
GO
ALTER TABLE [dbo].[cr_calificacion] ADD FOREIGN KEY([idcrediticio])
REFERENCES [dbo].[cr_crediticio] ([idcrediticio])
GO
ALTER TABLE [dbo].[cr_calificacion] ADD FOREIGN KEY([idperiodo])
REFERENCES [dbo].[cr_periodo] ([idperiodo])
GO
ALTER TABLE [dbo].[cr_crediticio] ADD FOREIGN KEY([idpersona])
REFERENCES [dbo].[ca_cliente] ([idpersona])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([idaprobacion])
REFERENCES [dbo].[cr_aprobacion] ([idaprobacion])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([iddistribuidor])
REFERENCES [dbo].[ca_cliente] ([idpersona])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([idhabilitacion])
REFERENCES [dbo].[cr_habilitacion] ([idhabilitacion])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([idimportador])
REFERENCES [dbo].[ca_cliente] ([idpersona])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([idmotivo])
REFERENCES [dbo].[cr_motivo] ([idmotivo])
GO
ALTER TABLE [dbo].[cr_solicitud] ADD FOREIGN KEY([idanalista])
REFERENCES [dbo].[cr_analista] ([idpersona])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO

