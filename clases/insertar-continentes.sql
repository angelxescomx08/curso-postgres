SELECT DISTINCT continent FROM country ORDER BY continent ASC;

--Obtener e Insertar valores de la base de datos
INSERT INTO continent(name) SELECT DISTINCT continent FROM country ORDER BY continent ASC;