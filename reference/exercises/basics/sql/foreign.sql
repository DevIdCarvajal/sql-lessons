ALTER TABLE reparto ADD FOREIGN KEY (CodE) REFERENCES empleados(CodE);
ALTER TABLE reparto ADD FOREIGN KEY (CodB) REFERENCES bares(CodB);
ALTER TABLE reparto ADD FOREIGN KEY (CodC) REFERENCES cervezas(CodC);