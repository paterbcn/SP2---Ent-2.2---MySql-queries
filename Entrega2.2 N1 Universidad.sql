SELECT apellido1, apellido2, nombre FROM persona p WHERE p.tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2, telefono, tipo FROM persona p WHERE p.telefono IS NULL AND p.tipo = "alumno";
SELECT nombre, apellido1, apellido2, fecha_nacimiento, tipo FROM persona WHERE year(fecha_nacimiento) = 1999 AND tipo = "alumno";
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%k";
SELECT a.nombre AS asignatura, a.curso, a.cuatrimestre, g.nombre AS grado FROM asignatura a JOIN grado g ON a.id_grado = g.id WHERE a.cuatrimestre = 1 AND a.curso = 3 AND g.id = 7;
SELECT pe.apellido1, pe.apellido2, pe.nombre, de.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor JOIN departamento de ON pr.id_departamento = de.id ORDER BY pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre;
SELECT concat( pe.nombre, " ", pe.apellido1, " ", pe.apellido2 ) AS alumno, ce.anyo_inicio, ce.anyo_fin, ag.nombre AS asinatura FROM persona pe JOIN alumno_se_matricula_asignatura al ON pe.id = al.id_alumno JOIN asignatura ag ON al.id_asignatura = ag.id JOIN curso_escolar ce ON al.id_curso_escolar = ce.id WHERE nif = "26902806M";
SELECT de.nombre AS departamento, ag.nombre AS asignatura, gr.nombre FROM departamento de JOIN profesor pr ON de.id = pr.id_departamento JOIN persona pe ON pr.id_profesor = pe.id JOIN asignatura ag ON pr.id_profesor = ag.id_profesor JOIN grado gr ON ag.id_grado = gr.id WHERE gr.id = 4;
SELECT concat( pe.nombre, " ", pe.apellido1, " ", pe.apellido2 ) AS alumno, concat(cu.anyo_inicio, "/", cu.anyo_fin) AS "curso escolar" FROM persona pe JOIN alumno_se_matricula_asignatura al ON pe.id = al.id_alumno JOIN curso_escolar cu ON al.id_curso_escolar = cu.id WHERE cu.anyo_inicio = 2018 group BY pe.apellido1;
SELECT de.nombre AS departamento, pe.apellido1, pe.apellido2, pe.nombre FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento de ON pr.id_departamento = de.id WHERE pe.tipo = "profesor" ORDER BY departamento ASC, pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre ASC;
SELECT de.nombre AS departamento, pe.apellido1, pe.apellido2, pe.nombre FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento de ON pr.id_departamento = de.id WHERE pe.tipo = "profesor" AND de.nombre IS NULL ORDER BY departamento ASC, pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre ASC;
SELECT de.nombre FROM departamento de LEFT JOIN profesor pr ON de.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT concat( pe.nombre, " ", pe.apellido1, " ", pe.apellido2 ) AS Profesor, ag.nombre AS asignatura FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura ag ON pr.id_profesor = ag.id_profesor WHERE pe.tipo = "profesor" AND ag.id_profesor IS NULL;
SELECT de.nombre AS departamento, ag.nombre AS asignatura FROM departamento de LEFT JOIN profesor pr ON de.id = pr.id_departamento LEFT JOIN asignatura ag ON pr.id_profesor = ag.id_profesor WHERE ag.id IS NULL;
SELECT count(*) AS "numero de alumnos" FROM persona WHERE tipo = "alumno";
SELECT count(*) AS "numero de alumnos" FROM persona WHERE tipo = "alumno" AND year(fecha_nacimiento) = "1999";
SELECT de.nombre AS departemento, count(*) AS "numero de profesores" FROM departamento de JOIN profesor pr ON de.id = pr.id_departamento group BY de.nombre;
SELECT de.nombre AS departemento, count(pr.id_profesor) AS "numero profesores" FROM departamento de LEFT JOIN profesor pr ON de.id = pr.id_departamento group BY de.nombre;
SELECT gr.nombre AS grado, count(ag.id) AS "numero de asignaturas" FROM grado gr LEFT JOIN asignatura ag ON gr.id = ag.id_grado group BY gr.id;
SELECT g.nombre, count(a.nombre) AS "numero asignaturas" FROM universidad.grado g JOIN asignatura a ON a.id_grado = g.id group BY g.nombre having count(a.nombre) > 40;
SELECT g.nombre AS grado, a.tipo AS "tipo de asignaturaa", sum(a.creditos) AS "total creditos" FROM universidad.grado g JOIN asignatura a ON a.id_grado = g.id group BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, count(al.id) AS "numero alumnos matriculados" FROM universidad.persona al JOIN alumno_se_matricula_asignatura am ON am.id_alumno = al.id JOIN curso_escolar ce ON ce.id = am.id_curso_escolar group BY ce.anyo_inicio;
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, count(a.nombre) FROM universidad.profesor pr LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor JOIN persona pe ON pe.id = pr.id_profesor group BY pe.id, pe.nombre, pe.apellido1, pe.apellido2;
SELECT * FROM universidad.persona WHERE fecha_nacimiento = ( SELECT max(fecha_nacimiento) FROM universidad.persona WHERE tipo = "alumno" );
SELECT concat( pe.nombre, " ", pe.apellido1, " ", pe.apellido2 ) AS Profesor, dp.nombre AS departamento FROM universidad.persona pe JOIN profesor pr ON pr.id_profesor = pe.id LEFT JOIN asignatura ag ON ag.id_profesor = pr.id_profesor LEFT JOIN departamento dp ON dp.id = pr.id_departamento WHERE ag.id_profesor IS NULL;









