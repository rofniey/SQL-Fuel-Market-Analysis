SELECT
	[Flag Company],
	SUM([Price (Arg Pesos)]) AS Sales
FROM
	FACT_Fuel f
INNER JOIN
	DIM_FlagCompany fc
ON
	f.[Flag Company ID] = fc.[Flag Company ID]
GROUP BY
	[Flag Company]
ORDER BY
	Sales DESC;