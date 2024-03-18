SELECT DISTINCT
	[Location ID],
	[Address],
	[City],
	[Province],
	[Region],
	[Latitude],
	[Longitude]
INTO
	DIM_Location
FROM
	[fuel_db].[dbo].[Fuel];
