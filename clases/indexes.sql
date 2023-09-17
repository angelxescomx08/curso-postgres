SELECT * FROM country WHERE continent = 'Africa';

--index unico
CREATE UNIQUE INDEX "unique_country_name" ON country(
	name
);

--index no unico
CREATE INDEX "country_continent" ON country(
	continent
);