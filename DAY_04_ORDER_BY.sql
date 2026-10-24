
-- DATE  03-01-2026

-- TOPIC : ORDER BY CLAUSE , IS NULL , IS NOT NULL

-- PURPOSE : 1. Order by clause used to sort the records on the basis of the columns specified in the query.            
--           2. By default it sort the record in ascending order but by using DESC keyword we can sort records in desecnding order.
--           3. NULL -> NULL is an unknown datatype. It can't be compare with other values directly because NULL means nothing, empty.
--              So, IS NULL AND IS NOT NULL keywords are used to handle NULL records


-- 1.WAQD details of employees in format Employeeid, Fullname, Managerid sort by managerid
	SELECT EMPLOYEE_ID AS Employeeid, (FIRST_NAME ||' '||LAST_NAME) AS Fullname, MANAGER_ID AS Managerid
	FROM EMPLOYEES
	ORDER BY MANAGER_ID;
	
-- 2.WAQD details of employees whose salary is greater than 4000 having J as firstname then sort the data on salary in descending order
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
	FROM EMPLOYEES
	WHERE SALARY > 4000
	AND FIRST_NAME LIKE 'J%'
	ORDER BY SALARY DESC;
	
-- 3.WAQD details of employees in format 'Neena kochhar working as IT_prog whose commission pct is NULL' sort on empid order 
	SELECT (FIRST_NAME || ' '|| LAST_NAME|| ' WORKING AS '|| JOB_ID ||' WHOSE COMMISSION PERCENTAGE IS NULL' ) AS DETAILS
	FROM EMPLOYEES
	WHERE COMMISSION_PCT IS NULL
	ORDER BY EMPLOYEE_ID;
	
-- 4.WAQD details of employees whose job is either account or clerk having salary between the range 3700 TO 9000 
   --   sort on the salary in desc order 
    SELECT EMPLOYEE_ID , JOB_ID , SALARY
    FROM EMPLOYEES
    WHERE ( JOB_ID LIKE '%ACCOUNT' 
    OR JOB_ID LIKE '%CLERK')
    AND SALARY BETWEEN 3700 AND 9000;
    
 -- 5.WAQD  details of employees whose have i at 3rd palce in firstname or e at the end of lastname
   --      display in sorted order on the basis of firstname, lastname in desc order 
    SELECT EMPLOYEE_ID , FIRST_NAME ,LAST_NAME
    FROM EMPLOYEES
    WHERE FIRST_NAME  LIKE '__i%' OR LAST_NAME LIKE '%e'
    ORDER BY FIRST_NAME, LAST_NAME ;
	
-- 6.WAQD details of emp join in march 2006 having salary less than 10000 or commission pct is .2 sort it in desc order of salary 
    SELECT EMPLOYEE_ID, SALARY, COMMISSION_PCT , HIRE_DATE
	FROM EMPLOYEES
	WHERE HIRE_DATE LIKE '___03%06'
	AND SALARY < 10000
	OR COMMISSION_PCT = 0.2
	ORDER BY SALARY;
	
--  7.WAQD details of employees like employee_id, job descrip, salary, annunal salary
   --  whose job descri contain man and having annual salary less than 5000 sort the data on job descr and salary
    SELECT EMPLOYEE_ID, JOB_ID, SALARY ,(SALARY *12) AS ANNUAL_SAL
    FROM EMPLOYEES
    WHERE JOB_ID LIKE '%MAN%' 
    AND (SALARY * 12) > 5000
    ORDER BY JOB_ID, ANNUAL_SAL;
    
-- 8. WAQD details of employees in format '101 reporting to manager 121 in department 50'
	--  sort the data by department id, managerid in desc
    SELECT (EMPLOYEE_ID ||' REPORTING TO MANAGER '|| MANAGER_ID ||' IN DEPARTMENT '|| DEPARTMENT_ID) AS DETAILS
    FROM EMPLOYEES
    ORDER BY DEPARTMENT_ID, MANAGER_ID DESC;
   
-- 9.WAQD details of emp whose job description is clerk and joined before 5 sep 2009 sort on firstname,lastnmae,hiredate
	SELECT EMPLOYEE_ID, FIRST_NAME , LAST_NAME, JOB_ID, HIRE_DATE 
	FROM EMPLOYEES
	WHERE JOB_ID IN ('PU_CLERK','ST_CLERK') 
	AND HIRE_DATE < '05-09-09'
	ORDER BY FIRST_NAME, LAST_NAME, HIRE_DATE ;
	
-- 10.WAQD reduce salary OF EMP by 10% whose manager is 123 OR email starts with letter m and 
	--display it in desending order on salary    
	SELECT EMPLOYEE_ID,SALARY, EMAIL, MANAGER_ID, 
        (SALARY - (SALARY*0.1)) AS DECREASED, (SALARY - (SALARY *0.9))AS LOSS 
	FROM EMPLOYEES
	WHERE MANAGER_ID = 123
    OR EMAIL LIKE 'M%'
    ORDER BY SALARY;
   
-- 11. WAQD details like employeeid,annual salary, commission, compensation of those emp who got commission.;	
        SELECT  EMPLOYEE_ID, 
                (SALARY *12) AS ANNUAL_SAL,
                (SALARY *12 * COMMISSION_PCT)AS COMMISSION,
                (SALARY *12 +(SALARY *12 * COMMISSION_PCT)) AS COMPENSATION
        FROM EMPLOYEES
        WHERE COMMISSION_PCT IS NOT NULL
        ORDER BY COMPENSATION;

