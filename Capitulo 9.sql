-- C09E01 EJERCICIO 1
SELECT
    e.employee_id,
    e.job_id
FROM
    employees e
UNION ALL
SELECT
    jh.employee_id,
    jh.job_id
FROM
    job_history jh,
    employees   e
WHERE
    jh.employee_id = e.employee_id;

-- C09E02 EJERCICIO 2
SELECT
    e.department_id,
    l.location_id,
    e.hire_date
FROM
    employees   e
    LEFT JOIN departments d ON ( d.department_id = e.department_id )
    LEFT JOIN locations   l ON ( l.location_id = d.location_id );

-- C09E03 EJERCICIO 3
SELECT
    *
FROM
    (
        SELECT
            d1.*
        FROM
            employees   e
            LEFT JOIN departments d1 ON ( e.department_id = d1.department_id )
        ORDER BY
            e.employee_id
    )
UNION ALL
SELECT
    *
FROM
    (
        SELECT
            d2.*
        FROM
            departments d2
            LEFT JOIN job_history jh ON ( jh.department_id = d2.department_id )
        ORDER BY
            jh.employee_id
    );
    
-- C09E04 EJERCICIO 4
SELECT
    e.employee_id
FROM
    employees e
UNION ALL
SELECT
    e.employee_id
FROM
    employees   e
    LEFT JOIN job_history jh ON ( jh.employee_id = e.employee_id );

-- C09E05 EJERCICIO 5
SELECT
    e.employee_id
FROM
    employees e
WHERE
    e.employee_id NOT IN (
        SELECT
            jh.employee_id
        FROM
            job_history jh
    );

-- C09E06 EJERCICIO 6
SELECT
    t.employee_id,
    LISTAGG(t."job", '; ') WITHIN GROUP(
    ORDER BY
        t."job"
    ) "JOBS"
FROM
    (
        SELECT
            e.employee_id,
            j.job_id
            || ' - '
            || j.job_title
            || ' - '
            || j.min_salary
            || ' - '
            || j.max_salary "job"
        FROM
            employees e,
            (
                SELECT
                    j.*
                FROM
                    jobs j
            )         j
        WHERE
            j.job_id = e.job_id
        UNION ALL
        SELECT
            jh.employee_id,
            j.job_id
            || ' - '
            || j.job_title
            || ' - '
            || j.min_salary
            || ' - '
            || j.max_salary "job"
        FROM
            job_history jh,
            (
                SELECT
                    j.*
                FROM
                    jobs j
            )           j
        WHERE
            j.job_id = jh.job_id
    ) t
GROUP BY
    t.employee_id,
    t."job"
ORDER BY
    t.employee_id;