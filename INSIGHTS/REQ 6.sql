SELECT
	[Product Type],
	MIN([Price (Arg Pesos)]) AS Min_Price,
	MAX([Price (Arg Pesos)]) AS Max_Price,
	MAX([Price (Arg Pesos)]) - MIN([Price (Arg Pesos)]) AS Range_Price
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Location l
ON
	f.[Location ID] = l.[Location ID]
INNER JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
WHERE
	l.[Province] = 'Buenos Aires' AND p.[Product Type] = 'Petrol Unleaded - 95/98 Octane'
GROUP BY
	[Product Type];