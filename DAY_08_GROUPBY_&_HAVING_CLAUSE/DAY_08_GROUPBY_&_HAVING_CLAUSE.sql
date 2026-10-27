
-- DATE : 09-01-2026
-- TOPICS : GROUP BY, HAVING CLAUSE


-- 1. WAQD department-wise total annual salary of employees 
    
    SELECT DEPARTMENT_ID, SUM(SALARY * 12) AS TOTAL_ANNUAL_SAL
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;

-- 2. WAQD job profession wise count of employees along with maximum salary 

	SELECT JOB_ID, COUNT(*) AS CNT, MAX(SALARY) AS MAX_SAL
	FROM EMPLOYEES
	GROUP BY JOB_ID
	ORDER BY COUNT(*)DESC, JOB_ID ;

-- 3. WAQD count of employees whose firstname starts with same letter

	SELECT SUBSTR(FIRST_NAME,1,1) AS ALPHA_LETTERS, COUNT(*) AS CNT
	FROM EMPLOYEES
	GROUP BY SUBSTR(FIRST_NAME,1,1)
    ORDER BY ALPHA_LETTERS ;

-- 4. WAQD average salary of department having department id 10,50,60
	SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),2) AS AVG_SAL
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID
	HAVING DEPARTMENT_ID IN (10,50,60)
	ORDER BY DEPARTMENT_ID;

-- 5. WAQD the senior's and junior's joining date per department but the condition is 
--     there must be more than 1 employee working in that department
	SELECT  DEPARTMENT_ID, MIN(HIRE_DATE) AS JUNIOR_JOINING_DATE,
            MAX(HIRE_DATE) AS SENIOR_JOINING_DATE
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID
    HAVING COUNT(*) > 1
    ORDER BY DEPARTMENT_ID;

-- 6. WAQD firstname of employees whose name starts with letter S' by using group by 
--      clause
    SELECT FIRST_NAME
    FROM EMPLOYEES
    GROUP BY FIRST_NAME
    HAVING SUBSTR(FIRST_NAME,1,1) = 'S';

-- 7. WAQD department wise HIGEST experience  and sort it in desecnding order on experience
    SELECT DEPARTMENT_ID, 
           MAX(ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)) AS EXPERIENCE
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    ORDER BY EXPERIENCE DESC ;
	
--8. WAQD count of number of employees reporting to each manager 

    SELECT MANAGER_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    GROUP BY MANAGER_ID
    ORDER BY MANAGER_ID ;	
	
--9. WAQD count of number of employees reporting to each manager 
--    the count shoulb 5 or more than that

    SELECT MANAGER_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    GROUP BY MANAGER_ID
    HAVING COUNT(*) >= 5
    ORDER BY MANAGER_ID ;
	
-- 10. WAQD number of employees joined in 2006 having job description as clerk

	SELECT JOB_ID, COUNT(*) AS HIRED_EMP
	FROM EMPLOYEES
	WHERE TO_CHAR(HIRE_DATE , 'YYYY') = '2006'
	GROUP BY JOB_ID
    HAVING JOB_ID LIKE '%CLERK';
	
-- 11. WAQD Job id wise total count of employees and their highest salary in between year 2006 and 2007.
--		For those job description whose highest salary is more than 4500
	SELECT JOB_ID, COUNT(*) AS HIRED_EMP , MAX(SALARY)AS MAX_SAL
	FROM EMPLOYEES
	WHERE TO_CHAR(HIRE_DATE , 'YYYY') BETWEEN  '2006' AND '2007'
	GROUP BY JOB_ID
    HAVING MAX(SALARY) > 4500;             ---- can be also use IN Operator
	
-- 12. WAQD count employees works in finanace  but hired after 2002	
    SELECT JOB_ID, COUNT(FIRST_NAME) AS HIRED_EMP 
	FROM EMPLOYEES
	WHERE TO_CHAR(HIRE_DATE , 'YYYY') >'2002'	
    GROUP BY JOB_ID
    HAVING INSTR(JOB_ID,'F') = 1;
	
-- 13. WAQD Commission per job profession but the commission shouled not be null
    SELECT JOB_ID, SUM(COMMISSION_PCT) AS COMMISSION
	FROM EMPLOYEES	
    WHERE COMMISSION_PCT IS NOT NULL
    GROUP BY JOB_ID;

-- 14. WAQD count of employees who works in department 20,30,50 whose  perdays salary morethan 200
    SELECT  DEPARTMENT_ID , COUNT(*) AS CNT
    FROM EMPLOYEES
    WHERE ROUND(SALARY/30,2) > 200
	GROUP BY DEPARTMENT_ID
	HAVING DEPARTMENT_ID IN (20,30,50);
	
