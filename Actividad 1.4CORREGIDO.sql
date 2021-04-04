CREATE DATABASE BluePrint
GO

USE BluePrint
GO

CREATE TABLE TiposClientes(
	ID Smallint primary key identity (1,1) not null,
	Nombre varchar(40) not null
)
GO

CREATE TABLE Clientes(
	ID smallint primary key identity (1,1)not null,
	RazonSocial varchar(50) not null unique,
	CUIT varchar(13) not null unique,
	EMail varchar(100) null,
	Telefono varchar(15) null,
	Celular varchar(15) null,
	IDTipo smallint not null foreign key references TiposClientes(ID)
)
GO

CREATE TABLE Proyectos(
	ID smallint primary key identity (1,1) not null,
	IDCliente smallint not null foreign key references Clientes(ID),
	Nombre varchar(100) not null,
	Descripcion varchar (512) null,
	CostoEstimado money not null check ( CostoEstimado > 0),
	FechaInicio Date not null,
	FechaFin Date null,
	Estado bit not null default (1)
)
GO

CREATE TABLE Modulo(
	ID_proyecto smallint not null foreign key references Proyectos (ID),
	ID_modulo smallint primary key identity (1,1) not null,
	Nombre varchar(100) not null,
	Descripcion varchar (512) null,
	Tiempo_horas smallint not null,
	Costo money not null,
	Fecha_estimada_fin date not null,
	Fecha_real_inicio smalldatetime not null,
	Fecha_real_fin smalldatetime not null,
)
GO

CREATE TABLE Ciudades(
	ID smallint primary key not null,
	Ciudad varchar(20) not null,
	Pais varchar(20) not null
)
GO

CREATE TABLE Colaboradores (
	ID_colba int primary key   identity (100,1) ,
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	EMail varchar(100) ,
	Celular varchar(15) ,
	Constraint Emailycelular check (EMail is not null or Celular is not null),
	Fecha_nacimiento date not null,
	Domicilio varchar(15) null,
	ID_Ciudades SMALLint  foreign key references Ciudades (ID) NOT NULL,
	Tipo_colaborador char (1) not null Check ( Tipo_colaborador = 'I' or Tipo_colaborador = 'E'),
)
GO

alter table Clientes
ADD ID_Ciudades SMALLint  foreign key references Ciudades (ID) NOT NULL;