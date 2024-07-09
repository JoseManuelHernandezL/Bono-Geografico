/*Importes*/

SELECT 
    [Nombre Master],
    [Distribuidor Sec],
    [Deleg Municipio],
    [Tipo Activacion],
    COUNT([Nombre Master]) AS Unidades,
    CASE 
        WHEN [Nombre Master] IN ('DLI2', 'GITTSA TELECOM', 'S TAGLE', 'SEÑAL SATELITE', 'TTE', 'TV CODICE', 'VANGUARDIA SATELITAL')
             AND [Tipo Activacion] = 'pospago' THEN COUNT([Nombre Master]) * 300
        WHEN [Nombre Master] IN ('DLI2', 'GITTSA TELECOM', 'S TAGLE', 'SEÑAL SATELITE', 'TTE', 'TV CODICE', 'VANGUARDIA SATELITAL')
             AND [Tipo Activacion] = 'prepago' THEN COUNT([Nombre Master]) * 200
		WHEN [Nombre Master] IN ('SKY ESTADO DE MEXICO', 'SKY NUEVO LEON', 'Sky Oaxaca', 'SKY PUEBLA', 'SKY TABASCO', 'Sky Tlaxcala', 'Sky Veracruz','SKY GUERRERO','SKY JALISCO')
             AND [Tipo Activacion] = 'pospago' THEN COUNT([Nombre Master]) * 150
        WHEN [Nombre Master] IN ('SKY ESTADO DE MEXICO', 'SKY NUEVO LEON', 'Sky Oaxaca', 'SKY PUEBLA', 'SKY TABASCO', 'Sky Tlaxcala', 'Sky Veracruz','SKY GUERRERO','SKY JALISCO')
             AND [Tipo Activacion] = 'prepago' THEN COUNT([Nombre Master]) * 100
        ELSE 0
    END AS Importe
FROM Detalle_Bonos_Geografico_WEBI
WHERE SEMANA = 'Semana del 17 al 23 de 06-2024'
GROUP BY [Nombre Master], [Distribuidor Sec], [Deleg Municipio], [Tipo Activacion];





