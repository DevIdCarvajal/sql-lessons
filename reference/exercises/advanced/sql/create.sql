-- Creacion de datos

CREATE TABLE Proyectos (
	CodP      VARCHAR(3) NOT NULL,
	Descrip   VARCHAR(20) NULL,
	Localidad VARCHAR(20) NULL,
	Cliente   VARCHAR(20) NULL,
	Telefono  VARCHAR(20) NULL,
	PRIMARY KEY (CodP)
);

CREATE TABLE Maquinas (
	CodM       VARCHAR(3) NOT NULL,
	Nombre     VARCHAR (20) NULL,
	PrecioHora INT NULL,
	PRIMARY KEY (CodM)
);

CREATE TABLE Conductores (
	CodC      VARCHAR(3) NOT NULL,
	Nombre    VARCHAR(20) NULL,
	Localidad VARCHAR(20) NULL,
	Categ     SMALLINT NULL,
	PRIMARY KEY (CodC)
);

CREATE TABLE Trabajos (
	CodC   VARCHAR(3) NOT NULL,
	CodM   VARCHAR(3) NOT NULL,
	CodP   VARCHAR(3) NOT NULL,
	Fecha  DATE NOT NULL,
	Tiempo SMALLINT NULL,
	PRIMARY KEY (CodC,CodM,CodP,Fecha)
);
