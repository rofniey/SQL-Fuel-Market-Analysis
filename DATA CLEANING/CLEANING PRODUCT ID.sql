select * from Fuel where ISNUMERIC([Product ID]) = 0;

ALTER TABLE
	Fuel
ALTER COLUMN
	[Product ID] INT;