-- 12. WAQD details of employees in descending order of emails
    SELECT FIRST_NAME, EMAIL
    FROM EMPLOYEES
    ORDER BY EMAIL;
	
-- 13. WAQD details of employees whose salary is greater than 10000 but not 11000 
--      sort it in descending order of commission percentage
    SELECT FIRST_NAME, LAST_NAME , SALARY , COMMISSION_PCT
    FROM EMPLOYEES
    WHERE SALARY > 10000
    AND SALARY <> 11000
    ORDER BY COMMISSION_PCT DESC;
	
-- 14. WAQD department's name for  department 100 or 80, ordered by name descending.  
    SELECT DEPARTMENT_NAME, DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID IN (80,100)
    ORDER BY DEPARTMENT_NAME DESC;

-- 15. WAQD List of employees who works in sales means (SA) and has joined before 4 aug 2006
--      sort it on hiredate
    SELECT EMPLOYEE_ID, JOB_ID, HIRE_DATE
    FROM EMPLOYEES
    WHERE JOB_ID LIKE 'SA%'
    AND HIRE_DATE < '04-08-06'
    ORDER BY HIRE_DATE DESC;

-- 16. WAQD List of employees who works as clerk and has joined between 4 feb 2001 to 3 april 2004
--      sort it departmentid desc, managerid , firstname desc
    SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID,DEPARTMENT_ID, HIRE_DATE,MANAGER_ID
    FROM EMPLOYEES
    WHERE JOB_ID LIKE '%CLERK%'
    AND HIRE_DATE BETWEEN '04-02-01' AND '03-04-04'
    ORDER BY DEPARTMENT_ID DESC, MANAGER_ID, FIRST_NAME DESC;

-- 17. WAQD details of those employees whose annual salary is greater than or equals to 75000 and less than or eqauls to 90000
--      sort on annual salary , firstname  
    SELECT EMPLOYEE_ID, FIRST_NAME ,SALARY, JOB_ID, (SALARY * 12) AS ANNUAL_SAL
    FROM EMPLOYEES
    WHERE (SALARY * 12) BETWEEN 75000 AND 90000
    ORDER BY ANNUAL_SAL , FIRST_NAME ;

-- 18. WAQD details of those employees whose salary is 7000 and  and job description contains letter a
--      sort on department and firstname  
    SELECT EMPLOYEE_ID, FIRST_NAME ,LAST_NAME,JOB_ID, SALARY,DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE SALARY = 7000
    AND JOB_ID LIKE '%A%'
    ORDER BY DEPARTMENT_ID ASC , FIRST_NAME DESC;


-- 19. WAQD details of employees communication methods who work in department 50 sort it on the basis of firstname	
    SELECT EMPLOYEE_ID , (' '||EMAIL || '  AND  ' || PHONE_NUMBER)AS COMMUNICATION_METHODS
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = 50
    ORDER BY FIRST_NAME;

-- 20. WAQD salary of emp who works as an IT programer containing E in email or T letter at 3rd place in firstname
	SELECT EMPLOYEE_ID, SALARY, JOB_ID,FIRST_NAME,LAST_NAME, EMAIL
	FROM EMPLOYEES
	WHERE JOB_ID ='IT_PROG'
    AND (FIRST_NAME LIKE '__t%' OR EMAIL LIKE '%E%')
    ORDER BY LAST_NAME;

-- 21.WAQD details of DEPARTMENTS whose department name is starting with C
	SELECT (DEPARTMENT_NAME ||' HAVING DEPARTMENT ID '||DEPARTMENT_ID) AS DEPARTMENT_DETAILS 
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME LIKE'C%'
    ORDER BY DEPARTMENT_NAME;

-- 22.WAQD reduce salary OF EMP by 10% whose manager is 100 and display it in ascending order of reduced salary
	SELECT EMPLOYEE_ID,SALARY, MANAGER_ID, (SALARY - (SALARY*0.1)) AS DECREASED, (SALARY - (SALARY *0.9))AS LOSS 
	FROM EMPLOYEES
	WHERE MANAGER_ID = 100
    ORDER BY LOSS ASC;

 -- 23. WAQD details of employees like 'Shruti shete gets 10% commission' sort it in descending order of lastname
	SELECT (FIRST_NAME ||' '||LAST_NAME||' GETS  '||COMMISSION_PCT *100||'% COMMISSION ') AS DETAILS 
	FROM EMPLOYEES
    WHERE COMMISSION_PCT IS NOT NULL
    ORDER BY LAST_NAME;

 -- 24. WAQD details of department whose location is other than 1700 sort the data by using name
	SELECT *
	FROM DEPARTMENTS
	WHERE LOCATION_ID <> 1700
    ORDER BY DEPARTMENT_NAME;

 -- 25. WAQD increment in salary by 1% for those emp who work in department 60, 80 
 --      sort the date in any format using salary 
    SELECT (FIRST_NAME ||' '||LAST_NAME)AS FULLNAME,JOB_ID,(SALARY*1.01) AS INCRE_SAL, DEPARTMENT_ID
	FROM EMPLOYEES
	WHERE  DEPARTMENT_ID IN (60,80)
    ORDER BY SALARY;
	
-- 26. WAQD employee details whose department id is null
	SELECT * FROM EMPLOYEES
	WHERE DEPARTMENT_ID IS NULL;

