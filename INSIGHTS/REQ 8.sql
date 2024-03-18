SELECT TOP 1
	[City],
	[Product Type],
	MAX([Price (Arg Pesos)]) AS Max_Price
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
	[Region] = 'Patagonia'
GROUP BY
	[City], [Product Type]
ORDER BY
	Max_Price DESC;