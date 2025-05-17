/*==============================================================================
 * SISTEMA DE GESTIÓN ELECTORAL - CONSULTAS SQL
 * 
 * Este archivo contiene consultas SQL para analizar resultados electorales,
 * gestionar el padrón electoral y verificar restricciones del sistema.
 *==============================================================================*/

/*==============================================================================
 * SECCIÓN 1: ANÁLISIS DE VOTOS POR PARTIDO POLÍTICO
 *==============================================================================*/

-- Consulta 1: Total de votos por partido político en la elección E01
-- Muestra el total de votos que obtuvo cada partido político ordenado de mayor a menor
SELECT 
    p.id_partido, 
    p.nombre AS nombre_partido, 
    COUNT(*) AS total_votos
FROM 
    VOTO_ELIJE_CANDIDATO vec
JOIN 
    POLITICO_ELECCION_PERTENECE_PARTIDO pep 
    ON vec.dni_politico = pep.dni_politico AND vec.id_eleccion = pep.id_eleccion
JOIN 
    PARTIDO_POLITICO p 
    ON p.id_partido = pep.id_partido
WHERE 
    vec.id_eleccion = 'E01'
GROUP BY 
    p.id_partido, p.nombre
ORDER BY 
    total_votos DESC;

/*------------------------------------------------------------------------------*/

-- Consulta 2: Proporción de votos por candidato en la elección E01
-- Calcula el porcentaje que representa cada candidato sobre el total de votos emitidos
WITH total_votos AS (
    SELECT COUNT(*) AS total
    FROM VOTO
    WHERE id_eleccion = 'E01'
)
SELECT
    vc.dni_politico     AS id_candidato,
    p.nombre           AS nombre,
    p.apellido         AS apellido,
    COUNT(*)           AS votos_obtenidos,
    ROUND(COUNT(*) * 100.0 / tv.total, 2) AS porcentaje
FROM 
    VOTO_ELIJE_CANDIDATO vc
JOIN 
    POLITICO p
    ON vc.dni_politico = p.id_candidato
CROSS JOIN 
    total_votos tv
WHERE 
    vc.id_eleccion = 'E01'
GROUP BY
    vc.dni_politico,
    p.nombre,
    p.apellido,
    tv.total
ORDER BY 
    porcentaje DESC;

/*==============================================================================
 * SECCIÓN 2: ANÁLISIS DE PARTICIPACIÓN ELECTORAL
 *==============================================================================*/

-- Consulta 3: Estadísticas de presentismo por elección
-- Muestra la cantidad de votantes que se presentaron y los que no para cada elección,
-- incluyendo el tipo de elección (Legislativa o Consulta Popular) y los detalles
SELECT 
    pe.id_eleccion,
    CASE 
        WHEN el.id_eleccion IS NOT NULL THEN 'Legislativa'
        WHEN cp.id_eleccion IS NOT NULL THEN 'Consulta Popular'
    END as tipo_eleccion,
    CASE 
        WHEN el.id_eleccion IS NOT NULL THEN el.cargo
        WHEN cp.id_eleccion IS NOT NULL THEN cp.pregunta
    END as detalle_eleccion,
    SUM(CASE WHEN pe.si_voto = true THEN 1 ELSE 0 END) AS presentes,
    SUM(CASE WHEN pe.si_voto = false THEN 1 ELSE 0 END) AS no_presentes,
    COUNT(*) AS cantidad_votantes
FROM 
    PADRON_ELECCION pe
LEFT JOIN 
    ELECCION_LEGISLATIVA el ON pe.id_eleccion = el.id_eleccion
LEFT JOIN 
    CONSULTA_POPULAR cp ON pe.id_eleccion = cp.id_eleccion
GROUP BY 
    pe.id_eleccion,
    tipo_eleccion,
    detalle_eleccion;

/*------------------------------------------------------------------------------*/

-- Consulta 4: Electores ausentes en la elección E02
-- Identifica a los electores que no se presentaron a votar en una elección específica
SELECT 
    pe.dni_elector,
    e.nombre,
    e.apellido,
    pe.id_eleccion
FROM 
    PADRON_ELECCION pe
JOIN 
    ELECTOR e ON pe.dni_elector = e.dni
WHERE 
    pe.id_eleccion = 'E02' AND pe.si_voto = false;

