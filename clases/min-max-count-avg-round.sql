SELECT
    COUNT(*) AS total_users,
    MIN(followers) AS min_followers,
    MAX(followers) AS max_followers,
    AVG(followers) AS avg_followers,
    ROUND(AVG(followers)) AS avg_followers_rounded,
    SUM(followers) / COUNT(*) as avg_followers_calculated
FROM
    users;