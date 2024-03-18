SELECT
	[Product Type],
	MIN([Price (Arg Pesos)]) AS Min_Price,
	MAX([Price (Arg Pesos)]) AS Max_Price
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
INNER JOIN
	DIM_Location l
ON
	f.[Location ID] = l.[Location ID]
WHERE
	YEAR([Date]) = 2023 AND [Product Type] = 'Gasoil Grade 2' AND [Province] = 'Buenos Aires'
GROUP BY
	[Product Type];