SELECT
	[Date]
	,[Flag Company ID]
	,[Company ID (Seller)]
    ,[Legal ID]
    ,[Product ID]
    ,[Shift ID]
	,[Location ID]
    ,[Price (Arg Pesos)]    
INTO
	FACT_Fuel
FROM
	[fuel_db].[dbo].[Fuel]
