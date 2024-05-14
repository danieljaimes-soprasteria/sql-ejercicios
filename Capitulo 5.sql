-- C05E01 EJERCICIO 1
SELECT
    e.first_name,
    e.hire_date
FROM
    employees e
WHERE
    TO_DATE(e.hire_date, 'dd/mm/yy') BETWEEN TO_DATE('01/01/2002', 'DD/MM/YYYY') AND TO_DATE('12/12/2005', 'DD/MM/YYYY');
    
-- C05E02 EJERCICIO 2
SELECT
    e.first_name,
    e.hire_date
FROM
    employees e
WHERE
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'mm') = 5;


-- C05E03 EJERCICIO 3
SELECT
    e.first_name
FROM
    employees e
WHERE
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') = 2001;

-- C05E04 EJERCICIO 4
SELECT
    *
FROM
    employees e
WHERE
    TO_DATE(e.hire_date, 'dd/mm/yy') BETWEEN TO_DATE('01/01/2005', 'DD/MM/YYYY') AND TO_DATE('12/12/2008', 'DD/MM/YYYY');
    
-- C05E05 EJERCICIO 5
SELECT
    TO_DATE(sysdate, 'dd/mm/yy') - TO_DATE('27-02-1995', 'dd-mm-yyyy') "DAYS DIFF"
FROM
    dual;
    
-- C05E06 EJERCICIO 6
SELECT
    l.city,
    l.postal_code,
    CAST(l.postal_code AS NUMBER) + 100 "Codigo Postal nuevo"
FROM
    locations l
WHERE
    l.country_id = 'US';

-- C05E07 EJERCICIO 7
SELECT
    e.first_name,
    e.last_name,
    j.job_id,
    d.department_name,
    CASE
        WHEN e.department_id = 60 THEN
            'Profile IT'
        ELSE
            'Profile Non-IT'
    END AS "PROFILE"
FROM
    employees   e,
    departments d,
    jobs        j
WHERE
        d.department_id = e.department_id
    AND j.job_id = e.job_id
    AND j.job_id = 'IT_PROG';

-- C05E08 EJERCICIO 8
SELECT
    d.department_id,
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy') "YEAR",
    COUNT(*)        "n empleados"
FROM
    departments d,
    employees   e
WHERE
    d.department_id = e.department_id
GROUP BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy'),
    d.department_id
ORDER BY
    to_char(TO_DATE(e.hire_date, 'dd/mm/yy'),
            'yyyy');
-- C05E09 EJERCICIO 9
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    e.salary,
    e.commission_pct,
    e.salary / e.commission_pct "COMISION Y SALARO TOTAL"
FROM
    employees e,
    jobs      j
WHERE
    j.job_id = e.job_id;