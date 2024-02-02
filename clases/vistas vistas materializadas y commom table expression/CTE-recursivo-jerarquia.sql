SELECT * FROM employees;

INSERT INTO employees(name,reports_to) VALUES ('Jefe Carlos',NULL);
INSERT INTO employees(name,reports_to) VALUES ('Subjefe Susana',1);
INSERT INTO employees(name,reports_to) VALUES ('Subjefe Juan',1);
INSERT INTO employees(name,reports_to) VALUES ('Gerente Pedro',3);
INSERT INTO employees(name,reports_to) VALUES ('Subjefe Melisa',3);
INSERT INTO employees(name,reports_to) VALUES ('Gerente Carmen',2);
INSERT INTO employees(name,reports_to) VALUES ('Subgerente Ramiro',5);
INSERT INTO employees(name,reports_to) VALUES ('Programador Fernando',7);
INSERT INTO employees(name,reports_to) VALUES ('Programador Eduardo',7);
INSERT INTO employees(name,reports_to) VALUES ('Persidente Carla',NULL);


WITH RECURSIVE bosses AS (
	--init
	SELECT id,name,reports_to, 1 as depth FROM employees WHERE id = 1
	UNION
	--recursividad
	SELECT employees.id,employees.name,employees.reports_to, depth + 1 FROM employees 
	INNER JOIN bosses ON bosses.id = employees.reports_to
	--caso base
	WHERE depth < 2
)
SELECT * FROM bosses;
