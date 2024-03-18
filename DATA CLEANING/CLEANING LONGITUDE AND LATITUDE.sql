USE
	fuel_db;
--select * from [Fuel] where ISNUMERIC(Longitude) = 0 ;
--select * from [Fuel] where Longitude like '%;';
UPDATE
	[Fuel]
SET
	Longitude = REPLACE(Longitude, ';', '')
WHERE
	Longitude like '%;';

--select * from [Fuel] where isnumeric(Longitude) = 0;

UPDATE
	Fuel
SET
	Longitude = REPLACE(Longitude, '"','')
WHERE
	Longitude LIKE '%"';

UPDATE
	[Fuel]
SET
	Longitude = NULL
WHERE
	Longitude = '';


select * from [Fuel] where ISNUMERIC(Latitude) = 0 ;

UPDATE
	Fuel
SET
	Latitude = NULL
WHERE
	Latitude = '';

alter table Fuel
alter column Latitude decimal(9,6);

alter table Fuel
alter column Longitude decimal(9,6);