/*==============================================================================
 * SECCIÓN 3: ANÁLISIS DE VOTOS EN BLANCO
 *==============================================================================*/
-- Consulta 5
--Cantidad de votantes que votaron en blanco por EO2 eleccion legislativa (restriccion de quesea legislativa)
SELECT COUNT(*) AS cant_votos_blanco
  FROM VOTO v
  LEFT JOIN VOTO_ELIJE_CANDIDATO vc
    ON v.id_eleccion = vc.id_eleccion
   AND v.num_voto    = vc.num_voto
 WHERE v.id_eleccion = 'E02'
   AND vc.dni_politico IS NULL;

/*------------------------------------------------------------------------------*/

-- Consulta 6
--Cantidad de votantes que votaron en blanco por EO3 eleccion consulta popular (restriccion de que sea consulta popular)
SELECT COUNT(*) AS cant_votos_blanco
  FROM VOTO v
  LEFT JOIN VOTO_ELIJE_OPCION_RESPUESTA vc
    ON v.id_eleccion = vc.id_eleccion
   AND v.num_voto    = vc.num_voto
 WHERE v.id_eleccion = 'E03'
   AND vc.id_opcion IS NULL;

/*------------------------------------------------------------------------------*/

-- Consulta 5 y 6 combinadas: Análisis de votos en blanco por tipo de elección
-- Muestra la cantidad y porcentaje de votos en blanco para cada elección,
-- diferenciando entre elecciones legislativas y consultas populares
WITH todos_los_votos AS (
    SELECT 
        v.id_eleccion,
        CASE 
            WHEN el.id_eleccion IS NOT NULL THEN 'Legislativa'
            WHEN cp.id_eleccion IS NOT NULL THEN 'Consulta Popular'
        END as tipo_eleccion,
        CASE 
            WHEN el.id_eleccion IS NOT NULL THEN el.cargo
            WHEN cp.id_eleccion IS NOT NULL THEN cp.pregunta
        END as detalle,
        CASE 
            WHEN el.id_eleccion IS NOT NULL AND vec.dni_politico IS NULL THEN 1
            WHEN cp.id_eleccion IS NOT NULL AND veor.id_opcion IS NULL THEN 1
            ELSE 0
        END as es_voto_blanco
    FROM 
        VOTO v
    LEFT JOIN 
        ELECCION_LEGISLATIVA el ON v.id_eleccion = el.id_eleccion
    LEFT JOIN 
        CONSULTA_POPULAR cp ON v.id_eleccion = cp.id_eleccion
    LEFT JOIN 
        VOTO_ELIJE_CANDIDATO vec 
        ON v.id_eleccion = vec.id_eleccion 
        AND v.num_voto = vec.num_voto
    LEFT JOIN 
        VOTO_ELIJE_OPCION_RESPUESTA veor 
        ON v.id_eleccion = veor.id_eleccion 
        AND v.num_voto = veor.num_voto
)
SELECT 
    id_eleccion,
    tipo_eleccion,
    detalle,
    SUM(es_voto_blanco) as votos_blancos,
    ROUND(SUM(es_voto_blanco) * 100.0 / COUNT(*), 2) as porcentaje_blancos
FROM 
    todos_los_votos
GROUP BY 
    id_eleccion, tipo_eleccion, detalle
ORDER BY 
    id_eleccion;

/*==============================================================================
 * SECCIÓN 4: LOGÍSTICA ELECTORAL (CAMIONETAS Y REPSONSABELS)
 *==============================================================================*/

-- Consulta 7: Asignación de camionetas para la elección E02
-- Muestra qué camionetas están asignadas a cada centro de votación, con su responsable
SELECT 
    cce.patente,
    r.dni_responsable,
    cce.id_centro,
    cce.id_eleccion
FROM 
    CAMIONETA_CENTRO_ELECCION cce
JOIN 
    CAMIONETA_RESPONSABLE r ON r.patente = cce.patente
WHERE 
    cce.id_eleccion = 'E02';

-- Consulta 8: Asignacion de repsonsabels por camiones en disitintas elecciones 
-- Muestra qué camionetas están asignadas a cada centro de votación, con su responsable

SELECT 
    cce.patente,
    r.dni_responsable,
    cce.id_centro,
    cce.id_eleccion
FROM
    CAMIONETA_CENTRO_ELECCION cce
JOIN
    CAMIONETA_RESPONSABLE r ON r.patente = cce.patente
