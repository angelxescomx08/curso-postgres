SELECT
    first_name,
    last_name,
    followers
FROM
    users;

SELECT
    COUNT(*)
FROM
    users
WHERE
    followers = 4
    or followers = 4999;

SELECT
    COUNT(*),
    followers
FROM
    users
WHERE
    followers = 4 OR followers = 4999
GROUP BY
    followers;