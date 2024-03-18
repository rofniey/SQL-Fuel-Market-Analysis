SELECT
	[Product Type],
	SUM([Price (Arg Pesos)]) AS Total_Sales
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Product p
ON
	f.[Product ID] = p.[Product ID]
GROUP BY
	[Product Type]
ORDER BY
	Total_Sales DESC;