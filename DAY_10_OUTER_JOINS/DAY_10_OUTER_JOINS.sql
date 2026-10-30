
-- DATE : 14-01-2026
-- TOPICS : OUTER JOINS

-- 1. WAQD details of employees with their manager name

	SELECT 	M.EMPLOYEE_ID , CONCAT(CONCAT(M.FIRST_NAME , ' '), M.LAST_NAME) AS EMP_FULLNAME,
            CONCAT(CONCAT(E.FIRST_NAME , ' '), E.LAST_NAME) AS MGR_FULLNAME
	FROM EMPLOYEES E JOIN EMPLOYEES M
	ON (E.EMPLOYEE_ID = M.MANAGER_ID);
	
-- 2. WAQD deatils of all employees with their department name whose salary is greater than 10000
	SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME , E.SALARY
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE E.SALARY > 10000;

-- 3. WAQD details of all employees with their department name who work as 'IT helpdesk', 'Manufacturing', 'Noc' ,'Payroll'
	SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME , E.SALARY
	FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE D.DEPARTMENT_NAME IN ('IT Helpdesk', 'Manufacturing', 'NOC' ,'Payroll');
    
-- 4. WAQD all data of employees with their department name 
	SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME , D.DEPARTMENT_ID,E.SALARY
	FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- 5. WAQD count of employees with their department name 
	SELECT D.DEPARTMENT_NAME, COUNT(EMPLOYEE_ID) AS EMP_CNT
	FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    GROUP BY D.DEPARTMENT_NAME;

-- 6. WAQD details of employees whose maximum salary greater than 20000  
	SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS EMP_CNT, MAX(E.SALARY) AS MAX_SAL
	FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    GROUP BY D.DEPARTMENT_NAME
    HAVING MAX(E.SALARY) > 20000;

-- 7. WAQD count of employees who hired in last 6 months from 21-02-2007 along with their location of department
--    and department name. Sort it in descending order of count

    SELECT DEPARTMENT_NAME ,LOCATION_ID , COUNT(EMPLOYEE_ID) AS EMP_COUNT
    FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE HIRE_DATE > (ADD_MONTHS('21-02-2007',-6))
    GROUP BY DEPARTMENT_NAME ,LOCATION_ID
    ORDER BY EMP_COUNT;
    
-- 8. WAQD details of employees  along with their  job title

    SELECT E.EMPLOYEE_ID, J.JOB_ID
    FROM EMPLOYEES E LEFT OUTER JOIN JOBS J
    ON (E.JOB_ID =J.JOB_ID);
	
-- 9. WAQD details of employees along with their job title  whose  count of working 
--     employees is greater than  10

    SELECT  J.JOB_ID, COUNT(EMPLOYEE_ID) AS EMP
    FROM EMPLOYEES E LEFT OUTER JOIN JOBS J
    ON (E.JOB_ID =J.JOB_ID)
    GROUP BY J.JOB_ID
    HAVING COUNT (*) > 10;
	
-- 10. WAQD details of those employees  whose  job  title is  starting  with   S 
    SELECT E.EMPLOYEE_ID, J.JOB_ID
    FROM EMPLOYEES E RIGHT OUTER JOIN JOBS J
    ON (E.JOB_ID =J.JOB_ID)
    WHERE JOB_TITLE LIKE 'S%';
	
-- 11. WAQD details of employees along with department names whose location is 1700

    SELECT E.EMPLOYEE_ID, E.JOB_ID,D.LOCATION_ID,D.DEPARTMENT_ID,D.DEPARTMENT_NAME
    FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE LOCATION_ID = 1700;
   
-- 12. WAQD details of employees who hired in year 2002,2004,2006 along with their departments

    SELECT E.EMPLOYEE_ID, E.JOB_ID,E.HIRE_DATE,D.DEPARTMENT_ID,D.DEPARTMENT_NAME,D.LOCATION_ID
    FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE TO_CHAR(HIRE_DATE , 'YYYY') IN ('2002','2004','2006');
	

-- 13. WAQD details of employees along with their departments whose departmentname starts with letter 'C'

    SELECT E.EMPLOYEE_ID, E.JOB_ID,E.HIRE_DATE,D.DEPARTMENT_ID,D.DEPARTMENT_NAME,D.LOCATION_ID
    FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE D.DEPARTMENT_NAME LIKE 'C%';
       
-- 14. WAQD departmentname where employees didn't assigned yet

    SELECT  D.DEPARTMENT_NAME,
            D.DEPARTMENT_ID
    FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
    WHERE E.DEPARTMENT_ID IS NULL;

-- 15. List departments sorted by highest salary.

    SELECT D.DEPARTMENT_NAME,
           SUM(E.SALARY) AS TOTAL_SALARY
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    GROUP BY D.DEPARTMENT_NAME
    ORDER BY TOTAL_SALARY DESC;
	
-- 16. Show departments without employees and employees who has no departments
    
    SELECT E.EMPLOYEE_ID,
           E.LAST_NAME,
           D.DEPARTMENT_NAME
    FROM  DEPARTMENTS D 
    FULL OUTER JOIN EMPLOYEES E
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE E.DEPARTMENT_ID IS NULL
       OR D.DEPARTMENT_ID IS NULL
	   
-- 17. WAQD total count of employees having salary greater than 5000 sort it in desecnding order of count.
--  All the employee with assigned or unassigned departments should be displayed
	
    SELECT D.DEPARTMENT_NAME , COUNT(EMPLOYEE_ID) AS EMP_CNT
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    WHERE SALARY > 5000
	GROUP BY D.DEPARTMENT_NAME
    ORDER BY EMP_CNT DESC;

-- 18. WAQD details of job id for those employees who were hired before 2005

    SELECT  E.EMPLOYEE_ID , E.HIRE_DATE,
            J.JOB_ID , J.JOB_TITLE
    FROM EMPLOYEES E 
    INNER JOIN JOBS J
    ON (E.JOB_ID = J.JOB_ID)
    WHERE TO_CHAR(E.HIRE_DATE , 'YYYY') < '2005';

-- 19. WAQD detail of employees and their department name whose employee id is in between 150 and 180
--      Sort by fullname in ascending order.

	SELECT 	E.EMPLOYEE_ID, (CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME)) AS FULLNAME,
			D.DEPARTMENT_ID, D.DEPARTMENT_NAME
	FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
	ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
	WHERE E.EMPLOYEE_ID BETWEEN 150 AND 180
    ORDER BY FULLNAME ;

-- 20. WAQD details of employees along with their job details whose salary is greater than 9500
--      and less than 15000

    SELECT J.JOB_TITLE ,E.EMPLOYEE_ID , E.HIRE_DATE , E.SALARY
    FROM JOBS J 
    JOIN EMPLOYEES E
    ON (J.JOB_ID = E.JOB_ID)
    WHERE E.SALARY  > 9500
    AND E.SALARY < 15000;