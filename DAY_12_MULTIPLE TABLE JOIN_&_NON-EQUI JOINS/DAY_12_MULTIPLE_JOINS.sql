
-- DATE : 16-01-2026
-- TOPICS : MULTIPLE TABLE JOIN , NON-EQUI JOINS


-- 1. WAQD grades of employees whose job profession is CLERK

	SELECT E.EMPLOYEE_ID ,E.FIRST_NAME , E.LAST_NAME ,E.JOB_ID, E.SALARY, S.GRADE
	FROM EMPLOYEES E 
	JOIN SALARY_GRADE S
	ON (E.SALARY >= MIN_SALARY
	AND E.SALARY <= MAX_SALARY)
	WHERE E.JOB_ID LIKE '%CLERK';
	
-- 2.WAQD country name of employees whose job description is like account

    SELECT  E.EMPLOYEE_ID, CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME) AS FULLNAME,
            E.JOB_ID,  C.COUNTRY_NAME
    FROM  EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    JOIN LOCATIONS L 
    ON (D.LOCATION_ID = L.LOCATION_ID)
    
    JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    WHERE E.JOB_ID LIKE '%ACCOUNT';
	
-- 3.WAQD details of employees whose location id is 1700 along with their state province 

    SELECT E.EMPLOYEE_ID ,D.DEPARTMENT_ID , L.LOCATION_ID , L.STATE_PROVINCE
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    JOIN LOCATIONS L
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    WHERE D.LOCATION_ID = 1700;
	
-- 4. WAQD count of employees who works in US

    SELECT C.COUNTRY_NAME, COUNT(E.EMPLOYEE_ID) AS EMP_COUNT
    FROM COUNTRIES C JOIN LOCATIONS L
    ON (C.COUNTRY_ID = L.COUNTRY_ID )
    
    JOIN DEPARTMENTS D
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    JOIN EMPLOYEES E
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    WHERE C.COUNTRY_NAME LIKE 'U%'
    
    GROUP BY C.COUNTRY_NAME;
    
-- 5.WAQD minimum and maximum salary per job profession  

    SELECT J.JOB_TITLE , MAX(E.SALARY) AS MAX_SAL ,MIN(E.SALARY) AS MIN_SAL
    FROM EMPLOYEES E JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID)
    GROUP BY J.JOB_TITLE
    ORDER BY J.JOB_TITLE;
	
-- 6.WAQD all locations along with their department name and id and postal code

    SELECT  L.LOCATION_ID, D.DEPARTMENT_NAME , D.DEPARTMENT_ID, L.POSTAL_CODE,
            C.REGION_ID
    FROM DEPARTMENTS D RIGHT OUTER JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    
    JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID);
    
-- 7.WAQD count of locations per region
    SELECT R.REGION_ID,R.REGION_NAME ,COUNT(L.LOCATION_ID) AS LOCATION_CNT
    FROM REGIONS R LEFT OUTER JOIN COUNTRIES C
    ON (R.REGION_ID = C.REGION_ID)
    
    LEFT OUTER JOIN LOCATIONS L
    ON (L.COUNTRY_ID = C.COUNTRY_ID)

    GROUP BY R.REGION_ID,R.REGION_NAME;
    
-- 8.WAQD count of employees per cities and region

    SELECT  R.REGION_ID,R.REGION_NAME ,L.CITY ,COUNT(EMPLOYEE_ID) AS EMP_CNT
    FROM REGIONS R LEFT OUTER JOIN COUNTRIES C
    ON (R.REGION_ID = C.REGION_ID)
    
    LEFT OUTER JOIN LOCATIONS L
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    LEFT OUTER JOIN DEPARTMENTS D
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    LEFT OUTER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID =E.DEPARTMENT_ID)

    GROUP BY R.REGION_ID,R.REGION_NAME, L.CITY;
	
-- 9.WAQD count of employees per cities and region where count of departments is less than 5

    SELECT  R.REGION_ID,R.REGION_NAME ,COUNT(L.CITY) AS CITY_CNT , COUNT(DEPARTMENT_ID) AS DEPT_CNT
    FROM REGIONS R LEFT OUTER JOIN COUNTRIES C
    ON (R.REGION_ID = C.REGION_ID)
    
    LEFT OUTER JOIN LOCATIONS L
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    LEFT OUTER JOIN DEPARTMENTS D
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    GROUP BY R.REGION_ID,R.REGION_NAME
    HAVING COUNT(DEPARTMENT_ID )< 5;
    
-- 10. WAQD details of employees whose countryname starts with letter 'Z'

    SELECT  E.EMPLOYEE_ID ,CONCAT(CONCAT(E.FIRST_NAME,' '),E.LAST_NAME) AS FULLNAME,
            C.COUNTRY_NAME
    FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    FULL OUTER JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    
    FULL OUTER JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    WHERE TRIM(C.COUNTRY_NAME) LIKE '%Z%';
	
