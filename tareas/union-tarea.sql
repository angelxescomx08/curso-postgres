--El codigo es igual al otro en resultado pero con menos lineas
SELECT
    COUNT(*) as total,
    b."name"
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b."name" NOT LIKE '%America%'
GROUP BY
    b.code
UNION
SELECT
    COUNT(*) as total,
    'America' as "name2"
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b."name" LIKE '%America%'
GROUP BY
    name2
ORDER BY
    total;
    
--
SELECT
    COUNT(*) as total,
    b."name"
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b."name" NOT LIKE '%America%'
GROUP BY
    b.code
UNION
SELECT
    COUNT(*) as total,
    'America'
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
WHERE
    b."name" LIKE '%America%'
ORDER BY
    total;