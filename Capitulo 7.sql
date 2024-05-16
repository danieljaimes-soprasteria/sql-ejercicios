-- C07E01 EJERCICIO 1
SELECT
    d.department_name,
    COUNT(*)
FROM
         departments d
    JOIN employees USING ( department_id )
GROUP BY
    d.department_name;

-- C07E02 EJERCICIO 2
SELECT
    j.job_title,
    e.employee_id,
    TO_DATE(jh.end_date, 'dd/mm/yy') - TO_DATE(jh.start_date, 'dd/mm/yy') "days"
FROM
    employees   e
    LEFT JOIN jobs        j ON ( e.job_id = j.job_id )
    LEFT JOIN job_history jh ON ( jh.employee_id = e.employee_id )
WHERE
    e.department_id = 30;

-- C07E03 EJERCICIO 3
SELECT
    d.department_name,
    e.first_name
FROM
    departments d
    LEFT JOIN employees   e ON ( d.manager_id = e.employee_id );

-- C07E04 EJERCICIO 4
SELECT
    d.department_name,
    e.first_name,
    l.city
FROM
    departments d
    LEFT JOIN employees   e ON ( d.manager_id = e.employee_id )
    LEFT JOIN locations   l ON ( d.location_id = l.location_id );
    
--  C07E05 EJERCICIO 5
SELECT
    c.country_name,
    l.city,
    d.department_name
FROM
    departments d
    LEFT JOIN locations   l ON ( d.location_id = l.location_id )
    LEFT JOIN countries   c ON ( c.country_id = l.country_id );

-- C07E06 EJERCICIO 6
SELECT
    j.job_title,
    e.last_name,
    TO_DATE(e.hire_date, 'dd/mm/yy')
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id )
WHERE
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') BETWEEN 2000 AND 2005;

-- C07E07 EJERCICIO 7
SELECT
    j.job_title,
    AVG(e.salary)
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id )
GROUP BY
    j.job_title;

-- C07E08 EJERCICIO 8
SELECT
    j.job_title,
    e.first_name,
    j.max_salary - e.salary,
    e.salary
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id );

--  C07E09 EJERCICIO 9
SELECT
    j.job_title,
    e.last_name
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id )
WHERE
    e.commission_pct IS NULL
    AND e.department_id = 30;

-- C07E10 EJERCICIO 10
SELECT
    e.*,
    j.job_title
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id )
WHERE
    e.salary > 15000;
    
-- C07E11 EJERCICIO 11
SELECT
    d.department_name,
    e.first_name,
    e.salary
FROM
    departments d
    LEFT JOIN employees   e ON ( e.employee_id = d.manager_id )
WHERE
    ( TO_DATE(sysdate, 'dd/mm/yy') - TO_DATE(e.hire_date, 'dd/mm/yy') ) / 365.25 > 5;

-- C07E13 EJERCICIO 13
SELECT
    e.first_name,
    j.job_title
FROM
    employees   e
    LEFT JOIN jobs        j ON ( e.job_id = j.job_id )
    LEFT JOIN job_history jh ON ( e.employee_id = jh.employee_id )
WHERE
    months_between(TO_DATE(jh.end_date, 'dd/mm/yy'),
                   TO_DATE(jh.start_date, 'dd/mm/yy')) < 13;
-- C07E14 EJERCICIO 14
SELECT
    e.first_name,
    e.department_id,
    c.country_name
FROM
    employees   e
    LEFT JOIN departments d ON ( e.department_id = d.department_id )
    LEFT JOIN locations   l ON ( d.location_id = l.location_id )
    LEFT JOIN countries   c ON ( c.country_id = l.country_id );

-- C07E15 EJERCICIO 15
SELECT
    d.department_name,
    AVG(e.salary),
    COUNT(*)
FROM
    departments d
    LEFT JOIN employees   e ON ( e.department_id = d.department_id )
WHERE
    e.commission_pct IS NOT NULL
GROUP BY
    d.department_name;

-- C07E16 EJERCICIO 16
SELECT
    e.first_name,
    j.job_title,
    jh.start_date,
    jh.end_date
FROM
    employees   e
    LEFT JOIN jobs        j ON ( e.job_id = j.job_id )
    LEFT JOIN job_history jh ON ( e.employee_id = jh.employee_id )
WHERE
    e.commission_pct IS NULL;

-- C07E17 EJERCICIO 17
SELECT
    e1.first_name "Empleado",
    e2.first_name "JEFE"
FROM
    departments d
    LEFT JOIN employees   e1 ON ( e1.department_id = d.department_id )
    LEFT JOIN employees   e2 ON ( e2.manager_id = d.manager_id );

-- C07E18 EJERCICIO 18
SELECT
    e.department_id,
    d.department_name,
    COUNT(*)
FROM
    departments d
    RIGHT OUTER JOIN employees   e ON ( e.department_id = d.department_id )
GROUP BY
    d.department_name,
    e.department_id
ORDER BY
    e.department_id;

-- C07E19 EJERCICIO 19
SELECT
    e.department_id,
    d.department_name,
    COUNT(*)
FROM
    employees   e
    LEFT OUTER JOIN departments d ON ( e.department_id = d.department_id )
GROUP BY
    d.department_name,
    e.department_id
ORDER BY
    e.department_id;

-- C07E20 EJERCICIO 20
SELECT
    e.first_name,
    e.last_name,
    e.employee_id,
    j.job_title
FROM
    employees e
    LEFT JOIN jobs      j ON ( e.job_id = j.job_id )
WHERE
    e.salary > j.min_salary * 2;

-- C07E21 EJERCICIO 21
SELECT
    e.department_id,
    d.department_name,
    e.last_name
FROM
    employees   e
    FULL OUTER JOIN departments d ON ( e.department_id = d.department_id )
WHERE
    e.department_id IS NULL
    OR e.department_id IS NOT NULL
ORDER BY
    d.department_id,
    e.last_name;

-- C07E22 EJERCICIO 22
SELECT
    e.employee_id,
    e.last_name
    || ', '
    || e.first_name       "FULL NAME",
    upper(substr(e.email, 0, 1))
    || lower(substr(e.email,
                    2,
                    length(e.email)))
    || '@eisi.ues.edu.sv' "EMAIL",
    CASE
        WHEN length(e.phone_number) = 12 THEN
            '('
            || substr(e.phone_number, 1, 3)
            || ')-'
            || substr(e.phone_number, 5, 3)
            || '-'
            || substr(e.phone_number, 9, 4)
        WHEN length(e.phone_number) > 12 THEN
            '('
            || substr(e.phone_number, 1, 3)
            || ')-'
            || substr(e.phone_number, 5, 2)
            || '-'
            || substr(e.phone_number, 8, 4)
            || '-'
            || substr(e.phone_number, 13, 5)
    END                   AS "phone_number"
FROM
    employees e
ORDER BY
    e.employee_id;