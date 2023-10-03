-- -------------- Query 1 -----------------

SELECT nombre
FROM conductores
WHERE categ > 15

-- -------------- Query 2 -----------------

-- Solucion con subconsultas

SELECT descrip
FROM proyectos
WHERE codP IN (SELECT codP
				FROM trabajos
				WHERE fecha BETWEEN '2002-09-11' AND '2002-09-15');

-- Solucion cruzando tablas en el WHERE

SELECT descrip
FROM proyectos, trabajos
WHERE proyectos.codP = trabajos.codP
  AND fecha BETWEEN '2002-09-11' AND '2002-09-15';

-- Solucion cruzando tablas con JOIN

SELECT descrip
FROM proyectos JOIN trabajos ON proyectos.codP = trabajos.codP
WHERE fecha BETWEEN '2002-09-11' AND '2002-09-15';

-- -------------- Query 3 -----------------

SELECT nombre
FROM conductores
WHERE codC IN (SELECT codC
				FROM trabajos
				WHERE codM IN (SELECT codM
								FROM maquinas
								WHERE nombre = 'Hormigonera'))
ORDER BY nombre DESC;

-- -------------- Query 4 -----------------

-- Solucion con subconsultas

SELECT nombre
FROM conductores
WHERE codC IN (SELECT codC
				FROM trabajos
				WHERE codM IN (SELECT codM
								FROM maquinas
								WHERE nombre = 'Hormigonera')
				  AND codP IN (SELECT codP
								FROM proyectos
								WHERE localidad = 'Arganda'));

-- Solucion cruzando tablas en el WHERE

SELECT conductores.nombre
FROM conductores, trabajos, maquinas, proyectos
WHERE proyectos.localidad = 'Arganda'
  AND maquinas.nombre = 'Hormigonera'
  AND proyectos.codP = trabajos.codP
  AND trabajos.codM = maquinas.codM
  AND trabajos.codC = conductores.codC;

-- Solucion cruzando tablas con JOIN

SELECT conductores.nombre
FROM conductores JOIN trabajos ON conductores.codC = trabajos.codC
				JOIN maquinas ON trabajos.codM = maquinas.codM
				JOIN proyectos ON proyectos.codP = trabajos.codP
WHERE proyectos.localidad = 'Arganda'
  AND maquinas.nombre = 'Hormigonera';

-- -------------- Query 5 -----------------

SELECT conductores.nombre, proyectos.descrip
FROM conductores, trabajos, maquinas, proyectos
WHERE proyectos.localidad = 'Arganda'
  AND maquinas.nombre = 'Hormigonera'
  AND trabajos.fecha BETWEEN '2002-09-10' AND '2002-09-18'
  AND proyectos.codP = trabajos.codP
  AND trabajos.codM = maquinas.codM
  AND trabajos.codC = conductores.codC;

-- -------------- Query 6 -----------------

SELECT DISTINCT conductores.nombre
FROM conductores, trabajos, proyectos
WHERE proyectos.cliente = 'José Pérez'
  AND proyectos.codP = trabajos.codP
  AND trabajos.codC = conductores.codC;

-- -------------- Query 7 -----------------

SELECT conductores.nombre, conductores.localidad
FROM conductores
WHERE codC NOT IN (SELECT codC
					FROM trabajos
					WHERE codP IN (SELECT codP
									FROM proyectos
									WHERE cliente = 'José Pérez'));

-- -------------- Query 8 -----------------

SELECT DISTINCT conductores.*
FROM conductores, trabajos, proyectos
WHERE proyectos.codP = trabajos.codP
  AND trabajos.codC = conductores.codC
  AND (proyectos.localidad LIKE 'Loeches'
  	  OR proyectos.cliente LIKE '%Felipe%');

-- -------------- Query 9 -----------------

SELECT DISTINCT conductores.*
FROM conductores, trabajos
WHERE trabajos.codC = conductores.codC
  AND tiempo IS NULL;

-- -------------- Query 10 -----------------

SELECT conductores.*
FROM conductores, trabajos, proyectos
WHERE conductores.nombre like '%Pérez%'
  AND proyectos.localidad <> conductores.localidad
  AND proyectos.codP = trabajos.codP
  AND trabajos.codC = conductores.codC;

