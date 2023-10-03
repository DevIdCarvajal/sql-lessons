-- -------------- Query 1 -----------------

SELECT e.Nombre
  FROM empleados e,
       bares b,
       reparto r
WHERE e.CodE = r.CodE
  AND r.CodB = b.CodB
  AND b.Nombre LIKE 'Stop'
  AND r.Fecha BETWEEN '2005-10-17' AND '2005-10-23';
  
-- Solucion alternativa con INNER JOIN

SELECT e.Nombre
FROM empleados e
     INNER JOIN reparto r
       ON e.CodE = r.CodE
     INNER JOIN bares b
       ON r.CodB = b.CodB
WHERE b.Nombre LIKE 'Stop'
  AND r.Fecha BETWEEN '2005-10-17' AND '2005-10-23';

-- -------------- Query 2 -----------------

SELECT b.Cif,
       b.Nombre
FROM cervezas c,
     bares b,
     reparto r
WHERE c.CodC = r.CodC
  AND r.CodB = b.CodB
  AND c.Envase LIKE 'Botella'
  AND c.Capacidad < 1
ORDER BY b.Localidad;

-- -------------- Query 3 -----------------

SELECT b.Nombre,
       c.Envase,
       c.Capacidad,
       r.Fecha,
       r.Cantidad
FROM cervezas c,
     bares b,
     empleados e,
     reparto r
WHERE c.CodC = r.CodC
  AND b.CodB = r.CodB
  AND e.CodE = r.CodE
  AND e.Nombre LIKE 'Prudencio Caminero';

-- -------------- Query 4 -----------------

SELECT b.Nombre
FROM cervezas c,
     bares b,
     reparto r
WHERE c.CodC = r.CodC
  AND b.CodB = r.CodB
  AND c.Envase LIKE 'Botella'
  AND (c.Capacidad = '0.2' OR c.Capacidad = '0.33');

-- -------------- Query 5 -----------------

SELECT e.Nombre
FROM cervezas c,
     bares b,
     empleados e,
     reparto r
WHERE c.CodC = r.CodC
  AND b.CodB = r.CodB
  AND e.CodE = r.CodE
  AND b.Nombre LIKE 'Stop'
  AND c.Envase LIKE 'Botella'
  AND e.CodE IN (
        SELECT e2.CodE
        FROM cervezas c2,
             bares b2,
             empleados e2,
             reparto r2
        WHERE c2.CodC = r2.CodC
          AND b2.CodB = r2.CodB
          AND e2.CodE = r2.CodE
          AND c2.Envase LIKE 'Botella'
          AND b2.Nombre LIKE 'Las Vegas'
        );

-- -------------- Query 6 -----------------

SELECT e.Nombre,
       COUNT(*)
FROM bares b,
     empleados e,
     reparto r
WHERE b.CodB = r.CodB
  AND e.CodE = r.CodE
  AND b.Localidad NOT LIKE 'Villa Botijo'
GROUP BY r.CodE,
         r.CodB;

-- -------------- Query 7 -----------------

SELECT TOP(1) b.Nombre,
              b.Localidad
FROM bares b,
     cervezas c,
     reparto r
WHERE b.CodB = r.CodB
  AND c.CodC = r.CodC
GROUP BY r.CodB
ORDER BY SUM(r.Cantidad * c.Capacidad) DESC;

-- -------------- Query 8 -----------------

SELECT b.Nombre
FROM bares b
WHERE b.CodB IN (
        SELECT r.CodB
          FROM cervezas c,
               reparto r
          WHERE c.CodC = r.CodC
            AND c.Envase LIKE 'Botella'
            AND c.Capacidad < 1
        );