
--crear una vista es similar a crear un alias para un query
CREATE
OR REPLACE VIEW comments_per_week AS
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
SELECT
    *
FROM
    comments_per_week;
