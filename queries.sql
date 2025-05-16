-- Verificar que cada elector tenga un solo voto por elección

SELECT dni_elector, id_eleccion, COUNT(*) AS cantidad_votos
FROM PADRON_ELECCION
WHERE si_voto = TRUE
GROUP BY dni_elector, id_eleccion
HAVING COUNT(*) > 1;

-- Detectar si algún voto fue emitido desde una mesa distinta a la del padrón

SELECT v.num_voto, v.id_eleccion, v.id_mesa, pe.id_mesa AS mesa_padron
FROM VOTO v
JOIN PADRON_ELECCION pe ON pe.dni_elector = v.num_voto AND pe.id_eleccion = v.id_eleccion
WHERE v.id_mesa != pe.id_mesa;

-- Candidatos asignados a más de un partido en una misma elección

SELECT id_politico, id_eleccion, COUNT(*) AS partidos_asignados
FROM POLITICO_ELECCION_PERTENECE_PARTIDO
GROUP BY id_politico, id_eleccion
HAVING COUNT(*) > 1;

-- Total de votos por partido político en una elección específica
SELECT p.id_partido, p.nombre AS nombre_partido, COUNT(*) AS total_votos
FROM VOTO_ELECCION_CANDIDATO vec
JOIN POLITICO_ELECCION_PERTENECE_PARTIDO pep ON vec.id_politico = pep.id_politico AND vec.id_eleccion = pep.id_eleccion
JOIN PARTIDO_POLITICO p ON p.id_partido = pep.id_partido
WHERE vec.id_eleccion = 'E01'
GROUP BY p.id_partido, p.nombre
ORDER BY total_votos DESC;


WITH total_votos AS (
  SELECT COUNT() AS total
    FROM VOTO
   WHERE id_eleccion = 'E01'
)
SELECT
  vc.id_politico      AS id_candidato,
  p.nombre            AS nombre,
  p.apellido          AS apellido,
  COUNT()            AS votos_obtenidos,
  ROUND(COUNT() 100 / tv.total, 2) AS porcentaje
FROM VOTO_ELECCION_CANDIDATO vc
JOIN POLITICO p
  ON vc.id_politico = p.id_candidato
CROSS JOIN total_votos tv
WHERE vc.id_eleccion = 'E01'
GROUP BY vc.id_politico, p.nombre, p.apellido, tv.total
ORDER BY porcentaje DESC;

-- Proporción de votos de cada candidato en esa elección.


