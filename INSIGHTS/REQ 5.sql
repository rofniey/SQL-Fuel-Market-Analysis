SELECT
	[Shift Type],
	SUM([Price (Arg Pesos)]) AS Total_Price,
	AVG([Price (Arg Pesos)]) AS Avg_Price,
	MIN([Price (Arg Pesos)]) AS Min_Price,
	MAX([Price (Arg Pesos)]) AS Max_Price
FROM
	FACT_Fuel f
INNER JOIN
	DIM_Shift s
ON
	f.[Shift ID] = s.[Shift ID]
GROUP BY
	s.[Shift Type];