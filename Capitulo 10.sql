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
UPDATE departments
SET
    manager_id = (
        SELECT
            *
        FROM
            (
                SELECT
                    e.employee_id
                FROM
                    employees   e
                    LEFT JOIN departments d ON ( e.employee_id = d.manager_id )
                ORDER BY
                    e.salary DESC
            )
        WHERE
            ROWNUM = 1
    )
WHERE
    department_id = 280; 

-- C10E07 EJERCICIO 7
UPDATE employees
SET
    salary = (
        SELECT
            AVG(e.salary)
        FROM
            employees e
    )
WHERE
    salary = (
        SELECT
            MIN(e.salary)
        FROM
            employees e
    );