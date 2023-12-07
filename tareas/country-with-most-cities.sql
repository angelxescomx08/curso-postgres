SELECT
    COUNT(*) as total,
    a.name
FROM
    country a
    INNER JOIN city b ON a.code = b.countrycode
GROUP BY
    a.name
ORDER BY
    total DESC
LIMIT
    1;