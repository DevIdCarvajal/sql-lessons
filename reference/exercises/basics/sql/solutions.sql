-- -------------- Query 1 -----------------

SELECT e.Nombre
FROM empleados e JOIN reparto r ON e.CodE = r.CodE
                 JOIN bares b ON r.CodB = b.CodB
WHERE b.Nombre LIKE 'Stop'
  AND r.Fecha BETWEEN '2023-05-17' AND '2023-05-23';

-- -------------- Query 2 -----------------

SELECT DISTINCT b.Cif, b.Nombre, b.Localidad
FROM cervezas c JOIN reparto r ON c.CodC = r.CodC
                JOIN bares b ON r.CodB = b.CodB
WHERE c.Envase LIKE 'Botella'
  AND c.Capacidad < 1
ORDER BY b.Localidad;

-- -------------- Query 3 -----------------

SELECT b.Nombre, c.Envase, c.Capacidad, r.Fecha, r.Cantidad
FROM cervezas c JOIN reparto r ON c.CodC = r.CodC
                JOIN bares b ON r.CodB = b.CodB
                JOIN empleados e ON e.CodE = r.CodE
WHERE e.Nombre LIKE 'Prudencio Caminero';

-- -------------- Query 4 -----------------

SELECT b.Nombre
FROM cervezas c JOIN reparto r ON c.CodC = r.CodC
                JOIN bares b ON r.CodB = b.CodB
WHERE c.Envase LIKE 'Botella'
  AND (c.Capacidad = '0.2' OR c.Capacidad = '0.33');

-- -------------- Query 5 -----------------

SELECT e.Nombre
FROM cervezas c JOIN reparto r ON c.CodC = r.CodC
                JOIN bares b ON r.CodB = b.CodB
                JOIN empleados e ON e.CodE = r.CodE
WHERE b.Nombre LIKE 'Stop'
  AND c.Envase LIKE 'Botella'
  AND e.CodE IN (
        SELECT e2.CodE
        FROM cervezas c2 JOIN reparto r2 ON c2.CodC = r2.CodC
                         JOIN bares b2 ON r2.CodB = b2.CodB
                         JOIN empleados e2 ON e2.CodE = r2.CodE
        WHERE c2.Envase LIKE 'Botella'
          AND b2.Nombre LIKE 'Las Vegas'
        );

-- -------------- Query 6 -----------------

SELECT e.Nombre, COUNT(*) AS NumeroEmpleados
FROM bares b JOIN reparto r ON b.CodB = r.CodB
             JOIN empleados e ON e.CodE = r.CodE
WHERE b.Localidad NOT LIKE 'Villa Botijo'
GROUP BY r.CodE, r.CodB;

-- -------------- Query 7 -----------------

SELECT TOP(1) b.Nombre, b.Localidad
FROM bares JOIN reparto r ON b.CodB = r.CodB
           JOIN cervezas c ON c.CodC = r.CodC
GROUP BY r.CodB
ORDER BY SUM(r.Cantidad * c.Capacidad) DESC;

-- -------------- Query 8 -----------------

SELECT b.Nombre
FROM bares b
WHERE b.CodB IN (
        SELECT r.CodB
          FROM cervezas c JOIN reparto r ON c.CodC = r.CodC
          WHERE c.Envase LIKE 'Botella'
            AND c.Capacidad < 1
        );