SELECT
    name,
    surfacearea
FROM
    country;
    
-- poner una restricción de que la superficie de un país solo pueda ser mayor o igual que 0
ALTER TABLE country ADD CHECK(
	surfacearea >= 0
);


-- restricción de contienentes
SELECT * FROM country;

SELECT DISTINCT continent FROM country;

-- en algunos casos el casteo es necesario para eso es el ::text para decirle que lo castee como un texto
ALTER TABLE country ADD CHECK(
	(continent = 'Asia'::text) or
	(continent = 'South America'::text) or
	(continent = 'North America'::text) or
	(continent = 'Central America'::text) or
	(continent = 'Oceania'::text) or
	(continent = 'Antarctica'::text) or
	(continent = 'Africa'::text) or
	(continent = 'Europe'::text)
);