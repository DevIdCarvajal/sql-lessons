-- Creacion de datos

CREATE TABLE cervezas (
	CodC VARCHAR(2) NOT NULL,
	Envase VARCHAR(10) NOT NULL,
	Capacidad DECIMAL (5,2) NOT NULL,
	Stock SMALLINT,
	PRIMARY KEY (CodC)
);

CREATE TABLE bares (
	CodB VARCHAR(3) NOT NULL,
	Nombre VARCHAR (15) NOT NULL,
	Cif VARCHAR(11),
	Localidad VARCHAR (15),
	PRIMARY KEY (CodB)
);

CREATE TABLE empleados (
	CodE VARCHAR(2) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Sueldo INTEGER,
	PRIMARY KEY (CodE)
);

CREATE TABLE reparto (
	CodE VARCHAR(2) NOT NULL,
	CodB VARCHAR(3) NOT NULL,
	CodC VARCHAR(2) NOT NULL,
	Fecha DATE NOT NULL,
	Cantidad SMALLINT,
	PRIMARY KEY (CodE,CodB,CodC,fecha)
);
