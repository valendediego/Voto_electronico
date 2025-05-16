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



-- Cantidad de votantes que se presentaron en eleccion X. 
SELECT COUNT(*) AS total_votos
FROM PADRON_ELECCION
where id_eleccion = 'E01' and si_voto is true;

-- Votantes que votaron que no fueron en la eleccion X
SELECT pe.dni_elector,
       e.nombre,
       e.apellido
  FROM PADRON_ELECCION pe
  JOIN ELECTOR e
    ON pe.dni_elector = e.dni
 WHERE pe.id_eleccion = 'E02' and pe.si_voto = false
 
 
--Cantidad de votantes que votaron en blanco 
SELECT COUNT(*) AS votos_blanco
  FROM VOTO v
  LEFT JOIN VOTO_ELECCION_CANDIDATO vc
    ON v.id_eleccion = vc.id_eleccion
   AND v.num_voto    = vc.num_voto
 WHERE v.id_eleccion = 'E01'
   AND vc.id_politico IS NULL;
 


--Asignacion de camionetas en la eleccion x 
 SELECT 
  cce.id_camioneta,
  r.dni_responsable,
  cce.id_centro,
  cce.id_eleccion
FROM CAMIONETA_CENTRO_ELECCION cce
JOIN CAMIONETA_RESPONSABLE r ON r.id_camioneta = cce.id_camioneta
where cce.id_eleccion = 'E03'
;





-- ESTA QUERY TE DICE QUE PARTIDO SACO MAS VOTOS EN CADA PROVINCIA
SELECT resultado.provincia, resultado.id_partido, partido.nombre, resultado.votos
FROM (
    SELECT c.provincia, pep.id_partido, COUNT(*) AS votos,
           RANK() OVER (PARTITION BY c.provincia ORDER BY COUNT(*) DESC) AS rnk
    FROM VOTO_ELECCION_CANDIDATO vec
    JOIN VOTO v ON v.num_voto = vec.num_voto AND v.id_eleccion = vec.id_eleccion
    JOIN CENTRO_VOTACION c ON c.id_centro = v.id_centro
    JOIN POLITICO_ELECCION_PERTENECE_PARTIDO pep ON vec.id_politico = pep.id_politico AND vec.id_eleccion = pep.id_eleccion
    WHERE vec.id_eleccion = 'E01'
    GROUP BY c.provincia, pep.id_partido
) resultado
JOIN PARTIDO_POLITICO partido ON partido.id_partido = resultado.id_partido
WHERE resultado.rnk = 1;


-- Total de votos por partido político en una elección específica

SELECT p.id_partido, p.nombre AS nombre_partido, COUNT(*) AS total_votos
FROM VOTO_ELECCION_CANDIDATO vec
JOIN POLITICO_ELECCION_PERTENECE_PARTIDO pep ON vec.id_politico = pep.id_politico AND vec.id_eleccion = pep.id_eleccion
JOIN PARTIDO_POLITICO p ON p.id_partido = pep.id_partido
WHERE vec.id_eleccion = 'E01'
GROUP BY p.id_partido, p.nombre
ORDER BY total_votos DESC;


 --Consult arelevante que me surge de eesta consulta, osea noosotros no pdoemos restringir que la cantidad de votos registrados
-- sea equivalente e al cantidad de votantes que tienen si_voto = TRUE. No se puede poner una constran cross tables para forzar esto 
-- o uno hace chequeo peridicos de los datos que se cargan, o uno asume tambien que los datos que se vayan cargando sean veridicos. 


-- Cantidad de votos por opción de respuesta en una consulta

SELECT 
  cp.pregunta,
  vr.id_opcion,
  o.respuesta,
  COUNT(*) AS total_votos
FROM VOTO_CONSULTA_OPCION vr
JOIN OPCION_RESPUESTA o ON o.id_opcion = vr.id_opcion
JOIN CONSULTA_POPULAR cp ON cp.id_eleccion = vr.id_eleccion
WHERE vr.id_eleccion = 'E03'  -- 🔍 reemplazá con tu consulta real
GROUP BY cp.pregunta, vr.id_opcion, o.respuesta
ORDER BY total_votos DESC;