-- 15. WAQD average salary of employees per job profession whose minimum salary is less than 5000

    SELECT JOB_ID , ROUND(AVG(SALARY)) AS AVG_PER_JOB
    FROM EMPLOYEES
    GROUP BY JOB_ID;

-- 16. The HR decides to give 10% increment to those employees who has 5 years of experience 
--      and gets some commission monthly calculate  avg salary  per  department
    SELECT DEPARTMENT_ID,
            ROUND(AVG((SALARY * 1.1)),2) AS SAL_AVG
    FROM EMPLOYEES
    WHERE ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12 , 2) > 20
    AND COMMISSION_PCT IS NULL
    GROUP BY DEPARTMENT_ID ;
	
-- 17. WAQD average commission percentage of FINANCE department

    SELECT JOB_ID , 
        NVL(TO_CHAR(ROUND(AVG(COMMISSION_PCT))), 'NO COMMISSION') AS AVG_COMMISSION
    FROM EMPLOYEES
    WHERE JOB_ID LIKE 'F%'
    GROUP BY JOB_ID;

-- 18. WAQD monthly higshest salary  in between 2004-  06

    SELECT TO_CHAR(HIRE_DATE , 'MON')AS JOINED_MONTH, MAX(SALARY) AS MAX_SAL 
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE , 'YYYY') BETWEEN '2004' AND '2006' 
    GROUP BY TO_CHAR(HIRE_DATE , 'MON')
    ORDER BY JOINED_MONTH ;

-- 19. WAQD details of employees like total salary (annual sal with commission) 
--        for each department

	SELECT  DEPARTMENT_ID,
			SUM(NVL2(COMMISSION_PCT, (SALARY*12) + (SALARY*12*COMMISSION_PCT) ,SALARY*12))AS TOTAL_SAL
	FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;
	
-- 20. WQAD COUNT OF EMPLOYEES WHO WERE HIRED IN THE LAST 3 YEARS A
    SELECT TO_CHAR(HIRE_DATE ,'YYYY'), COUNT(*) AS CNT_EMP
    FROM EMPLOYEES
    WHERE HIRE_DATE BETWEEN '01-01-2005' AND '31-12-2008'
    GROUP BY TO_CHAR(HIRE_DATE ,'YYYY')
    ORDER BY CNT_EMP ;
	
-- 21. Display the minimum Job experience and the number of employees for each job 
--      where count is more than 10
    SELECT JOB_ID,COUNT(EMPLOYEE_ID) AS COUNT, 
            ROUND(MIN(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)) AS EXPERIENCE
    FROM EMPLOYEES
    GROUP BY JOB_ID
    HAVING COUNT(*) > 10;
	
--  22.WAQD DETAILS OF THOSE EMPLOYEES HIRED  BEFORE 2008 DISPLAY THEIR EXPERIENCE WISE 
--      COUNT OF EMPLOYEES  ORDERED BY EXPERIENCE.
    SELECT ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE) /12) AS EXPERIENCE,
           COUNT(*) AS EXPERIENCED_EMP
    FROM EMPLOYEES
    WHERE HIRE_DATE < '31-12-2008'
    GROUP BY ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 
    ORDER BY EXPERIENCE;

-- 23. WAQD COUNT of employees whose lastname starts with  'L' having employee id in between 100 to 215
--      sort it in asc order of lastname
    SELECT SUBSTR(LAST_NAME,1,1) AS LAST_NAME_LETTER, COUNT(*) AS CNT
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID BETWEEN 100 AND 215
    GROUP BY SUBSTR(LAST_NAME,1,1)
    HAVING SUBSTR(LAST_NAME,1,1) = 'L'
    ORDER BY LAST_NAME_LETTER DESC; 
	
-- 24. WAQD manager wise employee count where  count <  5   
    SELECT MANAGER_ID, COUNT(*) AS CNT
    FROM EMPLOYEES
    GROUP BY MANAGER_ID
    HAVING COUNT(*) < 5; 
    
-- 25. WAQD COUNT of employees whose email starts with  'a' having employee id in between 110 to  215
    SELECT SUBSTR(EMAIL,1,1) AS EMAIL_LETTER, COUNT(*) AS CNT
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID BETWEEN 110 AND 215
    GROUP BY SUBSTR(EMAIL,1,1)
    HAVING SUBSTR(EMAIL,1,1) = 'A';