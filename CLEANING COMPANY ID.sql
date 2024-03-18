select * from Fuel WHERE isnumeric([Company ID (Seller)]) = 0;

ALTER TABLE
	Fuel
ALTER COLUMN
	[Company ID (Seller)] INT;