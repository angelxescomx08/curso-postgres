SELECT
    a.name as name,
    a.continent as continentCode,
    b.name as continentName
FROM
    country a
    RIGHT JOIN continent b ON a.continent = b.code
WHERE
    a.continent IS NULL;