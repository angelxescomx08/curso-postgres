CREATE OR REPLACE PROCEDURE insert_region_proc (int, varchar)
AS $$
	--DECLARE
	BEGIN
	
		INSERT INTO regions(region_id, region_name) VALUES($1,$2);
		
		RAISE NOTICE 'Variable 1: %, 2: %', $1, $2;
		
		--ROLLBACK
		COMMIT;
		
	END;
$$
LANGUAGE plpgsql;






