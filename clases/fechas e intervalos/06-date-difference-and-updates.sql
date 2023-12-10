SELECT
    hire_date,
    MAKE_INTERVAL(
        YEARS := 2023 - EXTRACT(
            YEARS
            FROM
                hire_date
        ) :: integer
    ),
    MAKE_INTERVAL(
        YEARS := date_part('years', now()) :: INTEGER - EXTRACT(
            YEARS
            FROM
                hire_date
        ) :: integer
    )
FROM
    employees
ORDER BY
    hire_date DESC;
--actualización masiva de empleados
UPDATE
    employees
SET
    hire_date = date(hire_date + INTERVAL '23 years');
SELECT
    *
FROM
    employees;