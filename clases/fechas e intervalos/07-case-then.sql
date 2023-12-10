SELECT
    first_name,
    last_name,
    hire_date,
    CASE
        WHEN hire_date > now() - INTERVAL '1 years' THEN '1 año o menos'
        WHEN hire_date > now() - INTERVAL '3 years' THEN '1 año a 3 años'
        WHEN hire_date > now() - INTERVAL '6 years' THEN '3 años a 6 años'
        ELSE 'más de 6 años'
    END AS rango_antiguedad
FROM
    employees
ORDER BY
    hire_date DESC;