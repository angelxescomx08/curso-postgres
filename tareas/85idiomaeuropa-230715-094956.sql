

-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";
SELECT
    "language".code,
    "language"."name"
FROM
    "language" "language"
    INNER JOIN countrylanguage countrylanguage ON "language".code = countrylanguage.languagecode
    INNER JOIN country country ON country.code = countrylanguage.countrycode
    INNER JOIN continent continent ON continent.code = country.continent
WHERE
    countrylanguage.isofficial = true
    AND continent."name" LIKE '%Europe%'; 





-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)