-- 11. How many employees works as it programmer in CANADA

    SELECT C.COUNTRY_NAME , COUNT(E.EMPLOYEE_ID) AS EMP_CNT
    FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    
    JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    WHERE C.COUNTRY_ID = 'US'
    AND E.JOB_ID LIKE 'IT%'
    
    GROUP BY C.COUNTRY_NAME;
	
-- 12.WAQD departments along with the employees where employee and departments have same managers

    SELECT E.LAST_NAME AS EMPLOYEE,
           E.MANAGER_ID,
           E.JOB_ID AS EMPLOYEE_JOB,
           D.MANAGER_ID,
           D.DEPARTMENT_ID
    FROM EMPLOYEES E
    JOIN DEPARTMENTS D
    ON E.MANAGER_ID = D.MANAGER_ID;

-- 13.WAQD emp_name, dept name, and region id

    SELECT  CONCAT(CONCAT(E.FIRST_NAME, ' '),E.LAST_NAME) AS FULLNAME,
            D.DEPARTMENT_NAME,
            C.REGION_ID
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    JOIN LOCATIONS L
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    RIGHT OUTER JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    WHERE L.CITY = 'Seattle';
    
-- 14.WAQD emp_name, dept name, and region id of those employees whose department id is 20,230 or 270

    SELECT  CONCAT(CONCAT(E.FIRST_NAME, ' '),E.LAST_NAME) AS FULLNAME,
            D.DEPARTMENT_ID , D.DEPARTMENT_NAME,
            C.REGION_ID
    FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    
    JOIN LOCATIONS L
    ON (L.LOCATION_ID = D.LOCATION_ID)
    
    RIGHT OUTER JOIN COUNTRIES C
    ON (L.COUNTRY_ID = C.COUNTRY_ID)
    
    WHERE D.DEPARTMENT_ID IN (20,230,270);
	
-- 15 .WAQD empid, emp name, hire date and dept name and address for those employees who joined after 2006
    SELECT  E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE,
            D.DEPARTMENT_NAME , L.STREET_ADDRESS
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    
    WHERE TO_CHAR(HIRE_DATE ,'YYYY') >'2006';
	
-- 16.Display empid, emp_name, salary , minimum and maximum salary range whose job profession is it prog

    SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, G.MIN_SALARY, G.MAX_SALARY
    FROM EMPLOYEES E JOIN SALARY_GRADE G
    ON (E.SALARY >= MIN_SALARY
	AND E.SALARY <= MAX_SALARY)
    WHERE E.JOB_ID LIKE 'IT%';
    
--17.employee ID, first name, job title, and region name for all employees whose job title contains the word “Manager” 
--and who work in regions whose name starts with the letter “A”.
	SELECT e.employee_id, e.first_name, j.job_title, r.region_name
	FROM employees e
	JOIN jobs j ON e.job_id = j.job_id
	JOIN departments d ON e.department_id = d.department_id
	JOIN locations l ON d.location_id = l.location_id
	JOIN countries c ON l.country_id = c.country_id
	JOIN regions r ON c.region_id = r.region_id
	WHERE j.job_title LIKE '%Manager%'
	AND r.region_name like 'A%';

--18.DISPLAY EMPLOYEES WHO ARE WORKING AT DEPARTMENTS 50 AT LOCATION 1500
	SELECT E.EMPLOYEE_ID,E.FIRST_NAME,D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.LOCATION_ID
	FROM EMPLOYEES E JOIN DEPARTMENTS D
	ON( E.DEPARTMENT_ID=D.DEPARTMENT_ID)

	JOIN LOCATIONS L
	ON(L.LOCATION_ID=D.LOCATION_ID)
	WHERE D.DEPARTMENT_ID = 50
	AND L.LOCATION_ID=1500;


--19.employees who belong to the ‘BEST SALARY’ grade along with their salary and grade name.
SELECT e.employee_id,
       e.first_name,
       e.salary,
       s.grade
FROM employees e
JOIN salary_grade s
ON e.salary > s.min_salary
AND e.salary < s.max_salary
WHERE s.grade = 'BEST SALARY';
    
  
-- 20.employee ID, employee name, salary, and salary grade for each employee based on the salary range
--defined in the salary grade table.
SELECT  E.EMPLOYEE_ID,E.FIRST_NAME,E.SALARY,S.GRADE
FROM EMPLOYEES E JOIN SALARY_GRADE S
ON E.SALARY >= S.MIN_SALARY
AND E.SALARY <= S.MAX_SALARY;

    
   