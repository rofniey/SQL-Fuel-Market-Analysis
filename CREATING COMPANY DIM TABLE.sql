SELECT DISTINCT
	[Company ID (Seller)],
	[Company Name]
INTO
	DIM_Company
FROM
	[fuel_db].[dbo].[Fuel];