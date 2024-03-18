UPDATE
	Fuel
SET
	[Fuel].[Location ID] = Location_DIM.[Location ID]
FROM
	Fuel
JOIN
	Location_DIM
ON
	[Fuel].[Address] = [Location_DIM].[Address]