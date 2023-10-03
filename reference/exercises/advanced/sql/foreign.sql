-- Creacion de claves foraneas

ALTER TABLE Trabajos ADD FOREIGN KEY ( CodC ) REFERENCES Conductores ( CodC );
ALTER TABLE Trabajos ADD FOREIGN KEY ( CodM ) REFERENCES Maquinas ( CodM );
ALTER TABLE Trabajos ADD FOREIGN KEY ( CodP ) REFERENCES Proyectos ( CodP );