--pasos para crear la base de datos: 1) Descomentar la primera linea, pintarla y ejecutarla para eliminar la bd existente.
									-- 2) Volver a comentar la primera linea y descomentar la segunda, pintarla y ejecutarla.
									-- 3) Comentar las dos primeras lineas antes mencionadas. luego en el combo seleccionar la bd Seguro_Rivadavia.
									-- 4) posicionarse sobre el script y apretar "F5". 


--drop database Seguros_Rivadavia;  


--CREATE DATABASE Seguros_Rivadavia;
 
CREATE TABLE [Asociados](
	[id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
	[Dni] [int] NOT NULL,
	[Telefono] [varchar](30) NULL,
	[email] [varchar](50) NOT NULL,
	[id_domicilio] [int] NULL
	);

CREATE TABLE [Domicilio](
	[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](40) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [int] NOT NULL,
	[Dpto] [int] NOT NULL,
	[Provincia] [varchar](20) NOT NULL,
	[Localidad] [varchar](20) NOT NULL,
	[Cod_Postal] [int] NOT NULL
	);


CREATE TABLE [Estado](
	[id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Tipo] [varchar](20) NOT NULL
	);

CREATE TABLE [Informe_pericia](
	[id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Resolucion] [text] NOT NULL);



CREATE TABLE [Perito](
	[Codi;] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Telefono] [int] NOT NULL);


CREATE TABLE [poliza](
	[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[cobertura] [varchar](30) NOT NULL,
	[id_asociado] [int] NOT NULL,
	[id_vehiculo] [int] NOT NULL);

CREATE TABLE [Siniestro](
	[Num_siniestro] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Declaracion] [text] NOT NULL,
	[Lugar] [text] NOT NULL,
	[id_poliza] [int] NOT NULL,
	[id_informe_pericia] [int] NULL,
	[id_estado] [int] NOT NULL,
	[id_turno] [int] NULL,
	[tipo_siniestro] [varchar](20) NOT NULL DEFAULT ('Otros'),
	[detalle_danios] [varchar](500) NULL);

CREATE TABLE [Turno_inspeccion](
	[Num_inspeccion] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Hora] [time](7) NOT NULL,
	[id_domicilio_inspeccion] [int] NOT NULL,
	[id_perito] [int] NOT NULL
	);

CREATE TABLE [vehiculo](
	[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](20) NOT NULL,
	[Modelo] [varchar](20) NOT NULL,
	[Anio] [int] NOT NULL,
	[Color] [varchar](20) NOT NULL,
	[Patente] [varchar](20) NOT NULL,
	[Capital] [int] NOT NULL);

CREATE TABLE [Login](
	[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](10) NOT NULL,
	[password] [varchar](15) NOT NULL);


ALTER TABLE [Asociados]  WITH CHECK ADD  CONSTRAINT [FK_domicilio] FOREIGN KEY([id_domicilio])
REFERENCES [Domicilio] ([Id]);

ALTER TABLE [Asociados] CHECK CONSTRAINT [FK_domicilio]

ALTER TABLE [poliza]  WITH CHECK ADD  CONSTRAINT [FK_asociados] FOREIGN KEY([id_asociado])
REFERENCES [Asociados] ([id])
;
ALTER TABLE [poliza] CHECK CONSTRAINT [FK_asociados]
;
ALTER TABLE [poliza]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo] FOREIGN KEY([id_vehiculo])
REFERENCES [vehiculo] ([Id])
;
ALTER TABLE [poliza] CHECK CONSTRAINT [FK_vehiculo]
;
ALTER TABLE [Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_estado] FOREIGN KEY([id_estado])
REFERENCES [Estado] ([id])
;
ALTER TABLE [Siniestro] CHECK CONSTRAINT [FK_estado]
;
ALTER TABLE [Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_informe_pericia] FOREIGN KEY([id_informe_pericia])
REFERENCES [Informe_pericia] ([id])
;
ALTER TABLE [Siniestro] CHECK CONSTRAINT [FK_informe_pericia]
;
ALTER TABLE [Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_poliza] FOREIGN KEY([id_poliza])
REFERENCES [poliza] ([Id])
;
ALTER TABLE [Siniestro] CHECK CONSTRAINT [FK_poliza]
;
ALTER TABLE [Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_turno_inspeccion] FOREIGN KEY([id_turno])
REFERENCES [Turno_inspeccion] ([Num_inspeccion])
;
ALTER TABLE [Siniestro] CHECK CONSTRAINT [FK_turno_inspeccion]
;
ALTER TABLE [Turno_inspeccion]  WITH CHECK ADD  CONSTRAINT [FK_domicilio_inspeccion] FOREIGN KEY([id_domicilio_inspeccion])
REFERENCES [Domicilio] ([Id])
;
ALTER TABLE [Turno_inspeccion] CHECK CONSTRAINT [FK_domicilio_inspeccion]
;
ALTER TABLE [Turno_inspeccion]  WITH CHECK ADD  CONSTRAINT [FK_perito] FOREIGN KEY([id_perito])
REFERENCES [Perito] ([Codi;])
;
ALTER TABLE [Turno_inspeccion] CHECK CONSTRAINT [FK_perito]


alter table perito add zona varchar(30);
