SELECT TOP 10
	[Company Name],
	SUM([Price (Arg Pesos)]) AS Revenue
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Company c
ON
	f.[Company ID (Seller)] = c.[Company ID (Seller)]
WHERE
	YEAR([Date]) = 2023
GROUP BY
	[Company Name]
ORDER BY
	Revenue DESC;