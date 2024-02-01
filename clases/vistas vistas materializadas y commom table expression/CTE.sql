-- los CTE common table expression, sirven para hacer querys grandes en más sencillos
--aunque no es un uso común o para hacer querys recursivos
WITH posts_per_week AS (
    SELECT
        date_trunc('week', posts.created_at) AS weeks,
        sum(claps.counter) AS total_claps,
        count(DISTINCT posts.post_id) as number_of_posts
    FROM
        posts
        INNER JOIN claps ON claps.post_id = posts.post_id
    GROUP BY
        weeks
    ORDER BY
        weeks DESC
)
SELECT
    *
FROM
    posts_per_week
WHERE
    weeks BETWEEN '2024-01-01'
    AND '2024-12-31'
    AND total_claps >= 600;