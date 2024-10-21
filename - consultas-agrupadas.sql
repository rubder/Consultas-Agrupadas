--1. ¿Cuántos registros hay?

SELECT COUNT(*) AS total_registros
FROM INSCRITOS;


--2. ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS total_inscritos
FROM INSCRITOS;


--3. ¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT *
FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);


--4. ¿Cuántos inscritos hay por día? (Indistintamente de la fuente de inscripción)

SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;


--5. ¿Cuántos inscritos hay por fuente?

SELECT fuente, SUM(cantidad) AS inscritos_por_fuente
FROM INSCRITOS
GROUP BY fuente;


--6. ¿Qué día se inscribió la mayor cantidad de personas? Y ¿Cuántas personas se inscribieron en ese día?

SELECT fecha, SUM(cantidad) AS total_inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1;


--7. ¿Qué día se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron? (si hay más de un registro con el máximo de personas, considera solo el primero)

SELECT fecha, cantidad AS inscritos_blog
FROM INSCRITOS
WHERE fuente = 'Blog'
ORDER BY cantidad DESC
LIMIT 1;

--8. ¿Cuál es el promedio de personas inscritas por día? Toma en consideración que la base de datos tiene un registro de 8 días, es decir, se obtendrán 8 promedios.

SELECT fecha, AVG(cantidad) AS promedio_inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;

--9. ¿Qué días se inscribieron más de 50 personas?

SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
HAVING SUM(cantidad) > 50
ORDER BY fecha;



--10. ¿Cuál es el promedio por día de personas inscritas? Considerando sólo calcular desde el tercer día.

SELECT fecha, AVG(cantidad) AS promedio_diario
FROM INSCRITOS
WHERE fecha >= '2021-01-03'
GROUP BY fecha
ORDER BY fecha;
