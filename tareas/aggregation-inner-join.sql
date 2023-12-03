SELECT
    COUNT(*) AS total,
    b.name as continentName
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
GROUP BY
    b.code
    
UNION

SELECT
    0 AS total,
    b.name as continentName
FROM
    country a
    RIGHT JOIN continent b ON a.continent = b.code
WHERE
    a.continent IS NULL
GROUP BY
    b.code
ORDER BY
    total ASC;
