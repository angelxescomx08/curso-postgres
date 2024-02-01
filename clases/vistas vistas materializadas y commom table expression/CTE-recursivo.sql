--nombre de la tabla en memoria 
--campos que vamos a tener
WITH RECURSIVE countdown( val ) as (
	--inicializar valores, se puede usar values(5, ...) poniendo todos los valores necesarios
	SELECT 5 AS val
	UNION
	--query recursivo
	SELECT val - 1 FROM countdown WHERE val > 1
)SELECT * FROM countdown;