SELECT
    a.name as name,
    a.code as continentCode,
    b."name" as continent
FROM
    country a FULL
    OUTER JOIN continent b ON a.continent = b.code
ORDER BY
    a.name DESC;