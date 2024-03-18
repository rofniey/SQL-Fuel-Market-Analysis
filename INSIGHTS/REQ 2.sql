SELECT TOP 1
	[City],
	[Company Name],
	SUM([Price (Arg Pesos)]) AS Total_Sales
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Location l
ON
	f.[Location ID] = l.[Location ID]
INNER JOIN
	DIM_Company c
ON
	f.[Company ID (Seller)] = c.[Company ID (Seller)]
GROUP BY
	c.[Company Name], l.[City]
ORDER BY
	Total_Sales DESC;