SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT * FROM continent;
SELECT * FROM "language";
--¿Qué idiomas oficiales se hablan por continente?
SELECT
    a."language",
    c."name"
FROM
    countrylanguage a
    INNER JOIN country b ON a.countrycode = b.code
    INNER JOIN continent c ON b.continent = c.code
WHERE
    isofficial = true
ORDER BY
    c."name";
--¿Cuántos idiomas oficiales se hablan por continente?
SELECT
    COUNT(*) as total,
    c."name"
FROM
    countrylanguage a
    INNER JOIN country b ON a.countrycode = b.code
    INNER JOIN continent c ON b.continent = c.code
WHERE
    isofficial = true
GROUP BY
    c."name"
ORDER BY
    total DESC;