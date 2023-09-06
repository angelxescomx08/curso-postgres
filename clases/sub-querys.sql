SELECT
    total, domain
FROM
    (
        SELECT
            COUNT(*) AS total,
            SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
        FROM
            users
        GROUP BY
            domain
        HAVING
            COUNT(*) > 1
        ORDER BY
            COUNT(*) DESC
    ) AS domains;