/*Validacion por distribuidor y municipio*/

WITH CTE1 AS (
  SELECT  
    [Distribuidor Sec] + ' ' + [Deleg Municipio] AS Concatena1,
    [Distribuidor Sec],
    [Deleg Municipio],
    COUNT([Tipo Activacion]) AS Unidades1 -->Webi
  FROM Detalle_Bonos_Geografico_WEBI
  WHERE SEMANA = 'Semana del 17 al 23 de 06-2024'
  GROUP BY [Distribuidor Sec], [Deleg Municipio]
), CTE2 AS (
  SELECT  
    #Distribuidor + ' ' + Municipio AS Concatena2,
    #Distribuidor,
    Municipio,
    SUM([ACTIVADAS_TOTAL]) AS Unidades2 -->Callidus
  FROM Municipios_autorizados
  WHERE SEMANA = 'Semana del 17 al 23 de 06-2024' 
  GROUP BY #Distribuidor, Municipio
)
SELECT 
  CTE1.Concatena1,
  CTE1.[Distribuidor Sec],
  CTE1.[Deleg Municipio],
  CTE1.Unidades1,
  CTE2.Unidades2,
(CTE1.Unidades1 - ISNULL(CTE2.Unidades2, 0)) AS VALIDACION,
	CASE
		WHEN (CTE1.Unidades1 - ISNULL(CTE2.Unidades2, 0)) = 0 THEN 'SIN INCIDENCIAS'
		ELSE 'REVISAR'
	END AS Estado
FROM CTE1
LEFT JOIN CTE2 ON CTE1.Concatena1 = CTE2.Concatena2;
