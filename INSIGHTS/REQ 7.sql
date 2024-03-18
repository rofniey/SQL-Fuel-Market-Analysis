SELECT
	[Company Name],
	COUNT([Product ID]) AS Product_Count
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Company c
ON
	f.[Company ID (Seller)] = c.[Company ID (Seller)]
WHERE
	c.[Company Name] = 'AUTOMOVIL CLUB ARGENTINO'
GROUP BY
	[Company Name];