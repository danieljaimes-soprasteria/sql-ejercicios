-- C11E01 EJERCICIO 1

CREATE TABLE dup_countries
    AS
        SELECT
            *
        FROM
            countries;

CREATE TABLE employees_v1
    AS
        SELECT
            *
        FROM
            employees;

-- C11E02 EJERCICIO 2
CREATE TABLE countries_v2
    AS
        SELECT
            c.country_id,
            country_name,
            r.region_id
        FROM
            countries c,
            regions   r
        WHERE
            r.region_id = c.region_id;

ALTER TABLE countries_v2 ADD CONSTRAINT countries_v2_pk PRIMARY KEY ( country_id );

-- C11E03 EJERCICIO 3
CREATE TABLE employees_v2 (
    employee_id   NUMBER(6, 0) UNIQUE,
    first_name    VARCHAR2(20 BYTE),
    last_name     VARCHAR2(25 BYTE),
    email         VARCHAR2(25 BYTE),
    phone_number  VARCHAR2(20 BYTE),
    hire_date     DATE,
    job_id        VARCHAR2(10 BYTE),
    salary        NUMBER(8, 2),
    commission    NUMBER(2, 2),
    manager_id    NUMBER(6, 0),
    department_id NUMBER(4, 0),
    CONSTRAINT fk_job_id FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id ),
    CONSTRAINT fk_dept_id FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id )
);

-- C11E04 EJERCICIO 4

UPDATE employees_v1
SET
    email = 'not available';

-- C11E05 EJERCICIO 5
UPDATE employees_v1
SET
    email = 'NA',
    commission_pct = 0.10;


-- C11E06 EJERCICIO 6

UPDATE employees_v1
SET
    job_id = 'SH_CLERK'
WHERE
        employee_id = 118
    AND department_id = 30
    AND job_id NOT LIKE 'SH%';

-- C11E07 EJERCICIO 7
UPDATE employees_v1
SET
    salary =
        CASE
            WHEN department_id = 40  THEN
                salary * 1.25
            WHEN department_id = 90  THEN
                salary * 1.15
            WHEN department_id = 110 THEN
                salary * 1.10
        END
WHERE
    department_id IN ( 40, 90, 110 );

-- C11E08 EJERCICIO 8
ALTER TABLE countries_v2 RENAME TO countries_new;

-- .C11E09 EJERCICIO 9
CREATE TABLE locations_v2
    AS
        SELECT
            *
        FROM
            locations;

ALTER TABLE locations_v2 ADD main_id INT;

ALTER TABLE locations_v2 MODIFY
    main_id VARCHAR2(255);
    

-- C11E10 EJERCICIO 10
CREATE TABLE job_history_v2
    AS
        SELECT
            *
        FROM
            job_history;

ALTER TABLE job_history_v2
    ADD CONSTRAINT fk_jh_v2_job_id FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id );

ALTER TABLE job_history_v2
    ADD CONSTRAINT fk_department_id FOREIGN KEY ( department_id )
        REFERENCES departments ( department_id );

-- C11E11 EJERCICIO 11
ALTER TABLE job_history_v2 DROP CONSTRAINT fk_jh_v2_job_id;

ALTER TABLE job_history_v2 DROP CONSTRAINT fk_department_id;

-- 