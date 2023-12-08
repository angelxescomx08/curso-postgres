-- se tiene que especificar el mes y día
select
    hire_date
from
    employees
where
    hire_date BETWEEN date('1998-01-01')
    and date('2000-01-01');
select
    max(hire_date) as mas_nuevo,
    min(hire_date) as primer_empleado
from
    employees;