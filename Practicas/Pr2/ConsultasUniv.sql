
-- 1
SELECT * FROM docente;


-- 2
SELECT docente.nombre FROM docente WHERE docente.nombre_dpto="Ingeniería Telemática";


-- 3
SELECT docente.nombre FROM docente WHERE docente.nombre_dpto="Ingeniería Telemática" AND docente.salario>70000;


-- 4
SELECT docente.ID, docente.nombre, docente.salario, docente.nombre_dpto, departamento.edificio, departamento.presupuesto FROM docente 
LEFT JOIN departamento ON docente.nombre_dpto=departamento.nombre_dpto;


-- 5
SELECT materia.nombre, materia.creditos, materia.nombre_dpto FROM materia WHERE materia.nombre_dpto="Ingeniería Telemática" AND materia.creditos=3;


-- 6
SELECT alumno_3ciclo.nombre, alumno_3ciclo.ID, materia.id_materia, materia.nombre FROM alumno_3ciclo
JOIN cursa   ON cursa.ID = alumno_3ciclo.ID
JOIN materia ON materia.id_materia = cursa.id_materia
WHERE alumno_3ciclo.ID="12345";


-- 7
SELECT nombre FROM docente UNION ALL SELECT nombre FROM alumno_3ciclo ORDER BY nombre ASC;


-- 8
SELECT alumno_3ciclo.nombre, SUM(materia.creditos) FROM alumno_3ciclo 
LEFT JOIN cursa ON cursa.ID = alumno_3ciclo.ID
INNER JOIN materia ON materia.id_materia = cursa.id_materia
GROUP BY cursa.ID
ORDER BY alumno_3ciclo.nombre ASC;

-- 9
SELECT alumno_3ciclo.tot_creditos, alumno_3ciclo.ID, SUM(materia.creditos) FROM alumno_3ciclo 
LEFT JOIN cursa ON cursa.ID = alumno_3ciclo.ID
INNER JOIN materia ON materia.id_materia = cursa.id_materia
GROUP BY cursa.ID
ORDER BY alumno_3ciclo.nombre ASC;


-- 10
SELECT DISTINCT(alumno_3ciclo.nombre) FROM alumno_3ciclo
INNER JOIN cursa ON cursa.ID = alumno_3ciclo.ID
INNER JOIN materia ON materia.id_materia = cursa.id_materia
WHERE materia.nombre_dpto="Ingeniería Telemática"
ORDER BY alumno_3ciclo.nombre;


-- 11
SELECT docente.ID, docente.nombre FROM docente
WHERE docente.ID NOT IN (SELECT imparte.ID FROM imparte)
ORDER BY docente.ID;


-- 12
SELECT docente.nombre FROM docente
WHERE docente.ID NOT IN (SELECT imparte.ID FROM imparte)
ORDER BY docente.ID;


-- 13
SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS contador FROM cursa
GROUP BY cursa.id_materia, cursa.id_grupo
ORDER BY contador ASC
LIMIT 1;

SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS contador FROM cursa
GROUP BY cursa.id_materia, cursa.id_grupo
ORDER BY contador DESC
LIMIT 1;





-- 14
SELECT S1.id_materia, S1.id_grupo, S1.cuenta AS maximo
FROM(
    SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS cuenta FROM cursa
    GROUP BY cursa.id_materia, cursa.id_grupo
    ORDER BY cursa.id_materia
)S1

INNER JOIN(
    SELECT id_materia, MAX(cuenta) AS maxim
    FROM(
        SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS cuenta FROM cursa
        GROUP BY cursa.id_materia, cursa.id_grupo
        ORDER BY cursa.id_materia
    )AS contarAlumnos

    GROUP BY id_materia
)S2 ON S2.id_materia = S1.id_materia AND S2.maxim = S1.cuenta ORDER BY maximo DESC;



-- 15
SELECT S1.id_materia, S1.id_grupo, S1.cuenta AS maximo
FROM(
    SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS cuenta FROM cursa
    GROUP BY cursa.id_materia, cursa.id_grupo
    ORDER BY cursa.id_materia
)S1

INNER JOIN(
    SELECT id_materia, MAX(cuenta) AS maxim
    FROM(
        SELECT cursa.id_materia, cursa.id_grupo, COUNT(*) AS cuenta FROM cursa
        GROUP BY cursa.id_materia, cursa.id_grupo
        ORDER BY cursa.id_materia
    )AS contarAlumnos

    GROUP BY id_materia
)S2 ON S2.id_materia = S1.id_materia AND S2.maxim = S1.cuenta ORDER BY maximo ASC;



-- 16
SELECT grupo.id_materia, grupo.id_grupo, COUNT(cursa.ID) AS NumeroDeAlumnos FROM cursa, grupo
WHERE cursa.id_materia = grupo.id_materia
AND cursa.id_grupo = grupo.id_grupo
AND cursa.cuatrimestre = grupo.cuatrimestre
AND cursa.anho = grupo.anho
GROUP BY cursa.id_materia, cursa.id_grupo, cursa.cuatrimestre, cursa.anho
ORDER BY NumeroDeAlumnos DESC
LIMIT 10;
