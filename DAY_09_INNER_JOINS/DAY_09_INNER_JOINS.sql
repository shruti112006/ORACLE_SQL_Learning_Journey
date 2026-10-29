
-- DATE : 12-01-2026
-- TOPICS : INNER JOIN

-- 1. WAQD details of employees along with their department name

    SELECT *
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- 2. WAQD detail of employees and their department name whose employee id is in between 111 and 205
	SELECT 	E.EMPLOYEE_ID, (CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME)) AS FULLNAME,
			D.DEPARTMENT_ID, D.DEPARTMENT_NAME
	FROM EMPLOYEES E JOIN DEPARTMENTS D
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE E.EMPLOYEE_ID BETWEEN 111 AND 205;
	
-- 3. WAQD detail of employees and their department name whose and display count of employees per department
	SELECT  D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS EMP_CNT 
	FROM EMPLOYEES E JOIN DEPARTMENTS D
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	GROUP BY D.DEPARTMENT_NAME;
	
-- 4. WAQD total count of employees who work in 'Sales' department and having salary greater than 5000
	SELECT D.DEPARTMENT_NAME , COUNT(*) AS EMP_CNT
	FROM EMPLOYEES E JOIN DEPARTMENTS D
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE D.DEPARTMENT_NAME = 'Sales'
    AND SALARY > 5000
	GROUP BY D.DEPARTMENT_NAME;

-- 5. WAQD average salary of all the employees on the basis of departments .
--  	Display it along with department name sort in desending order of average salary

	SELECT D.DEPARTMENT_NAME , ROUND(AVG(SALARY),3) AS AVG_SALARY
	FROM  DEPARTMENTS D JOIN EMPLOYEES E 
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	GROUP BY D.DEPARTMENT_NAME
    ORDER BY AVG_SALARY DESC;
	
-- 6. WAQD details of employees where departments name starts with 'p' or 'e' and having location 1700

    SELECT *
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE (D.DEPARTMENT_NAME LIKE 'P%' 
    OR D.DEPARTMENT_NAME LIKE 'E%')
    AND D.LOCATION_ID = 1700;
	
-- 7. WAQD details count and minimum salary of employees of employees where departments name starts with 'p' or 'e' 
--      and having location 1700

    SELECT D.DEPARTMENT_NAME , E.MANAGER_ID , COUNT(*) AS CNT , MIN(SALARY) AS MIN_SALARY
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE (D.DEPARTMENT_NAME LIKE 'P%' 
    OR D.DEPARTMENT_NAME LIKE 'E%')
    AND D.LOCATION_ID = 1700
    GROUP BY D.DEPARTMENT_NAME , E.MANAGER_ID;
	
-- 8. WAQD details of employees along with their department names.
--     For department id's marketing , shipping or sales increase the salary of employees by 10%

    SELECT E.EMPLOYEE_ID, CONCAT(CONCAT(E.FIRST_NAME, ' '),E.LAST_NAME) AS FULLNAME,
            (E.SALARY * 1.1) AS INCREASED_SAL, D.DEPARTMENT_NAME
    FROM DEPARTMENTS D JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    WHERE D.DEPARTMENT_NAME IN ('Marketing','Shipping', 'Sales')
    ORDER BY D.DEPARTMENT_ID;

-- 9. WAQD count of employees along with their department names.
--     For department id's marketing , shipping or sales 

    SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME , COUNT(EMPLOYEE_ID) AS EMP_COUNT 
    FROM DEPARTMENTS D JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    WHERE D.DEPARTMENT_NAME IN ('Marketing','Shipping', 'Sales')
    GROUP BY D.DEPARTMENT_ID,D.DEPARTMENT_NAME
    ORDER BY D.DEPARTMENT_ID;
   
-- 10.WAQD department name wise count of job professions 

    SELECT D.DEPARTMENT_NAME,E.JOB_ID, COUNT(JOB_ID) AS JOB_CNT
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D. DEPARTMENT_ID)
    GROUP BY D.DEPARTMENT_NAME, E.JOB_ID
    ORDER BY DEPARTMENT_NAME DESC;

