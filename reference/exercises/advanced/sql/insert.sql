-- Poblacion de datos

INSERT INTO Proyectos VALUES ( 'P01','Garaje','Arganda','Felipe Sol','600111111' );
INSERT INTO Proyectos VALUES ( 'P02','Solado','Rivas','Jose Perez','912222222' );
INSERT INTO Proyectos VALUES ( 'P03','Garaje','Arganda','Rosa Lopez','666999666' );
INSERT INTO Proyectos VALUES ( 'P04','Techado','Loeches','Jose Perez','913333333' );
INSERT INTO Proyectos VALUES ( 'P05','Buhardilla','Rivas','Ana Botijo',NULL );

INSERT INTO Maquinas VALUES ( 'M01','Excavadora',15000 );
INSERT INTO Maquinas VALUES ( 'M02','Hormigonera',10000 );
INSERT INTO Maquinas VALUES ( 'M03','Volquete',11000 );
INSERT INTO Maquinas VALUES ( 'M04','Apisonadora',18000 );

INSERT INTO Conductores VALUES ( 'C01','Jose Sanchez','Arganda',18 );
INSERT INTO Conductores VALUES ( 'C02','Manuel Diaz','Arganda',15 );
INSERT INTO Conductores VALUES ( 'C03','Juan Perez','Rivas',20 );
INSERT INTO Conductores VALUES ( 'C04','Luis Ortiz','Arganda',18 );
INSERT INTO Conductores VALUES ( 'C05','Javier Martin','Loeches',12 );
INSERT INTO Conductores VALUES ( 'C06','Carmen Perez','Rivas',15 );

INSERT INTO Trabajos VALUES ( 'C02','M03','P01','2002-09-10',100 );
INSERT INTO Trabajos VALUES ( 'C03','M01','P02','2002-09-10',200 );
INSERT INTO Trabajos VALUES ( 'C05','M03','P02','2002-09-10',150 );
INSERT INTO Trabajos VALUES ( 'C04','M03','P02','2002-09-10',90 );
INSERT INTO Trabajos VALUES ( 'C01','M02','P02','2002-09-12',120 );
INSERT INTO Trabajos VALUES ( 'C02','M03','P03','2002-09-13',30 );
INSERT INTO Trabajos VALUES ( 'C03','M01','P04','2002-09-15',300 );
INSERT INTO Trabajos VALUES ( 'C02','M03','P02','2002-09-15',NULL );
INSERT INTO Trabajos VALUES ( 'C01','M03','P04','2002-09-15',180 );
INSERT INTO Trabajos VALUES ( 'C05','M03','P04','2002-09-15',90 );
INSERT INTO Trabajos VALUES ( 'C01','M02','P04','2002-09-17',NULL );
INSERT INTO Trabajos VALUES ( 'C02','M03','P01','2002-09-18',NULL );
