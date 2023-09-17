SELECT
    *
FROM
    city
WHERE
    name = 'Jinzhou'
    and countrycode = 'CHN'
    and district = 'Liaoning';

CREATE UNIQUE INDEX "unique_name_countrycode_district" ON CITY (
	name,countrycode,district
);

DROP INDEX IF EXISTS "district";

CREATE INDEX "index_district" ON CITY (
	district
);