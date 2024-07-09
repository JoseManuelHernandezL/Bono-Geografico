/*Validación de municipios con inconsistencias y sin inconsistencias*/

SELECT 
	#DISTRIBUIDOR,
	FECHA_INICIAL,
	FECHA_FINAL,
	FECHA_CARGA,
	ID_CALLIDUS_BONO_GEOGRAFICO,
	IMPORTE_BONO_GEOGRAFICO,
	IMPORTE_BONO_GEOGRAFICO_MASTER,
	IMPORTE_BONO_GEOGRAFICO_DISTRIBUIDOR,
	CONCEPTO_BONO_GEOGRAFICO,
	PERIODO,
	PAIS,
	ID_DISTRIBUIDOR,
	NOMBRE_DISTRIBUIDOR,
	ID_MASTER,
	NOMBRE_MASTER,
	ESTADO_BONO,
	STATUS,
	FECHA_VALIDACION,
	EVENTTYPE,
	ACTIVADAS_TOTAL,
	TIPO_ACTIVACION,
	ESTADO,
	MUNICIPIO,
	SEMANA,
	FUENTE,
	Municipios_Sebas2 As Municipio,
	Validación_Municipios
FROM(
	SELECT 
	  a.*, 
	  b.municipio AS Municipios_Sebas2,
	  CASE 
		WHEN b.municipio = a.municipio_modificado THEN 'Sin incosistencias' 
		ELSE 'Revisar' 
	  END AS Validación_Municipios
	FROM 
	  Municipios_autorizados a
	LEFT JOIN 
	  Municipios_Bono_Geografico_autorizado b 
	ON 
	  a.municipio_modificado = b.municipio) AS e
WHERE SEMANA = 'Semana del 17 al 23 de 06-2024' 
--AND Validación_Municipios ='Revisar'





