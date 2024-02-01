-- una vista materializada captura la información en un punto del tiempo con lo que
-- no se actualiza, sin embargo es más rápida al hacer la consulta
CREATE
MATERIALIZED VIEW comments_per_week_materialized AS
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
    weeks DESC;
    
SELECT * FROM comments_per_week_materialized;

-- hacer que la vista materializada se actualice
REFRESH MATERIALIZED VIEW comments_per_week_materialized;