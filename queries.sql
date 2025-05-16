-- Total votos
SELECT COUNT(*) AS total_votos
FROM VOTO
where id_eleccion = 'E01';

-- Cantidad de votantes que se presentaron en eleccion X. 
SELECT COUNT(*) AS total_votos
FROM PADRON_ELECCION
where id_eleccion = 'E03' and si_voto is true;

-- Votantes que votaron que no fueron en la eleccion X
SELECT pe.dni_elector,
       e.nombre,
       e.apellido
  FROM PADRON_ELECCION pe
  JOIN ELECTOR e
    ON pe.dni_elector = e.dni
 WHERE pe.id_eleccion = 'E03' and pe.si_voto = false
 
--Cantidad de votantes que votaron en blanco en eleccion X
SELECT COUNT(*) AS votos_blanco
  FROM VOTO v
  LEFT JOIN VOTO_ELECCION_CANDIDATO vc
    ON v.id_eleccion = vc.id_eleccion
   AND v.num_voto    = vc.num_voto
 WHERE v.id_eleccion = 'E01'
   AND vc.id_politico IS NULL;

-- Camionetas asignadas a un centro de elección

SELECT
  cce.id_camioneta,
  r.dni_responsable,
  cce.id_centro,
  cce.id_eleccion
FROM CAMIONETA_CENTRO_ELECCION cce
JOIN CAMIONETA_RESPONSABLE r ON r.id_camioneta = cce.id_camioneta
where cce.id_eleccion = 'E01'
;


-- Consulta chequear cantiad de voto por provincia (chequearla) 
SELECT resultados.provincia, resultados.id_politico, politicos.nombre AS nombre_politico, resultados.votos
FROM (
    SELECT e.provincia, vec.id_politico, COUNT(*) AS votos,
           RANK() OVER (PARTITION BY e.provincia ORDER BY COUNT(*) DESC) AS ranking
    FROM VOTO_ELECCION_CANDIDATO vec
    JOIN VOTO v ON v.num_voto = vec.num_voto AND v.id_eleccion = vec.id_eleccion
    JOIN PADRON_ELECCION pe ON pe.id_mesa = v.id_mesa AND pe.id_eleccion = v.id_eleccion
    JOIN ELECTOR e ON e.dni = pe.dni_elector
    WHERE v.id_eleccion = 'E01'  -- ← ajustá esta ID a tu elección legislativa
    GROUP BY e.provincia, vec.id_politico
) AS resultados
JOIN POLITICO politicos ON politicos.id_candidato = resultados.id_politico
WHERE resultados.ranking = 1;

-- electores que no votaron 
SELECT pe.dni_elector,
       e.nombre,
       e.apellido
  FROM PADRON_ELECCION pe
  JOIN ELECTOR e
    ON pe.dni_elector = e.dni
 WHERE pe.id_eleccion = 'E01'
   AND NOT EXISTS (
     SELECT 1
       FROM VOTO v
      WHERE v.id_eleccion = pe.id_eleccion
        AND v.num_voto    IN (
              SELECT num_voto
                FROM VOTO 
               WHERE id_eleccion = pe.id_eleccion
            )
        -- si tu VOTO tuviera FK a dni_elector, pondrías AND v.dni_elector = pe.dni_elector
   );

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


