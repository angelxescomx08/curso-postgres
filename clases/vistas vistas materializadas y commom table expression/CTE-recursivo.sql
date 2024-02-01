--nombre de la tabla en memoria 
--campos que vamos a tener
WITH RECURSIVE countdown( val ) as (
	--inicializar valores, se puede usar values(5, ...) poniendo todos los valores necesarios
	SELECT 5 AS val
	UNION
	--query recursivo
	SELECT val - 1 FROM countdown WHERE val > 1
)SELECT * FROM countdown;


WITH RECURSIVE countup( val ) as (
	--inicializar valores, se puede usar values(5, ...) poniendo todos los valores necesarios
	SELECT 1 AS val
	UNION
	--query recursivo
	SELECT val + 1 FROM countup WHERE val < 10
)SELECT * FROM countup;

WITH RECURSIVE multiplication_table( base, val, result ) as (
	--inicializar valores, se puede usar values(5, ...) poniendo todos los valores necesarios
	SELECT 5 AS base, 1 AS val, 5*1 AS result
	UNION
	--query recursivo
	SELECT 5 AS base, val + 1, (val+1)*base FROM multiplication_table
	WHERE val < 10
)SELECT * FROM multiplication_table;
