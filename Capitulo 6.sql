-- C06E01 EJERCICIO 1
SELECT
    e.manager_id,
    COUNT(*) "Emp. Gestionados"
FROM
    departments d,
    employees   e
WHERE
    d.manager_id = e.manager_id
GROUP BY
    e.manager_id;

-- C06E02 EJERCICIO 2
SELECT
    jh.employee_id,
    MIN(jh.end_date)
FROM
    job_history jh,
    employees   e
WHERE
    jh.employee_id = e.employee_id
GROUP BY
    jh.employee_id;

-- C06E03 EJERCICIO 3
SELECT
    COUNT(*)
FROM
    employees e
WHERE
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'dd') > 15;

-- C06E04 EJERCICIO 4
SELECT
    c.country_id,
    COUNT(*)
FROM
    countries c,
    locations l
WHERE
    c.country_id = l.country_id
GROUP BY
    c.country_id;
    
-- C06E05 EJERCICIO 5
SELECT
    j.job_title,
    COUNT(*),
    SUM(e.salary),
    MAX(e.salary) - MIN(e.salary)
FROM
    jobs      j,
    employees e
WHERE
    e.job_id = j.job_id
GROUP BY
    j.job_title;

-- C06E06 EJERCICIO 6
SELECT
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'Month') "Mes",
    COUNT(*)
FROM
    employees e
WHERE
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') = 2008
GROUP BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'Month');

-- C06E07 EJERCICIO 7

SELECT
    e.employee_id,
    COUNT(*)
FROM
    job_history jh,
    employees   e
WHERE
    jh.employee_id = e.employee_id
GROUP BY
    e.employee_id
HAVING
    COUNT(*) > 1;
    
-- C06E09 EJERCICIO 9
SELECT
    j.job_title,
    COUNT(*) "num. employees"
FROM
    jobs        j,
    employees   e,
    job_history jh
WHERE
        j.job_id = e.job_id
    AND e.employee_id = jh.employee_id
    AND TO_DATE(jh.end_date, 'dd/mm/yy') - TO_DATE(jh.start_date, 'dd/mm/yy') > 100
GROUP BY
    j.job_title;

-- C06E09 EJERCICIO 9
SELECT
    d.department_name
FROM
    departments d,
    employees   e
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_name
HAVING
    COUNT(*) > 5;

-- C06E10 EJERCICIO 10
SELECT
    e.first_name
FROM
    employees e
GROUP BY
    e.first_name
HAVING
    COUNT(*) = 1;

-- C06E11 EJERCICIO 11
SELECT
    r.region_id,
    r.region_name,
    COUNT(*)
FROM
    regions   r,
    countries c
WHERE
    r.region_id = c.region_id
GROUP BY
    r.region_id,
    r.region_name
ORDER BY
    COUNT(*) DESC;

-- C06E12 EJERCICIO 12
SELECT
    j.job_id,
    COUNT(*)
FROM
    jobs      j,
    employees e
WHERE
    j.job_id = e.job_id
GROUP BY
    j.job_id
ORDER BY
    COUNT(*) DESC;

-- C06E13 EJERCICIO 13
SELECT
    d.department_name,
    COUNT(*)
FROM
    departments d,
    employees   e
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_name
ORDER BY
    d.department_name;

-- C06E14 EJERCICIO 14
SELECT
    r.region_name,
    COUNT(*)
FROM
    departments d,
    locations   l,
    regions     r,
    countries   c
WHERE
        l.location_id = d.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id
GROUP BY
    r.region_name;
    
-- C06E15 EJERCICIO 15
SELECT
    d.department_id,
    d.department_name,
    AVG(e.salary)
FROM
    departments d,
    employees   e
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY
    AVG(e.salary) DESC;

-- C06E16 EJERCICIO 16
SELECT
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') "contract",
    MIN(e.salary),
    MAX(e.salary),
    AVG(e.salary)
FROM
    employees e
GROUP BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy')
ORDER BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') DESC;
-- C06E17 EJERCICIO 17
SELECT
    d.department_name,
    AVG(e.salary),
    MIN(e.salary),
    MAX(e.salary)
FROM
    departments d,
    employees   e
GROUP BY
    d.department_name;

-- C06E18 EJERCICIO 18
SELECT
    d.department_name,
    COUNT(*)
FROM
    departments d,
    employees   e
WHERE
        e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
GROUP BY
    d.department_name
HAVING
    COUNT(*) > 5;

-- C06E18 EJERCICIO 18 a
SELECT
    d.department_name,
    COUNT(*)
FROM
    departments d,
    employees   e
WHERE
        e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
    AND e.salary > 10000
GROUP BY
    d.department_name
HAVING
    COUNT(*) > 5;
    
-- C06E18 EJERCICIO 18 b
SELECT
    d.department_name,
    COUNT(*)
FROM
    departments d,
    employees   e
WHERE
        e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
    AND e.commission_pct > 0.25
GROUP BY
    d.department_name
HAVING
    COUNT(*) > 5;

-- C06E19 EJERCICIO 19
SELECT
    d.department_id "Código del Departamento",
    j.job_title     "Puesto de trabajo",
    COUNT(*)
FROM
    departments d,
    employees   e,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND d.department_id IN ( 50, 80 )
GROUP BY
    d.department_id,
    j.job_title
ORDER BY
    d.department_id,
    j.job_title;

-- C06E20 EJERCICIO 20
SELECT
    d.department_id "Código del Departamento",
    j.job_title     "Puesto de trabajo",
    COUNT(*)
FROM
    departments d,
    employees   e,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
GROUP BY
    d.department_id,
    j.job_title
HAVING
    COUNT(*) = 1;

-- C06E21 EJERCICIO 21
SELECT
    l.city,
    COUNT(*)
FROM
    employees   e,
    departments d,
    locations   l
WHERE
        e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND e.salary >= 5000
GROUP BY
    l.city;

-- C06E22 EJERCICIO 22
SELECT
    d.department_id "Código del Departamento",
    COUNT(*)
FROM
    departments d,
    employees   e
WHERE
    e.department_id = d.department_id
GROUP BY
    d.department_id
HAVING
    COUNT(*) > 10;

-- C06E023 EJERCICIO 23
SELECT
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy'),
    COUNT(*)
FROM
    employees e
GROUP BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy')
HAVING
    COUNT(*) > 10;