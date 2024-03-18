WITH
	CompanyPriceStats AS (
		SELECT
			f.[Company ID (Seller)],
			AVG(f.[Price (Arg Pesos)]) AS Avg_Price
		FROM
			FACT_Fuel f
		WHERE
			YEAR([Date]) = 2023
		GROUP BY
			f.[Company ID (Seller)]
	),
	CompanyPriceStdDev AS (
		SELECT
			cps.[Company ID (Seller)],
			SQRT(SUM(POWER(f.[Price (Arg Pesos)] - cps.Avg_Price, 2)) / COUNT(f.[Price (Arg Pesos)])) AS Price_StdDev
		FROM
			FACT_Fuel f
		INNER JOIN
			CompanyPriceStats cps ON f.[Company ID (Seller)] = cps.[Company ID (Seller)]
		WHERE
			YEAR([Date]) = 2023
		GROUP BY
			cps.[Company ID (Seller)]
	)

SELECT TOP 1
    c.[Company Name],
    cpsd.Price_StdDev AS Price_Volatility
FROM
    CompanyPriceStdDev cpsd
INNER JOIN
    DIM_Company c
ON
	cpsd.[Company ID (Seller)] = c.[Company ID (Seller)]
ORDER BY
    cpsd.Price_StdDev DESC;