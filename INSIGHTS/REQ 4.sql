USE fuel_db;
SELECT
	[Region],
	AVG([Price (Arg Pesos)]) AS Average_Price
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
	p.[Product Type] = 'Compressed Natural Gas'
GROUP BY
	[Region]
ORDER BY
	Average_Price DESC;
