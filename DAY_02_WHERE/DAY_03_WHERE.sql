
-- DATE 02-01-2026
-- TOPICS:  COMPARISION OPERATORS ( BETWEEN AND, IN, LIKE)

1. -- WAQD details of emp whose firstname contains s
	SELECT *
	FROM EMPLOYEES
	WHERE FIRST_NAME LIKE '%s%';
	
2. -- WAQD fullname of emp whose firstname starts with K and having total length 5
	SELECT (FIRST_NAME||' ' ||LAST_NAME) AS FULLNAME
	FROM EMPLOYEES
	WHERE FIRST_NAME LIKE 'K____'	;
	
3. -- WAQD details of emp whose manager is 123,120,100
	SELECT *
	FROM EMPLOYEES
	WHERE MANAGER_ID IN (120,123,100);
	
4. -- WAQD details of emp in format  empid, fullname and salary whose lastname ends with e and having salary greater than 4500
	SELECT EMPLOYEE_ID AS EMPID, (FIRST_NAME || ' '||LAST_NAME) AS FULLNAME ,SALARY
	FROM EMPLOYEES
	WHERE LAST_NAME LIKE '%e'
	AND SALARY > 4500;
	
5. -- WAQD details of emp who work as clerk
	SELECT *
	FROM EMPLOYEES
	WHERE JOB_ID LIKE '%CLERK'; 
	
6. -- WAQD details of emp join in march 2006 
    SELECT *
	FROM EMPLOYEES
	WHERE HIRE_DATE LIKE '___03%06';
	
7. -- WAQD details of emp who join in 2005 and 2006
    SELECT *
	FROM EMPLOYEES
	WHERE HIRE_DATE LIKE '%06'
    OR HIRE_DATE LIKE '%05';
	
	--phoneno : (countrycode.areacode.specific no)
	
8. -- WAQD details of emp whose countrycode is 515 and areacode is 124	
    SELECT * 
	FROM EMPLOYEES
	WHERE PHONE_NUMBER LIKE '515_124%' ;
	
9. -- WAQD annual sal of emp whose department id other than 100,50,80
	SELECT EMPLOYEE_ID, DEPARTMENT_ID, (SALARY * 12)AS ANNUAL_SAL
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID NOT IN (50,80,100);
	
10. -- WAQD details of emp as employeeid, job description, salary whose salary is in the form of 5 digits
	SELECT EMPLOYEE_ID ,JOB_ID,SALARY
	FROM EMPLOYEES
	WHERE SALARY LIKE '_____';
	
11. -- WAQD details of Departments whose name starts with 'I'
	SELECT * 
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME LIKE 'I%';
	
12. -- WAQD details of Departments whose address is 1700 and having r as 3rd character
    SELECT * 
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME LIKE '__r%'
    AND LOCATION_ID = 1700;
	
13. -- WAQD increased the sal of emp by 2% whose last name is nayer, weiss, king 
	SELECT EMPLOYEE_ID AS EMPID, LAST_NAME, SALARY, (SALARY *1.02) AS INCRE_SAL 
	FROM EMPLOYEES
	WHERE LAST_NAME IN ('Nayer', 'Weiss', 'King'); 
 
14. -- WAQD calculate perday of emp who joins after 11 oct 2001 and works only in department 20,30,40
	SELECT EMPLOYEE_ID, HIRE_DATE, DEPARTMENT_ID
	FROM EMPLOYEES
	WHERE HIRE_DATE > '11-10-01'
	AND DEPARTMENT_ID IN (20,30,40);
	
15. --WAQD detailss of employee who join after 11 oct 2001 and works in department 20,30,40 or having job id is'AD_PRES','AD_VP','MK_MAN'
	SELECT EMPLOYEE_ID, HIRE_DATE, DEPARTMENT_ID, JOB_ID
	FROM EMPLOYEES
	WHERE HIRE_DATE > '11-10-01'
	AND DEPARTMENT_ID IN (20,30,40)
    OR JOB_ID IN ('AD_PRES','AD_VP','MK_MAN');
	
16. --WAQD details of emp whose email starts with s and having managerid 100

    SELECT EMPLOYEE_ID ,EMAIL, PHONE_NUMBER
	FROM EMPLOYEES
	WHERE EMAIL LIKE 'S%'
    AND MANAGER_ID = 100; 
	
17. -- WAQD details of only those employees whose manager id is 123 and working as clerk, contains letter s in firstname or lastname ends with e
    SELECT EMPLOYEE_ID, MANAGER_ID, FIRST_NAME, LAST_NAME
	FROM EMPLOYEES
	WHERE MANAGER_ID = 123
	AND JOB_ID LIKE '%CLERK'
	AND (FIRST_NAME LIKE '%s%' 
		OR LAST_NAME LIKE '%e');

18. -- WAQD details of salary deduction BY 3% of those employees who hired in oct
	SELECT EMPLOYEE_ID, SALARY, (SALARY * 0.97) AS DECUCTION, HIRE_DATE
	FROM EMPLOYEES
	WHERE HIRE_DATE LIKE '___10___';
	
	-- can also use below query
	--SELECT EMPLOYEE_ID, SALARY, (SALARY * 0.97) AS DECUCTION, HIRE_DATE
	--FROM EMPLOYEES
	--WHERE HIRE_DATE >='01-10-01';
	
19. --WAQD details of different ACCOUNT details whose salary is greater than 1000 and less than 10000
	SELECT EMPLOYEE_ID , SALARY, JOB_ID
	FROM EMPLOYEES
	WHERE JOB_ID LIKE '%ACCOUNT'
	AND (SALARY BETWEEN 1000 AND 10000);
	
20. --WAQD details of those emp whose empid is range 111 to 201 including both and display full name if name starts with d
    SELECT EMPLOYEE_ID ,(FIRST_NAME ||' '||LAST_NAME) AS FULLNAME 
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID BETWEEN 111 AND 201
    AND FIRST_NAME LIKE 'D%';
  
21. -- WAQD details of emp whose department is 50 or 80 and commission pct is less than .6 and greater than .2
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID , COMMISSION_PCT
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID IN(50,80)
    AND(COMMISSION_PCT <.6 AND COMMISSION_PCT > .2);
	
22.	-- WAQD salary of emp who works as an IT programer containing a in email or r letter at 4th place in firstname
	SELECT EMPLOYEE_ID, SALARY, JOB_ID,FIRST_NAME, EMAIL
	FROM EMPLOYEES
	WHERE JOB_ID ='IT_PROG'
    AND (FIRST_NAME LIKE '___r%' OR EMAIL LIKE '%A%');
	
23. --WAQD details of departments whose department location is 1700 OR r letter at 2Nd place in departmentname
	SELECT *
	FROM DEPARTMENTS
	WHERE LOCATION_ID = 1700
    OR DEPARTMENT_NAME LIKE '_r%';
	
24. --WAQD reduce salary OF EMP by 10% whose manager is 123 OR email starts with letter k and display it  
	SELECT EMPLOYEE_ID,SALARY, EMAIL, MANAGER_ID, 
        (SALARY - (SALARY*0.1)) AS DECREASED, (SALARY - (SALARY *0.9))AS LOSS 
	FROM EMPLOYEES
	WHERE MANAGER_ID = 123
    OR EMAIL LIKE 'K%';

25.-- WAQD details of manager whose department name is starting with A
	SELECT (DEPARTMENT_NAME ||' BELONG TO MANAGER '||MANAGER_ID) AS MANAGER_DETAILS 
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME LIKE'A%';
	