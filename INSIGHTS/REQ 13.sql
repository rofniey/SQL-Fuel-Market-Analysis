SELECT
	[Product Type],
	MONTH([Date]) AS Month_Number,
	SUM([Price (Arg Pesos)]) AS Price
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
WHERE
	YEAR([Date]) = 2022 AND [Product Type] = 'Petrol unleaded - 95/98 Octane'
GROUP BY
	MONTH([Date]), [Product Type]
ORDER BY
	Price DESC;