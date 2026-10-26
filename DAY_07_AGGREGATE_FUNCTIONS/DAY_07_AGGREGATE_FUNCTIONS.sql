
--DATE 08-01-2026
-- TOPICS : AGGREGATE FUNCTIONS AND GROUP BY CLAUSE

-- 1. WAQD maximum salary in each department without displaying the null department
    SELECT DEPARTMENT_ID, MAX(SALARY) AS TOP_SAL
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
    GROUP BY DEPARTMENT_ID;
	
-- 2. WAQD minimum salary in department sort it in descending order of lowest salary
    SELECT DEPARTMENT_ID, MIN(SALARY) AS LOWEST_SAL
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    ORDER BY LOWEST_SAL DESC;

-- 3. WAQD average salary of employees in department 50 and 100 
    SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2) AS AVG_SAL
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN (50,100)
    GROUP BY DEPARTMENT_ID;
	
-- 4. WAQD max salary of employee who hired in 2006 in department 50 
   
    SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SAL
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 50
    AND TO_CHAR (HIRE_DATE,'YYYY') = '2006'
    GROUP BY DEPARTMENT_ID;
	
-- 5. WAQD number of employees joined in each year 
    
    SELECT TO_CHAR(HIRE_DATE ,'YYYY') AS JOINED_YEAR,
            COUNT(EMPLOYEE_ID) AS CNT
    FROM EMPLOYEES
    GROUP BY TO_CHAR(HIRE_DATE ,'YYYY');

-- 6. WAQD sum of annual salary of employees of having IT prog as a job profession 
    
    SELECT SUM(SALARY *12) AS TOTAL_SAL
    FROM EMPLOYEES
    WHERE JOB_ID LIKE 'IT%';

-- 7. WAQD  max salary of employee as per job profession
    
    SELECT JOB_ID, MAX(SALARY) AS HIGHEST_SAL_JOB_PROFESSION
    FROM EMPLOYEES
    GROUP BY JOB_ID;
	
-- 8.WAQD number of employees reporting to each manager 
	SELECT MANAGER_ID,COUNT(FIRST_NAME)AS TOTAL_EMP
	FROM EMPLOYEES
	GROUP BY MANAGER_ID;

-- 9.WAQD the highest salary of employee who works in finance
    
    SELECT MAX(SALARY) AS HIGEST_SAL
    FROM EMPLOYEES
    WHERE SUBSTR(JOB_ID,1,2) = 'FI';

-- 10. Display the minimum Job experience and the number of employees for each job
    SELECT JOB_ID, COUNT(EMPLOYEE_ID) AS COUNT, ROUND(MIN(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)) AS EXPERIENCE
    FROM EMPLOYEES
    GROUP BY JOB_ID;
	
-- 11. Calculate the department-wise commission given to employees
    SELECT DEPARTMENT_ID, SUM(COMMISSION_PCT) AS COMMISSION
    FROM EMPLOYEES
    WHERE COMMISSION_PCT IS NOT NULL
    GROUP BY DEPARTMENT_ID; 

-- 12. WAQD minimum annual salary of employees per department

    SELECT DEPARTMENT_ID, MIN(SALARY *12) AS LOWEST_ANNUAL_SAL
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID; 

-- 13. WAQD highest salary and lowest salary in the table
        SELECT MAX(SALARY) AS HIGHEST_SAL,
               MIN(SALARY) AS LOWEST_SAL
        FROM EMPLOYEES;

-- 14. WAQD average salary of employees per job profession

    SELECT JOB_ID , ROUND(AVG(SALARY)) AS AVG_PER_JOB
    FROM EMPLOYEES
    GROUP BY JOB_ID;

-- 15. WAQD average commission percentage of SALES department

    SELECT JOB_ID , ROUND(AVG(COMMISSION_PCT)) AS AVG_COMMISSION
    FROM EMPLOYEES
    WHERE JOB_ID LIKE 'SA%'
    GROUP BY JOB_ID;
        
-- 16. WAQD maximum salary per manager team
    SELECT MANAGER_ID , MAX(SALARY) AS MAX_SAL
    FROM EMPLOYEES
    GROUP BY MANAGER_ID
    ORDER BY MANAGER_ID DESC;
   
-- 17. WAQD latest hired date per department
    SELECT DEPARTMENT_ID, MAX(HIRE_DATE) AS LATEST_HIRE_DATE
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
    ORDER BY DEPARTMENT_ID;
	
-- 18. WAQD which gives the count of employees joined after 15-10-2003 and before 31-09-2008
    SELECT  COUNT(*)
    FROM EMPLOYEES 
    WHERE HIRE_DATE >= '15-10-03' 
    AND HIRE_DATE <= ' 30-09-08' ;

-- 19. details of emp had hired in jul 2007, salary greater than 5000

	SELECT COUNT(*) AS TOTAL_EMP_CNT
    FROM EMPLOYEES
    WHERE SUBSTR(HIRE_DATE,7) = 07
    AND SALARY > 5000 ;
	
-- 20. Total number of departments  in department table
	SELECT COUNT(*) AS TOTAL_DEPT_CNT
    FROM DEPARTMENTS;

-- 21. WAQD total employees count per job profession

    SELECT JOB_ID, COUNT(EMPLOYEE_ID)AS EMP_DETAILS
    FROM EMPLOYEES
    GROUP BY JOB_ID;
	
-- 22. Display the Job experience 
    SELECT HIRE_DATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS EXPERIENCE
    FROM EMPLOYEES
    GROUP BY HIRE_DATE;
	
-- 23. DISPLAY MANAGER ID AND TOTAL SALARY, AND REPLACE NULL MANAGER WITH NO MANAGER’

	SELECT NVL(TO_CHAR(MANAGER_ID),'NO MANAGER') AS MANAGER, 
		   SUM(SALARY) AS TOTAL_SAL
	FROM EMPLOYEES
	GROUP BY MANAGER_ID;

-- 24. WAQD count of employees whose firstname starts with same letter

	SELECT SUBSTR(FIRST_NAME,1,1) AS ALPHA_LETTERS, COUNT(*) AS CNT
	FROM EMPLOYEES
	GROUP BY SUBSTR(FIRST_NAME,1,1)
    ORDER BY ALPHA_LETTERS ;

-- 25. DISPLAY DEPARTMENT ID AND TOTAL SALARY, AND REPLACE NULL DEPARTMENT WITH NO DEPARTMENT’
	SELECT NVL(TO_CHAR(DEPARTMENT_ID),'NO DEPARTMENT') AS DEPARTMENT, 
		   SUM(SALARY) AS TOTAL_SAL
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID;
	
	
	
	
	
	
	
	
--WAQD payroll expense of employees whose experience is greater than 20
--      PAYROLL refers to total amt paid to all employees together 
    
    
    
    
    
    