-- 11. WAQD details of employees such as empid, fullname, email, phonenumber, department id, department location
--     for those who have phone_number starting with '515', or email contain letter 'a'

    SELECT  E.EMPLOYEE_ID, CONCAT(CONCAT(E.FIRST_NAME ,' '), E.LAST_NAME) AS FULLNAME,
            E.EMAIL, E.PHONE_NUMBER, D.DEPARTMENT_ID, D.LOCATION_ID
    FROM EMPLOYEES E INNER  JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE PHONE_NUMBER LIKE '515%'
    OR EMAIL LIKE '%a%';
   
-- 12. WAQD details of employees along with their department name who hired in year 2006

    SELECT E.EMPLOYEE_ID, E.JOB_ID, E. HIRE_DATE , E.SALARY, D.DEPARTMENT_NAME
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE TO_CHAR(HIRE_DATE , 'YYYY') = '2006';

-- 13. WAQD count and maximum salary details of employees along with their department name who hired in year 2006

    SELECT D.DEPARTMENT_NAME , COUNT(*) AS CNT , MAX(SALARY) AS MAX_SAL 
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE TO_CHAR(HIRE_DATE , 'YYYY') = '2006'
    GROUP BY D.DEPARTMENT_NAME;

-- 14. DISPLAY DEPARTMENT NAME AND TOTAL SALARY FOR ALL DEPARTMENTS
	SELECT D.DEPARTMENT_NAME ,
		   SUM(SALARY) AS TOTAL_SAL
	FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	GROUP BY DEPARTMENT_NAME;

-- 15. Show job description  wise count of employees who were hired before 2006, and location is 1700
--- having minimum salary is between 2500 and 3000, sort by job profession

    SELECT JOB_ID, COUNT(*) AS EMP_COUNT
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
    AND D.LOCATION_ID = 1700
    GROUP BY JOB_ID
    HAVING MIN(SALARY) BETWEEN 2500 AND 3000
    ORDER BY JOB_ID;
	
-- 16. Show location wise count of employees who were hired before 2006,
--- having maximum salary is between 5000 and 15000, sort by location

    SELECT D.LOCATION_ID, COUNT(*) AS EMP_COUNT
    FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE TO_CHAR(HIRE_DATE, 'YYYY') < '2006'
    GROUP BY D.LOCATION_ID
    HAVING MAX(SALARY) BETWEEN 5000 AND 15000
    ORDER BY D.LOCATION_ID;
	
-- 17. Show count of employees along department name who had hired in jul 2003, salary greater than 5000

	SELECT E.EMPLOYEE_ID, TO_CHAR(E.HIRE_DATE , 'DAY-MON-YYYY') AS HIRE_DATE , D.DEPARTMENT_NAME
    FROM DEPARTMENTS D JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    WHERE SUBSTR(E.HIRE_DATE,7) = 03
    AND E.SALARY > 5000 ;
	
-- 18. WAQD details of departments along with their department address whose is not 'Seattle'

    SELECT * 
    FROM DEPARTMENTS D INNER JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    WHERE CITY <> 'Seattle';

-- 19. WAQD details of departments along with their department address whose is not 'Seattle'
--     and country is not DE 
    SELECT D.DEPARTMENT_NAME , D.LOCATION_ID ,L.STREET_ADDRESS, L.COUNTRY_ID
    FROM DEPARTMENTS D INNER JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    WHERE CITY <> 'Seattle'
    AND COUNTRY_ID != 'DE';
	
-- 20. WAQD count of departments per city
    SELECT L.CITY , COUNT(*) AS CNT
    FROM DEPARTMENTS D INNER JOIN LOCATIONS L
    ON (D.LOCATION_ID = L.LOCATION_ID)
    GROUP BY L.CITY;


