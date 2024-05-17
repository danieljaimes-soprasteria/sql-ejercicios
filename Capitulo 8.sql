-- C08E01 EJERCICIO 1
SELECT
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'Month') "Month"
FROM
    employees e
WHERE
    e.department_id IN (
        SELECT
            d.department_id
        FROM
            departments d
        WHERE
            d.location_id = (
                SELECT
                    l.location_id
                FROM
                    locations l
                WHERE
                    l.city = 'Seattle'
            )
    )
GROUP BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'Month')
HAVING
    COUNT(*) > 2;

-- C08E02 EJERCICIO 2
SELECT
    *
FROM
    departments d
WHERE
    department_id IN (
        SELECT
            e.department_id
        FROM
            employees e
        GROUP BY
            e.department_id
        HAVING
            MAX(e.salary) > 10000
    );

-- C08E03 EJERCICIO 3
SELECT
    j.job_title
FROM
    jobs j
WHERE
    j.job_id IN (
        SELECT
            e.job_id
        FROM
            employees e
        WHERE
            to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
                    'yyyy') = 2005
    );

-- C08E04 EJERCICIO 4
SELECT
    *
FROM
    employees e
WHERE
    e.employee_id IN (
        SELECT
            jh.employee_id
        FROM
            job_history jh
        GROUP BY
            jh.employee_id
        HAVING
            COUNT(*) = 1
    );
    
-- C08E05 EJERCICIO 5
SELECT
    j.job_title,
    AVG(e.salary) AS average_salary
FROM
    employees e,
    jobs      j
WHERE
    e.employee_id IN (
        SELECT
            jh.employee_id
        FROM
            job_history jh
        WHERE
            jh.job_id = j.job_id
    )
GROUP BY
    j.job_title;

-- C08E06 EJERCICIO 6
SELECT
    c.country_name,
    l.city,
    COUNT(*) "n. dept"
FROM
         countries c
    NATURAL JOIN locations   l
    NATURAL JOIN departments d
WHERE
    5 > (
        SELECT
            COUNT(*)
        FROM
            employees e
        WHERE
            e.department_id = d.department_id
    )
GROUP BY
    c.country_name,
    l.city;
-- C08E07 EJERCICIO 7
SELECT
    *
FROM
    employees e1
WHERE
    e1.employee_id IN (
        SELECT
            d.manager_id
        FROM
            departments d
        WHERE
            d.department_id IN (
                SELECT
                    e2.department_id
                FROM
                    employees e2
                GROUP BY
                    e2.department_id
                HAVING
                    COUNT(*) > 5
            )
        GROUP BY
            d.manager_id
    );

-- C08E08 EJERCICIO 8
SELECT
    *
FROM
    departments d
WHERE
    d.department_id IN (
        SELECT
            e.department_id
        FROM
            employees e
        WHERE
            e.employee_id IN (
                SELECT
                    jh.employee_id
                FROM
                    job_history jh
                GROUP BY
                    jh.employee_id
                HAVING
                    COUNT(*) > 1
            )
        GROUP BY
            e.department_id
        HAVING
            MAX(e.salary) > 10000
    );

-- C08E09 EJERCICIO 9
SELECT
    *
FROM
    jobs j
WHERE
    j.job_id IN (
        SELECT
            e.job_id
        FROM
            employees e
        WHERE
            e.employee_id IN (
                SELECT
                    jh.employee_id
                FROM
                    job_history jh
                WHERE
                    jh.job_id = 'IT_PROG'
            )
    );

-- C08E10 EJERCICIO 10
SELECT
    *
FROM
    employees e1,
    (
        SELECT
            d.department_id,
            MAX(e2.salary) salary
        FROM
            departments d,
            employees   e2
        WHERE
            e2.department_id = d.department_id
        GROUP BY
            d.department_id
    )         t
WHERE
        e1.department_id = t.department_id
    AND e1.salary = t.salary;

-- C08E11 EJERCICIO 11
SELECT
    *
