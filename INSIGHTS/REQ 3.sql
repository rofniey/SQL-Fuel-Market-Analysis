USE fuel_db;
SELECT
    [Product Type],
    MIN(CASE WHEN MONTH([Date]) = 9 AND YEAR([Date]) = 2022 THEN [Price (Arg Pesos)] END) AS September_2022_Min_Price,
    MAX(CASE WHEN MONTH([Date]) = 10 AND YEAR([Date]) = 2023 THEN [Price (Arg Pesos)] END) AS October_2023_Max_Price,
    MAX(CASE WHEN MONTH([Date]) = 10 AND YEAR([Date]) = 2023 THEN [Price (Arg Pesos)] END) - MIN(CASE WHEN MONTH([Date]) = 9 AND YEAR([Date]) = 2022 THEN [Price (Arg Pesos)] END) AS Price_Change
FROM
    FACT_Fuel f
INNER JOIN
    DIM_Product p ON f.[Product ID] = p.[Product ID]
WHERE
    [Date] BETWEEN '2022-09-01' AND '2023-10-31'
    AND [Product Type] = 'Petrol Premium - 95 Octane'
GROUP BY
    [Product Type];
