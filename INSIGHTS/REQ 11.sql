SELECT TOP 1
	[Company Name],
	(
		MAX(CASE WHEN MONTH([Date]) = 10 AND YEAR([Date]) = 2023 THEN [Price (Arg Pesos)] END)
		-
		MIN(CASE WHEN MONTH([Date]) = 9 AND YEAR([Date]) = 2022 THEN [Price (Arg Pesos)] END)
	) / (MIN(CASE WHEN MONTH([Date]) = 9 AND YEAR([Date]) = 2022 THEN [Price (Arg Pesos)] END)) * 100 AS Pct_Change
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Company c
ON
	f.[Company ID (Seller)] = c.[Company ID (Seller)]
INNER JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
WHERE
	(MONTH([Date]) = 9 AND YEAR([Date]) = 2022) OR
	(MONTH([Date]) = 10 AND YEAR([Date]) = 2023) AND
	[Product Type] = 'Gasoil Grade 3'
GROUP BY
	[Company Name]
ORDER BY
	Pct_Change DESC;