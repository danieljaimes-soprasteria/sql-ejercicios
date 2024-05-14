-- C02E01 EJERCICIO 1
desc employees;

-- C02E02 EJERCICIO 2
SELECT
    c.country_id,
    c.country_name,
    r.region_name
FROM
    countries c
    LEFT JOIN regions   r ON r.region_id = c.region_id;

-- C02E03 EJERCICIO 3
SELECT
    e.manager_id
FROM
    employees e;

-- C02E03 EJERCICIO 4
SELECT
    e.first_name || ' ' || e.last_name "FULL NAME",
    e.hire_date
FROM
    employees e;
    
-- C02E03 EJERCICIO 5

SELECT
    e.department_id * 1.5       "DEPT. ID",
    e.employee_id,
    (e.department_id * 1.5 * 100) / (jh.end_date - jh.start_date) "salary/day"
FROM
    employees   e
    LEFT JOIN job_history jh ON jh.employee_id = e.employee_id;