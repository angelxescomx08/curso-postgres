SELECT * FROM country;

--aletar el tipo de una columna de string a un entero, el USING es para un error de no poder castear automaticamente
ALTER TABLE country ALTER continent TYPE int4 USING continent::integer;