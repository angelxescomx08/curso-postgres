SELECT
    COUNT(country) as count_country,
    country
FROM
    users
GROUP BY
    country
HAVING
    COUNT(country) > 5
ORDER BY
    COUNT(country) DESC;