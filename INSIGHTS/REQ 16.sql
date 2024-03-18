SELECT
	[Company Name],
	[Product Type],
	MONTH([Date]) AS Month_Number,
	SUM([Price (Arg Pesos)]) AS Sales
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
	YEAR([Date]) = 2023 --AND [Company Name] = 'SCHELLER HNOS. S.R.L.'
GROUP BY
	[Company Name], [Product Type], MONTH([Date])
ORDER BY
	Sales DESC;