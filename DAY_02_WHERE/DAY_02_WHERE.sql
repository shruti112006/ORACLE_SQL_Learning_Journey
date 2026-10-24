
-- DATE 01-01-2026

-- PURPOSE : WHERE Clause is used to filter the records

-- TOPIC : WHERE CLAUSE WITH LOGICAL (AND, NOT, OR)
--		   AND COMPARISION OPERATORS ( = , <>, <, > , <= ,>=, BETWEEN AND, IN)

1. --WAQD details of employees whose empid is 113
	SELECT *
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = 113;
	
2. --WAQD details of departments whose department location is 1700
	SELECT *
	FROM DEPARTMENTS
	WHERE LOCATION_ID = 1700;

3. -- WAQD details of employees as fullname , empid and dpartment id for those whose firstname is james
	SELECT (FIRST_NAME ||' '||LAST_NAME)AS FULLNAME, EMPLOYEE_ID , DEPARTMENT_ID
	FROM EMPLOYEES
	WHERE FIRST_NAME = 'James';

4. --WAQD details of emp who joined after 11 march 2006 and having salary greater than or equal to 8000
	SELECT *
	FROM EMPLOYEES
	WHERE HIRE_DATE > '11-03-06' 
	AND SALARY >= 8000;
	
5. -- WAQD details of employees like empid fullname, dept_id, email whose managerid is 202
	SELECT EMPLOYEE_ID, (FIRST_NAME || ' '||LAST_NAME) AS FULLNAME, DEPARTMENT_ID AS DEPT_ID, EMAIL
	FROM EMPLOYEES
	WHERE MANAGER_ID = 120;
	
6. -- WAQD details of employees communication methods who work in department 100	
    SELECT EMPLOYEE_ID , (' '||EMAIL || '  AND  ' || PHONE_NUMBER)AS COMMUNICATION_METHODS
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = 100;
	
7. --WAQD details of emp who is reporting to manager 100
	SELECT *
	FROM EMPLOYEES
	WHERE MANAGER_ID = 100;
	
8.--WAQD details of emp where job description is FI or AC account
    SELECT EMPLOYEE_ID,MANAGER_ID, HIRE_DATE, SALARY ,JOB_ID
	FROM EMPLOYEES
	WHERE JOB_ID = 'FI_ACCOUNT'
    OR JOB_ID = 'AC_ACCOUNT';
	
9. -- WAQD details of manager whose department name is Administration 
    SELECT (DEPARTMENT_NAME ||' BELONG TO MANAGER '||MANAGER_ID) AS MANAGER_DETAILS 
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME = 'Administration';

10. --WAQD details of emp whose job description is clerk and joined before 5 sep 2009
	SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID, HIRE_DATE 
	FROM EMPLOYEES
	WHERE JOB_ID ='PU_CLERK' OR JOB_ID ='ST_CLERK' 
	AND HIRE_DATE < '05-09-09';
	
11. -- WAQD details of emp whose commission pct is less than .6 and greater than .2
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER,COMMISSION_PCT
	FROM EMPLOYEES
	WHERE COMMISSION_PCT <.6 AND COMMISSION_PCT > .2;
	
	
12.	-- WAQD salary of emp who works as an IT programer
	SELECT EMPLOYEE_ID, SALARY, JOB_ID
	FROM EMPLOYEES
	WHERE JOB_ID ='IT_PROG';
	
13. -- WAQD salary of emp named john seo
	SELECT (FIRST_NAME ||' '|| LAST_NAME) AS FULLNAME, SALARY
	FROM EMPLOYEES
	WHERE FIRST_NAME = 'John' 
	AND LAST_NAME = 'Seo';

14.	-- WAQD	manager details of employee whose empid is greater than or equal to 101 and less than or equal to 200
	SELECT MANAGER_ID, EMPLOYEE_ID
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID BETWEEN 101 AND 200 ;
	
15. -- WAQD annual commission pct of those employess whose commission pct is less than 0.3
	SELECT EMPLOYEE_ID, PHONE_NUMBER, (COMMISSION_PCT * 12) AS ANNUAL_COMMISSION
	FROM EMPLOYEES
	WHERE COMMISSION_PCT < 0.3;
	
16. -- WAQD details of emp whose job desc is MK Man
	SELECT *
    FROM EMPLOYEES
    WHERE JOB_ID ='MK_MAN';
	
17. --WAQD EMPLOYEE DETAILS in the format 101 works as IT Prog whose salary >10000
	SELECT (EMPLOYEE_ID ||' WORKS AS '|| JOB_ID ) AS EMPLOYEE_DETAILS
	FROM EMPLOYEES
	WHERE SALARY > 10000;
	
18. --WAQD details of emp in the format fullname  employee id and annual sal whose employee id between 115 and 200
	SELECT (FIRST_NAME || ' ' ||LAST_NAME) AS FULLNAME, EMPLOYEE_ID,
			(SALARY * 12)AS ANNUAL_SAL
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID BETWEEN 115 AND 200;
	
19. --WAQD 110 joined in department 60 on 05-09-04 whose departid is 60
	SELECT (EMPLOYEE_ID ||' JOINED IN DEPARTMENT '||DEPARTMENT_ID||' ON '||HIRE_DATE) AS JOINING_DETAILS
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = 60;

	
20. --WAQD increment in salary by 5% for those emp who work as a SA REP
    SELECT (FIRST_NAME ||' '||LAST_NAME)AS FULLNAME,JOB_ID,(SALARY*1.05) AS INCRE_SAL
	FROM EMPLOYEES
	WHERE JOB_ID = 'SA_REP';
	
21. --WAQD salary of emp after 5 years whose joining is less than 11 oct 2006 and greater than 11 march 2001
	SELECT  ('SALARY OF '|| EMPLOYEE_ID ||' AFTER 5 YEARS IS '|| SALARY * 60) AS BANK_BALANCE
	FROM EMPLOYEES
	WHERE HIRE_DATE < '11-10-06' AND HIRE_DATE >'11-03-01' ;
	
22. --WAQD DEPARTMENT DETAILS AS 'DEPART ID, NAME LOCATION IS 1700' whose location is 1800 or 2500
	SELECT DEPARTMENT_ID , (DEPARTMENT_NAME||' LOCATION IS '|| LOCATION_ID) AS LOC_DETAILS
	FROM DEPARTMENTS
	WHERE LOCATION_ID = 2500 OR LOCATION_ID = 1800;
	
23. --WAQD details of department whose location is other than 1700
	SELECT *
	FROM DEPARTMENTS
	WHERE LOCATION_ID <> 1700;
	
24. --WAQD fullname and perday of emp who works as SH Clerk
	SELECT	(FIRST_NAME ||' '|| LAST_NAME) AS FULLNAME, (SALARY /30) AS PERDAY_SAL
	FROM EMPLOYEES
	WHERE JOB_ID = 'SH_CLERK';
	
25. --WAQD reduce salary OF EMP by 10% whose manager is 123 and display it  
	SELECT EMPLOYEE_ID,SALARY, MANAGER_ID, (SALARY - (SALARY*0.1)) AS DECREASED, (SALARY - (SALARY *0.9))AS LOSS 
	FROM EMPLOYEES
	WHERE MANAGER_ID = 123;



	