FROM
    locations l
WHERE
    l.location_id = (
        SELECT
            d.location_id
        FROM
            departments d
        WHERE
            d.department_id = (
                SELECT
                    e.department_id
                FROM
                    employees e
                WHERE
                    e.employee_id = 105
            )
    );

-- C08E12 EJERCICIO 12
SELECT
    *
FROM
    (
        SELECT
            e.*,
            ROW_NUMBER()
            OVER(
                ORDER BY
                    e.salary DESC
            ) AS rn
        FROM
            employees e
        ORDER BY
            e.salary DESC
    )
WHERE
    rn = 3;
    
-- C08E13 EJERCICIO 13
SELECT
    e.department_id,
    e.first_name,
    e.last_name
FROM
    employees e
WHERE
    e.department_id IN (
        SELECT
            d.department_id
        FROM
            departments d
            LEFT JOIN employees   e ON ( e.department_id = d.department_id )
        WHERE
            e.first_name = 'John'
    );

-- C08E14 EJERCICIO 14
SELECT
    d.department_id,
    d.department_name,
    e.salary
FROM
    departments d,
    employees   e
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name,
    e.salary
HAVING
    e.salary = (
        SELECT
            MAX(e2.salary)
        FROM
            employees e2
        WHERE
            e2.department_id = d.department_id
    );

-- C08E15 EJERCICIO 15
SELECT
    *
FROM
    employees e
WHERE
    e.department_id IN (
        SELECT
            d.department_id
        FROM
            departments d
            LEFT JOIN employees   e1 ON ( e1.department_id = d.department_id )
        GROUP BY
            d.department_id
        HAVING
            COUNT(*) < 10
    );

-- C08E16 EJERCICIO 16
SELECT
    loc.city,
    AVG(e.salary) AS avg_salary
FROM
         (
        SELECT
            salary,
            department_id
        FROM
            employees
    ) e
    NATURAL JOIN departments d
    NATURAL JOIN locations   loc
GROUP BY
    loc.city
ORDER BY
    loc.city;

-- C08E17 EJERCICIO 17
SELECT
    (
        SELECT
            AVG(e.salary)
        FROM
            employees e
        WHERE
            job_id = 'IT_PROG'
    ) - (
        SELECT
            ( j.min_salary + j.max_salary ) / 2
        FROM
            jobs j
        WHERE
            j.job_id = 'IT_PROG'
    ) AS "DIff. salary"
FROM
    dual;

-- C08E18 EJERCICIO 18
SELECT
    *
FROM
    employees e1
WHERE
    e1.salary = (
        SELECT
            MAX(e.salary)
        FROM
            employees e
        WHERE
            e.department_id = 30
    );

-- C08E19 EJERCICIO 19
SELECT
    *
FROM
    (
        SELECT
            e.employee_id,
            (
                SELECT
                    COUNT(*)
                FROM
                    employees e2
                WHERE
                    e2.manager_id = e.employee_id
            ) n_emp
        FROM
            employees e
        WHERE
            e.employee_id IN (
                SELECT
                    d.manager_id
                FROM
                    departments d
            )
    )
WHERE
    n_emp > 5
ORDER BY
    n_emp DESC;

-- C0E820 EJERCICIO 20
SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    r.region_id,
    r.region_name,
    l.state_province,
    d.department_id,
    d.department_name
FROM
    employees   e
    LEFT JOIN departments d ON ( e.department_id = d.department_id )
    LEFT JOIN locations   l ON ( l.location_id = d.location_id )
    LEFT JOIN countries   c ON ( c.country_id = l.country_id )
    LEFT JOIN regions     r ON ( r.region_id = c.region_id )
WHERE
        l.state_province <> 'Texas'
    AND d.department_name <> 'Finance'
    AND e.salary > (
        SELECT
            AVG(e2.salary)
        FROM
            employees e2
        WHERE
            e2.department_id = e.department_id
    )
ORDER BY
    e.employee_id ASC;