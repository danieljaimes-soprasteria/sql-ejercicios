-- C03E01 EJERCICIO 1
SELECT
    *
FROM
    jobs j
ORDER BY
    j.job_title DESC;

-- C03E02 EJERCICIO 2
SELECT
    *
FROM
    employees e
WHERE
    TO_DATE(e.hire_date, 'yy/mm/dd') >= TO_DATE('2018/01/01', 'yyyy/mm/dd');
    
-- C03E03 EJERCICIO 3
SELECT
    *
FROM
    employees e
WHERE
    e.employee_id = 160
    OR e.employee_id = 150;
    
-- C03E04 EJERCICIO 4
SELECT
    e.first_name,
    e.salary,
    e.commission_pct,
    e.hire_date
FROM
    employees e
WHERE
    e.salary < 10000;
  
-- C03E05 EJERCICIO 5
SELECT
    j.job_title,
    ( j.max_salary - j.min_salary ) AS "Diff. Salary"
FROM
    jobs j
WHERE
    j.max_salary BETWEEN 10000 AND 20000;
    
-- C03E06 EJERCICIO 6
SELECT
    *
FROM
    employees e
WHERE
    e.first_name LIKE 'S%'
    OR e.last_name LIKE 'S%';

-- C03E07 EJERCICIO 7
SELECT
    *
FROM
    employees e
WHERE
    e.commission_pct IS NULL
    AND e.salary BETWEEN 5000 AND 10000
    AND e.department_id = 30;
    
-- C03E08 EJERCICIO 8
SELECT
    e.first_name,
    e.department_id,
    e.hire_date
FROM
    employees e
ORDER BY
    e.department_id,
    TO_DATE(e.hire_date, 'yy/mm/dd') ASC;
    
-- C03E09 EJERCICIO 9
SELECT
    e1.employee_id
    || ' '
    || e1.first_name
    || ' '
    || e1.last_name "EMPLEADO",
    e2.employee_id
    || ' '
    || e2.first_name
    || ' '
    || e2.last_name "JEFE"
FROM
    employees e1,
    employees e2
WHERE
    e1.manager_id = e2.employee_id;

-- C03E10 EJERCICIO 10
SELECT
    j.job_title,
    e.salary
FROM
    employees e,
    jobs      j
WHERE
        e.job_id = j.job_id
    AND e.manager_id = 100
    OR e.manager_id = 125
    AND e.salary > 6000;
    
-- C03E11 EJERCICIO 11
SELECT
    l.location_id,
    l.city,
    d.department_name
FROM
    locations   l,
    departments d
WHERE
    l.location_id = d.location_id;

-- C03E12 EJERCICIO 12
SELECT
    r.region_id,
    r.region_name,
    c.country_name
FROM
    regions   r,
    countries c
WHERE
    c.region_id = r.region_id;
    
-- C03E13 EJERCICIO 13
SELECT
    r.region_id,
    r.region_name,
    l.location_id,
    l.city,
    c.country_id,
    c.country_name
FROM
    regions   r,
    countries c,
    locations l
WHERE
        r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND l.location_id > 2400;

-- C03E14 EJERCICIO 14
SELECT
    r.region_id       "Region",
    r.region_name     "Nombre Region",
    'Codigo Pais: '
    || c.country_id
    || ' Nombre: '
    || c.country_name "ID - Pais",
    l.location_id     "Localizacion",
    l.street_address  "Direccion",
    l.postal_code     "Codigo Postal"
FROM
    regions   r,
    countries c,
    locations l
WHERE
        r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND l.postal_code IS NOT NULL;
-- C03E15 EJERCICIO 15
SELECT
    r.region_name "Nombre Region",
    c.country_name,
    l.state_province,
    e.employee_id,
    e.first_name,
    e.last_name
FROM
    regions     r,
    countries   c,
    locations   l,
    employees   e,
    departments d
WHERE
        r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND d.location_id = l.location_id
    AND d.manager_id = e.employee_id
    AND l.state_province IN ( 'Washington', 'Oxford' )
    AND c.country_name IN ( 'United States of America', 'United Kingdom' );

-- C03E16 EJERCICIO 16
SELECT
    c.country_name,
    e.first_name,
    e.last_name
FROM
    countries   c,
    locations   l,
    employees   e,
    departments d
WHERE
        c.country_id = l.country_id
    AND d.location_id = l.location_id
    AND d.manager_id = e.employee_id
    AND c.country_name LIKE 'C%';

-- C03E17 EJERCICIO 17
SELECT
    j.job_title "JOB_TITLE",
    e.first_name,
    e.last_name,
    e.hire_date
FROM
    jobs      j,
    employees e
WHERE
        j.job_id = e.job_id
    AND e.email = 'NKOCHHAR'
    AND e.hire_date = '21/09/05';
    
-- C03E18 EJERCICIO 18
SELECT
    *
FROM
    employees e
WHERE
    e.department_id IN ( 10, 20, 80 )
    AND ( TO_DATE('24/05/13') - TO_DATE(e.hire_date) ) > 180
    AND e.commission_pct >= 0.20
    AND ( e.first_name LIKE 'J%'
          OR e.last_name LIKE 'J%' );

-- C03E19 EJERCICIO 19
SELECT
    e.employee_id
    || ', '
    || e.first_name
    || ', '
    || e.last_name    "Nombre Completo",
    e.salary          "Salario",
    e.department_id   "Código de Departamento",
    d.department_name "Descipcion"
FROM
    employees   e,
    departments d
WHERE
        d.department_id = e.department_id
    AND d.department_name = 'IT'
ORDER BY
    e.salary;

-- C03E20 EJERCICIO 20
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    l.postal_code,
    l.city
FROM
    employees   e,
    departments d,
    locations   l
WHERE
        d.department_id = e.department_id
    AND d.location_id = l.location_id
    AND e.department_id IN ( 100, 80, 50 )
    AND l.city = 'South San Francisco'
    AND e.salary BETWEEN 4000 AND 8000;

-- C03E21 EJERCICIO 21
SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    r.region_name,
    c.country_name,
    l.state_province,
    e.department_id,
    d.department_name
FROM
    employees   e,
    departments d,
    regions     r,
    countries   c,
    locations   l
WHERE
        r.region_id = c.region_id
    AND c.country_id = l.country_id
    AND d.location_id = l.location_id
    AND e.department_id = d.department_id
    AND l.state_province <> 'Texas'
    AND d.department_name <> 'Finance'
ORDER BY
    e.employee_id ASC;