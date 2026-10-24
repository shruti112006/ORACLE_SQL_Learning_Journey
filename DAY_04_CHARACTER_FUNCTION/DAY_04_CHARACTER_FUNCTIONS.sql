
-- DATE 05-01-2026

-- TOPICS : CHARACTER FUNCTIONS

-- PURPOSE : CHARACTER FUNCTIONS are in-built functions for string datatype. They are divided into 2 types namely
--			 i. CASE MANIPULATION FUNCTIONS -> Used to manipulate the case of string
--		  & ii. CHARACTER MANIPULATION FUNTION -> Used to perform operations on the string datatype.

-- 1. WAQD details of employees who reports manager 100 in the format employeeid, fullname and salary
	SELECT EMPLOYEE_ID, CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME ) AS FULLNAME, SALARY
	FROM EMPLOYEES
	WHERE MANAGER_ID = 100;
	
-- 2. WAQD details of employees who works in department 80 or 90, having salary greater than 5000 
--		in the format like firstname in capital, lastname small as fullname 
	SELECT DEPARTMENT_ID, (CONCAT(UPPER(CONCAT(FIRST_NAME, ' ') , LOWER(LAST_NAME))) AS FULLNAME, SALARY
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID IN (80,90)
	AND SALARY > 5000;
	
-- 3. WAQD details of employee who joins in 2004 whose job profile hr in the following format
		--' 101 join as Hr '
	SELECT CONCAT(CONCAT(EMPLOYEE_ID, ' JOIN AS '), INITCAP(JOB_ID)) AS DETAILS
	FROM EMPOYEES
	WHERE HIRE_DATE LIKE '%2004'
	AND LOWER(JOB_ID) LIKE '%hr%';
	
-- 4. WAQD details of employees in uppercase whose annual sal is greater than 100000 having commission .2
--		sort on annual salary
	SELECT UPPER(FIRST_NAME) AS NAME, (SALARY *12) AS ANNUAL_SAL, COMMISSION_PCT
	FROM EMPLOYEES
	WHERE (SALARY * 12) > 100000
	AND COMMISSION_PCT = 0.2	
	ORDER BY ANNUAL_SAL;

-- 5. WAQD details of employees whose phone no is of length 14 and emails is of length 6
    SELECT EMPLOYEE_ID, PHONE_NUMBER , EMAIL
    FROM EMPLOYEES
    WHERE LENGTH(PHONE_NUMBER) = 12
    AND LENGTH(EMAIL) >= 6;
     
-- 6. WAQ to generate password of employee by using joining year,starting 4 letters of firstname and managerid
--         eg. format 06shru$100
	SELECT CONCAT(SUBSTR(HIRE_DATE,-2,2), CONCAT(CONCAT(LOWER(SUBSTR(FIRST_NAME,1,4)),'$'),MANAGER_ID)) AS PASSWORD
	FROM EMPLOYEES
	WHERE MANAGER_ID IS NOT NULL;
 
-- 7. WAQD details of those employees whose have some commission percentage sort it in ascending order on commission pct
-- 		also extract the first letter in EMAIL
	SELECT (SUBSTR(EMAIL,1,1)) AS EMAIL_FIRSTLETTER , LAST_NAME, COMMISSION_PCT
	FROM EMPLOYEES
	WHERE COMMISSION_PCT IS NOT NULL
	ORDER BY COMMISSION_PCT;

-- 8. WAQD FULLNAME of employee having surname king, change it to shete in capital format  
	SELECT CONCAT(CONCAT(FIRST_NAME , ' ') , LOWER(REPLACE(LAST_NAME,'King','shete'))) AS LAST_NAME
	FROM EMPLOYEES
	WHERE LAST_NAME = 'King';

-- 9. WAQD details of those employees whose has a in 2nd position of their firstname also use job profile, lastname to sort them 
	SELECT FIRST_NAME, LAST_NAME, JOB_ID
	FROM EMPLOYEES
	WHERE INSTR(FIRST_NAME,'a',1) = 2
	ORDER BY JOB_ID, LAST_NAME;

-- 10. WAQD details of such employees hired on date 20 and  reporting to manager 121 order by on hiredate 
--     solve it by using INSTR FUNCTION
	SELECT EMPLOYEE_ID, HIRE_DATE, MANAGER_ID
	FROM EMPLOYEES
	WHERE MANAGER_ID = 121
	AND  INSTR(HIRE_DATE, '20', 1) = 1
	ORDER BY HIRE_DATE;
	
-- 11. WAQD details of employees in the format whos gets some commission 
--		commission of neena is: .2
	SELECT CONCAT(CONCAT(CONCAT('COMMISSION OF ', FIRST_NAME),' IS '),COMMISSION_PCT) AS COMMISSION_RATE
	FROM EMPLOYEES
    WHERE COMMISSION_PCT IS NOT NULL;	 

-- 12. WAQD details of those employees whose salary is more than 2500 and less than 3000
--        and having clerk in job profile sort it on profile id , hire date
    SELECT FIRST_NAME, SALARY, JOB_ID AS PROFILE_ID, HIRE_DATE 
    FROM EMPLOYEES
    WHERE INSTR(JOB_ID,'CLERK',1) = 4 
    AND SALARY > 2500
    AND SALARY < 3000
    ORDER BY PROFILE_ID, HIRE_DATE;	 
    
-- 13. WAD to generate an emailid for an employee having salaary 17000 in following format
--      smanageridshetedepartmentid@gmail.com  --> s101shete50@gmail.com
    SELECT EMPLOYEE_ID, CONCAT(CONCAT(CONCAT(CONCAT(SUBSTR(EMAIL,1,1),MANAGER_ID),LOWER(LAST_NAME)),DEPARTMENT_ID),'@gmail.com') AS EMAIL_DETAILS
    FROM EMPLOYEES
    WHERE SALARY = 17000;
	
-- 14. WAQD details of employees whose job profile contains AD calculate the annual salary of them
	SELECT EMPLOYEE_ID, JOB_ID, (SALARY * 12) AS ANNUAL_SAL
	FROM EMPLOYEES 
	WHERE SUBSTR(JOB_ID, 1, 2) LIKE 'AD';
	
-- 15. WAQD details of employees who works in department 30 where the only last 4 digits of phone number should display for security purpose
--      and the starting digits must be hidden  eg-->*********124;
    SELECT EMPLOYEE_ID, (LPAD(SUBSTR(PHONE_NUMBER,-4,4) ,12, '*')) AS PHONE_NUMBER
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 30;
	
-- 16. WAQD details of employees like firstname, lastname, department of those who have salary more than 8000 
--      Assume that the firstname may have some leading and trailing spaces, and display the data in capital case and
--      in sorted order on the basis of department  and salary in descending order
    SELECT  DEPARTMENT_ID, UPPER(TRIM(FIRST_NAME)) AS F_NAME, UPPER(TRIM(LAST_NAME)) AS L_NAME , SALARY
    FROM EMPLOYEES
    WHERE SALARY > 8000
    ORDER BY DEPARTMENT_ID DESC, SALARY DESC;
    
-- 17. WAQD details of employees whose lastname starts with 'f' having employee id in between 110 to 215
--      sort it in asc order of firstname
    SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID
    FROM EMPLOYEES
    WHERE INSTR(LAST_NAME,'F',1) = 1
    AND EMPLOYEE_ID BETWEEN 110 AND 215
    ORDER BY FIRST_NAME ASC;
	
-- 18. WAQD details of manager whose department name starts with letter A,P,I 
--      Sort the data in asc order of name
    SELECT CONCAT(CONCAT(DEPARTMENT_NAME ,'  BELONGS TO '),MANAGER_ID) AS MANAGER_DETAILS 
	FROM DEPARTMENTS
	WHERE INSTR(DEPARTMENT_NAME, 'A',1) = 1
    OR DEPARTMENT_NAME LIKE 'P%'
    OR DEPARTMENT_NAME LIKE 'I%'
    ORDER BY DEPARTMENT_NAME;

-- 19. WAQD reduce salary OF EMP by 10% whose manager is 100 ,email starts with letter k and display it
--      Sort it by managerid, salary by descending
	SELECT EMPLOYEE_ID,SALARY, EMAIL, MANAGER_ID, 
        (SALARY - (SALARY*0.1)) AS DECREASED, (SALARY - (SALARY *0.9))AS LOSS 
	FROM EMPLOYEES
	WHERE MANAGER_ID LIKE '100'
    AND EMAIL LIKE 'K%'
    ORDER BY MANAGER_ID, SALARY DESC;

-- 20. WAQD details of department whose location is other than 1700 sort the data by using name
	SELECT DEPARTMENT_NAME, DEPARTMENT_ID
	FROM DEPARTMENTS
	WHERE LOCATION_ID <> 1700
    ORDER BY DEPARTMENT_NAME;
	
-- 21. WAQD details of employees whose manager is 108 and joins in 2006, change the case of firstname to capital case
    SELECT EMPLOYEE_ID,UPPER(FIRST_NAME) AS NAME, MANAGER_ID, HIRE_DATE
    FROM EMPLOYEES
    WHERE MANAGER_ID = 108
    AND HIRE_DATE LIKE '______06';
	
-- 22. DEPARTMENT DETAILS AS NAME LOCATION IS 1700 where location is not 1700
	SELECT  CONCAT(CONCAT(DEPARTMENT_NAME,' LOCATION IS '),LOCATION_ID) AS LOC_DETAILS
	FROM DEPARTMENTS
    WHERE LOCATION_ID <> 1700;

-- 23. WAQD details of employees whose salary is less than 3000 and increment the salary by 2% in the following formant
--      SHRUTI SHETE as fullname, 2800 as increment
	SELECT CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS FULLNAME, (SALARY + (SALARY*0.02)) AS INCREMENTS
	FROM EMPLOYEES
    WHERE SALARY < 3000;
	
--  24.WAQD details of employees like employee_id, job descrip, salary, annunal salary
   --  whose job descri contain man and having annual salary less than 4000 sort the data on job descr and salary
    SELECT EMPLOYEE_ID, JOB_ID, SALARY ,(SALARY *12) AS ANNUAL_SAL
    FROM EMPLOYEES
    WHERE INSTR(JOB_ID,'MAN',3) = 1 
    AND (SALARY * 12) > 4000
    ORDER BY JOB_ID, ANNUAL_SAL;

--  25.WAQD details of employees whose areacode is 124 using SUBSTR function	
    SELECT * 
	FROM EMPLOYEES
	WHERE SUBSTR(PHONE_NUMBER,5,3) = '124' ;
	
-- 26. number of emp hired in march 2006
	SELECT COUNT(*) 
    FROM EMPLOYEES
    WHERE SUBSTR(HIRE_DATE,7) = 06
    AND  SUBSTR(TO_CHAR(HIRE_DATE , 'DAY-YYYY-MON'),-3) = 'MAR' ;