ORDER BY
    cce.patente;


/*==============================================================================
 * SECCIÓN 5: ANÁLISIS GEOGRÁFICO DE RESULTADOS
 *==============================================================================*/

-- Consulta 9: Partido ganador por provincia en la elección E01
-- Identifica qué partido político ganó en cada provincia según el total de votos
SELECT 
    resultado.provincia, 
    resultado.id_partido, 
    partido.nombre, 
    resultado.votos
FROM (
    SELECT 
        c.provincia, 
        pep.id_partido, 
        COUNT(*) AS votos,
        RANK() OVER (PARTITION BY c.provincia ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        VOTO_ELIJE_CANDIDATO vec
    JOIN 
        VOTO v ON v.num_voto = vec.num_voto AND v.id_eleccion = vec.id_eleccion
    JOIN 
        CENTRO_VOTACION c ON c.id_centro = v.id_centro
    JOIN 
        POLITICO_ELECCION_PERTENECE_PARTIDO pep 
        ON vec.dni_politico = pep.dni_politico AND vec.id_eleccion = pep.id_eleccion
    WHERE 
        vec.id_eleccion = 'E01'
    GROUP BY 
        c.provincia, pep.id_partido
) resultado
JOIN 
    PARTIDO_POLITICO partido ON partido.id_partido = resultado.id_partido
WHERE 
    resultado.rnk = 1;

/*------------------------------------------------------------------------------*/

-- Consulta 10: Votos por partido político y provincia en la elección NACIONAL (la unica que tenemos es la EO1)
-- Detalla la cantidad de votos que obtuvo cada partido en cada provincia. agregar si tienen 0 votos tambien
-- Versión anidando subconsultas en el FROM
SELECT
  p.provincia,
  pp.id_partido,
  pp.nombre         AS nombre_partido,
  COALESCE(v.total_votos, 0) AS total_votos
FROM
  (
    /* Provincias con votos en E01 */
    SELECT DISTINCT c.provincia
    FROM CENTRO_VOTACION c
    JOIN VOTO v 
      ON v.id_centro   = c.id_centro
     AND v.id_eleccion = 'E01'
  ) AS p
CROSS JOIN PARTIDO_POLITICO pp
LEFT JOIN
  (
    /* Conteo de votos por provincia y partido */
    SELECT 
      c.provincia,
      pep.id_partido,
      COUNT(*) AS total_votos
    FROM VOTO v
    JOIN CENTRO_VOTACION c 
      ON v.id_centro = c.id_centro
    JOIN VOTO_ELIJE_CANDIDATO vec 
      ON vec.num_voto    = v.num_voto 
     AND vec.id_eleccion = v.id_eleccion
    JOIN POLITICO_ELECCION_PERTENECE_PARTIDO pep 
      ON pep.dni_politico = vec.dni_politico 
     AND pep.id_eleccion = vec.id_eleccion
    WHERE v.id_eleccion = 'E01'
    GROUP BY c.provincia, pep.id_partido
  ) AS v
  ON v.provincia  = p.provincia
 AND v.id_partido = pp.id_partido
ORDER BY
  p.provincia,
  total_votos DESC;
/*------------------------------------------------------------------------------*/

-- Consulta 11: Ranking y porcentaje de votos por partido en cada provincia
-- Proporciona estadísticas detalladas sobre el desempeño de cada partido político
-- por provincia, incluyendo el ranking y el porcentaje de votos obtenidos
WITH votos_por_partido_eleccion AS (
    SELECT 
        vec.id_eleccion,
        c.provincia,
        p.id_partido,
        p.nombre AS nombre_partido,
        COUNT(*) AS total_votos,
        RANK() OVER (
            PARTITION BY vec.id_eleccion, c.provincia 
            ORDER BY COUNT(*) DESC
        ) as ranking_provincia,
        SUM(COUNT(*)) OVER (
            PARTITION BY vec.id_eleccion, c.provincia
        ) as total_votos_provincia
    FROM 
        VOTO_ELIJE_CANDIDATO vec
    JOIN 
        VOTO v 
        ON vec.num_voto = v.num_voto 
        AND vec.id_eleccion = v.id_eleccion
    JOIN 
        CENTRO_VOTACION c 
        ON v.id_centro = c.id_centro
    JOIN 
        POLITICO_ELECCION_PERTENECE_PARTIDO pep 
        ON vec.dni_politico = pep.dni_politico 
        AND vec.id_eleccion = pep.id_eleccion
    JOIN 
        PARTIDO_POLITICO p 
        ON p.id_partido = pep.id_partido
    GROUP BY 
        vec.id_eleccion, c.provincia, p.id_partido, p.nombre
)
SELECT 
    id_eleccion,
    provincia,
    id_partido,
    nombre_partido,
    total_votos,
    ranking_provincia,
    ROUND(total_votos * 100.0 / total_votos_provincia, 2) as porcentaje_provincia
FROM 
    votos_por_partido_eleccion
ORDER BY 
    id_eleccion, provincia, ranking_provincia;

/*==============================================================================
 * SECCIÓN 6: ANÁLISIS DE CONSULTAS POPULARES
 *==============================================================================*/

-- Consulta 12: Resultados de la consulta popular E03
-- Muestra el total de votos por cada opción de respuesta en una consulta popular
SELECT 
    cp.pregunta,
    vr.id_opcion,
    o.respuesta,
    COUNT(*) AS total_votos
FROM 
    VOTO_ELIJE_OPCION_RESPUESTA vr
JOIN 
    OPCION_RESPUESTA o ON o.id_opcion = vr.id_opcion
JOIN 
    CONSULTA_POPULAR cp ON cp.id_eleccion = vr.id_eleccion
WHERE 
    vr.id_eleccion = 'E03'  
GROUP BY 
    cp.pregunta, vr.id_opcion, o.respuesta
ORDER BY 
    total_votos DESC;

/*==============================================================================
 * SECCIÓN 7: COMPOSICION DE LAS MESAS ELECTORALES
 *==============================================================================*/
-- Consulta 13: integrantes de cada mesa electoral en una elección
-- Muestra los integrantes de cada mesa electoral: presidente, vicepresidente, suplente, tecnico.

SELECT 
    me.nro_mesa,
    me.dni_presidente,
    me.dni_vicepresidente,
    me.dni_suplente,
    me.dni_tecnico
FROM MESA_ELECTORAL me
WHERE me.id_eleccion = 'E01';
    
/*------------------------------------------------------------------------------*/

-- Consulta 14: Fiscales asignados en cada mesa en una eleccion
SELECT 
    me.nro_mesa,
    me.id_eleccion,
    mf.dni_fiscal
FROM
    MESA_FISCAL mf 
JOIN
    MESA_ELECTORAL me 
    ON me.nro_mesa = mf.nro_mesa
    AND me.id_centro = mf.id_centro
    AND me.id_eleccion = mf.id_eleccion
ORDER BY
    me.nro_mesa,
    me.id_eleccion;

/*------------------------------------------------------------------------------*/

-- Consulta 15: cantidad de veces que una persona fue presidente de mesa a lo largo de todas las elecciones
-- Muestra la cantidad de veces que una persona fue presidente de mesa a lo largo de todas las elecciones
SELECT 
    dni_presidente,
    COUNT(*) AS cantidad_veces_presidente
FROM 
    MESA_ELECTORAL
GROUP BY 
    dni_presidente
ORDER BY 
    dni_presidente;

/*==============================================================================
 * SECCIÓN 0: VERIFICACIÓN DE RESTRICCIONES Y CONTROL DE INTEGRIDAD
 *==============================================================================*/

-- Verificación 1: Control de voto único por elector
-- Verifica que cada elector tenga como máximo un voto por elección
-- Si esta consulta devuelve registros, hay electores que votaron más de una vez
SELECT 
    dni_elector, 
    id_eleccion, 
    COUNT(*) AS cantidad_votos
FROM 
    PADRON_ELECCION
WHERE 
    si_voto = TRUE
GROUP BY 
    dni_elector, id_eleccion
HAVING 
    COUNT(*) > 1;

/*------------------------------------------------------------------------------*/

-- Verificación 2: Control de candidatos con múltiples partidos
-- Verifica que ningún candidato esté asignado a más de un partido en una misma elección
-- Si esta consulta devuelve registros, hay candidatos asignados a múltiples partidos
SELECT 
    dni_politico, 
    id_eleccion, 
    COUNT(*) AS partidos_asignados
FROM 
    POLITICO_ELECCION_PERTENECE_PARTIDO
GROUP BY 
    dni_politico, id_eleccion
HAVING 
    COUNT(*) > 1;