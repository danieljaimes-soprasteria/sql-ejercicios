-- C10E01 EJERCICIO 1
UPDATE employees e
SET
    salary = 8000
WHERE
        salary < 6000
    AND e.employee_id = 115;

-- C10E02 EJERCICIO 2
UPDATE employees e
SET
    salary = 8000
WHERE
        salary < 6000
    AND e.employee_id = 115;

-- C10E03 EJERCICIO 3
DELETE FROM employees e
WHERE
    e.employee_id = 115;

-- C10E04 EJERCICIO 4
UPDATE employees e
SET
    e.job_id = 'IT_PROG'
WHERE
        e.department_id = 10
    AND e.job_id LIKE 'IT%'
    AND e.employee_id = 110;

-- C10E05 EJERCICIO 5
INSERT INTO departments d VALUES (
    280,
    'NEW DEPT',
    120,
    1200
);

-- C10E06 EJERCICIO 6
update departments set manager_id = (select * fro)
SELECT
    e.employee_id,
    e.salary
FROM
    employees   e
    LEFT JOIN departments d ON ( e.employee_id = d.manager_id )
ORDER BY
    e.salary desc;