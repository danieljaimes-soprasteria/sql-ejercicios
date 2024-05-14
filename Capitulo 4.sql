-- C04E01 EJERCICIO 1
SELECT
    e.first_name,
    e.salary,
    e.salary / 1000
FROM
    employees e;

-- C04E02 EJERCICIO 2
SELECT
    e.first_name,
    j.min_salary
FROM
    employees e,
    jobs      j
WHERE
    e.job_id = j.job_id;

--C04E03 EJERCICIO 3
SELECT
    upper(substr(e.first_name, 1, 1))
    || lower(substr(e.first_name,
                    2,
                    length(e.first_name))),
    upper(substr(e.last_name, 1, 1))
    || lower(substr(e.last_name,
                    2,
                    length(e.last_name)))
FROM
    employees e;

--C04E04 EJERCICIO 4
SELECT
    substr(j.job_title, 1, 3)
FROM
    employees e,
    jobs      j
WHERE
    e.job_id = j.job_id;
    
--C04E05 EJERCICIO 5
SELECT
    length(e.first_name)
FROM
    employees e
WHERE
    substr(e.last_name,
           3,
           length(e.last_name)) = '%d%';
           
-- C04E06 EJERCICIO 6
SELECT
    upper(e.first_name),
    lower(e.email)
FROM
    employees e
WHERE
    lower(e.last_name) = lower(substr(e.email,
                                      2,
                                      length(e.email)));
-- C04E07 EJERCICIO 7
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    months_between(TO_DATE('14-05-2024',
                   'dd-mm-yyyy'),
                   TO_DATE(e.hire_date, 'yy/mm/dd')) "Months"
FROM
    employees e
ORDER BY
    TO_DATE(e.hire_date, 'yy/mm/dd');

-- C04E08 EJERCICIO 8
SELECT
    e.first_name
    || ' '
    || e.last_name,
    d.department_name,
    e.phone_number
FROM
    employees   e,
    departments d
WHERE
        d.department_id = e.department_id
    AND substr(e.phone_number, 1, 3) = 515
    AND length(e.phone_number) > 12;