-- -------------- Query 1 -----------------

SELECT	E.Nombre
FROM	EMPLEADOS E,
		BARES B,
		REPARTO R
WHERE	E.CodE = R.CodE
  AND	R.CodB = B.CodB
  AND	B.Nombre LIKE 'Stop'
  AND	R.Fecha BETWEEN '2005-10-17' AND '2005-10-23';
  
-- Solucion alternativa con INNER JOIN

SELECT	E.Nombre
FROM	EMPLEADOS E INNER JOIN REPARTO R
		  ON E.CodE = R.CodE
		INNER JOIN BARES B
		  ON R.CodB = B.CodB
WHERE	B.Nombre LIKE 'Stop'
  AND	R.Fecha BETWEEN '2005-10-17' AND '2005-10-23';

-- -------------- Query 2 -----------------

SELECT	B.Cif,
		B.Nombre
FROM	CERVEZAS C,
		BARES B,
		REPARTO R
WHERE	C.CodC = R.CodC
  AND	R.CodB = B.CodB
  AND	C.Envase LIKE 'Botella'
  AND	C.Capacidad < 1
ORDER BY B.Localidad;

-- -------------- Query 3 -----------------

SELECT	B.Nombre,
		C.Envase,
		C.Capacidad,
		R.Fecha,
		R.Cantidad
FROM	CERVEZAS C,
		BARES B,
		EMPLEADOS E,
		REPARTO R
WHERE	C.CodC = R.CodC
  AND	B.CodB = R.CodB
  AND	E.CodE = R.CodE
  AND	E.Nombre LIKE 'Prudencio Caminero';

-- -------------- Query 4 -----------------

SELECT	B.Nombre
FROM	CERVEZAS C,
		BARES B,
		REPARTO R
WHERE	C.CodC = R.CodC
  AND	B.CodB = R.CodB
  AND	C.Envase LIKE 'Botella'
  AND	( C.Capacidad = '0.2' OR C.Capacidad = '0.33' );

-- -------------- Query 5 -----------------

SELECT	E.Nombre
FROM	CERVEZAS C,
		BARES B,
		EMPLEADOS E,
		REPARTO R
WHERE	C.CodC = R.CodC
  AND	B.CodB = R.CodB
  AND	E.CodE = R.CodE
  AND	B.Nombre LIKE 'Stop'
  AND	C.Envase LIKE 'Botella'
  AND	E.CodE IN (
  			SELECT	E2.CodE
			FROM	CERVEZAS C2,
					BARES B2,
					EMPLEADOS E2,
					REPARTO R2
			WHERE	C2.CodC = R2.CodC
			  AND	B2.CodB = R2.CodB
			  AND	E2.CodE = R2.CodE
			  AND	C2.Envase LIKE 'Botella'
			  AND	B2.Nombre LIKE 'Las Vegas'
  		);

-- -------------- Query 6 -----------------

SELECT	E.Nombre,
		COUNT(*)
FROM	BARES B,
		EMPLEADOS E,
		REPARTO R
WHERE	B.CodB = R.CodB
  AND	E.CodE = R.CodE
  AND	B.Localidad NOT LIKE 'Villa Botijo'
GROUP BY R.CodE, R.CodB;

-- -------------- Query 7 -----------------

SELECT	B.Nombre,
		B.Localidad
FROM	BARES B,
		CERVEZAS C,
		REPARTO R
WHERE	B.CodB = R.CodB
  AND	C.CodC = R.CodC
GROUP BY R.CodB
ORDER BY SUM( R.Cantidad * C.Capacidad ) DESC LIMIT 1;

-- -------------- Query 8 -----------------

SELECT	B.Nombre
FROM	BARES B
WHERE	B.CodB IN (
  			SELECT	R.CodB
			FROM	CERVEZAS C,
					REPARTO R
			WHERE	C.CodC = R.CodC
			  AND	C.Envase LIKE 'Botella'
			  AND	C.Capacidad < 1
		);

-- -------------- Query 9 -----------------

UPDATE	EMPLEADOS E
SET		E.Sueldo = E.Sueldo * 0.05
WHERE	E.CodE IN (
  			SELECT	R.CodE
			FROM	REPARTO R
			GROUP BY R.CodE
			ORDER BY COUNT(*) DESC LIMIT 1;
		);

-- -------------- Query 10 -----------------

INSERT INTO REPARTO ( CodE, CodB, CodC, Fecha, Cantidad ) VALUES ( '2', '001', '03', 48, '2005-10-26' );