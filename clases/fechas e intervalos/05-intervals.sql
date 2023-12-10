SELECT
    MAX(hire_date),
    MAX(hire_date) + INTERVAL '1 years' AS adding_years,
    MAX(hire_date) + INTERVAL '1 months' AS adding_months,
    MAX(hire_date) + INTERVAL '1 days' AS adding_months,
    MAX(hire_date) + INTERVAL '1 years' + INTERVAL '1 months' + INTERVAL '1 days' AS adding_multiple,
    MAX(hire_date) + MAKE_INTERVAL(years := 23) AS make_interval
FROM
    employees;