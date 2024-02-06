SELECT
    CURRENT_DATE AS "date",
    salary,
    max_raise(employee_id),
    max_raise(employee_id) * 0.05 AS amount,
    5 AS percentage
FROM
    employees;
    
CREATE OR REPLACE PROCEDURE controlled_raise( percentage NUMERIC ) AS
$$

	DECLARE
		amount NUMERIC(8,2);
		real_percentage NUMERIC(8,2);
		total_employees INT;
	
	BEGIN
	
		real_percentage = percentage / 100;
		
		--mantener el historico
		INSERT INTO raise_history(date, employee_id, base_salary, amount, percentage)
		SELECT
		    CURRENT_DATE AS "date",
		    employee_id,
		    salary,
		    max_raise(employee_id) * real_percentage AS amount,
		    percentage
		FROM
		    employees;
		    
		--actualizar la tabla
		UPDATE employees SET salary = (max_raise(employee_id) * real_percentage) + salary;
		
		    
		COMMIT;
		
		SELECT COUNT(*) into total_employees FROM employees;
	
		RAISE NOTICE 'Afectados % empleados', total_employees;
	
	END;

$$
LANGUAGE plpgsql;

CALL controlled_raise(1);