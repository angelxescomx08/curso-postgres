CREATE OR REPLACE FUNCTION greet_employee(name VARCHAR)
RETURNS VARCHAR
AS $$
	--DECLARE
	BEGIN
		RETURN 'Hola ' || name;
	END;
$$
LANGUAGE plpgsql;

SELECT first_name, greet_employee(first_name) FROM employees;
SELECT * FROM employees;