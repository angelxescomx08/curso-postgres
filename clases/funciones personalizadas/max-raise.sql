CREATE OR REPLACE FUNCTION max_raise (empl_id int)
RETURNS NUMERIC(8,2) 
AS $$
	DECLARE
		--salary NUMERIC(8,2);
		possible_raise NUMERIC(8,2);
	BEGIN
		SELECT max_salary - salary INTO possible_raise
		FROM employees INNER JOIN jobs ON jobs.job_id = employees.job_id
		WHERE employee_id = empl_id;
		
		RETURN possible_raise;
	END;
$$
LANGUAGE plpgsql;

SELECT max_raise(206);