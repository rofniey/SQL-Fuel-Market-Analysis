USE fuel_db;
SELECT
	p.[Product Type],
	CAST( ROUND( AVG(f.[Price (Arg Pesos)]), 2 ) AS DECIMAL(6,2) ) AS Average_Price
FROM
	[FACT_Fuel] f
JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
WHERE
	p.[Product Type] = 'Gasoil Grade 2'
GROUP BY
	p.[Product Type];