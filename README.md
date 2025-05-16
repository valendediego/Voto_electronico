# Sistema de Voto Electrónico

## Descripción  
Este proyecto implementa la base de datos de un sistema de voto electrónico para el Gobierno Nacional. Permite:

- Gestionar múltiples elecciones (cargos públicos y consultas populares).  
- Mantener el padrón electoral por elección, asignando cada elector a su mesa y centro y controlando si ya votó.  
- Garantizar el anonimato de la papeleta y reiniciar el conteo de votos en cada elección.  
- Registrar la composición de cada mesa (presidente, vicepresidente o suplente, técnico, fiscales) y el parque de máquinas y camionetas de soporte.

## Estructura del repositorio  
- README.md
- docs/
-     DER.png (Diagrama Entidad–Relación)
-     ModeloRelacional.md  (Modelo relacional derivado)
- sql/
-     tabla.sql  (creación de tablas y estructura)
-     data.sql (Datos de ejemplo para rellenar la base de datos)
-     queries.sql (consultas a la base de datos)

## Contenidos principales
- Elector, Padrón_Elección: gestión del registro electoral y control de voto.
- Elección, Candidato, Consulta_Popular, Opción_Respuesta: definición de cargos y referéndums.
- Voto (entidad débil) y subtipos Voto_Elección_Legislativa / Voto_Consulta_Popular: registro anónimo de cada papeleta.
- Mesa_Electoral, Máquina_Votos, Camioneta, Integrantes: organización física y logística de la votación.
- Claves foráneas y tablas asociativas (N:M) para modelar fiscalización y asignación de máquinas.

## Supuestos y restricciones
- El conteo de votos se reinicia por elección (PK compuesta en Voto).
- “Voto en blanco” se modela con id_candidato = NULL.
- Un elector sólo puede votar una vez por elección (atributo si_voto en Padrón_Elección).
- Presidente/Vice/Suplente son 1:1 con mesa; Técnico es 1:N; Fiscal es N:M con mesa y partido.
- Consultas populares pueden asociarse muchas por elección (M:N via elección_consulta).
- El sistema almacena datos históricos sin permitir modificaciones retroactivas.
