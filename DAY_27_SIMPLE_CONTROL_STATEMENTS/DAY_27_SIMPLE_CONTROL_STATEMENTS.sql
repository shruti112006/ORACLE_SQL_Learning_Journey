
-- DATE : 14-02-2026
-- SIMPLE CONTROL STATEMENTS

-- 1.Write a PYTHON program to find maximum between two numbers.
   SET SERVEROUTPUT ON
    DECLARE
    NO1 NUMBER := &NO1;
    NO2 NUMBER := &NO2;
    
    BEGIN
        IF NO1 > NO2
            THEN DBMS_OUTPUT.PUT_LINE('NO1 IS MAXIMUM'); 
        ELSE
             DBMS_OUTPUT.PUT_LINE('NO2 IS MAXIMUM'); 
        END IF;
    END;

-- 2.Write a PYTHON program to check whether a number is negative, positive .

	SET SERVEROUTPUT ON

	DECLARE
		NO1 NUMBER := &NUMBER_EXCEPT_ZERO;
	BEGIN
		
		IF NO1 > 0
			THEN DBMS_OUTPUT.PUT_LINE('NUMBER IS POSITIVE');
		ELSE 
			DBMS_OUTPUT.PUT_LINE('NUMBER IS NEGATIVE');
		END IF;
	END;

-- 3.	Write a Python program to check whether a character is uppercase or lowercase alphabet.

	SET SERVEROUTPUT ON
	DECLARE
		USER_INPUT VARCHAR2 := &INPUT;
	BEGIN
		IF USER_INPUT = UPPER(USER_INPUT)
			THEN DBMS_OUTPUT.PUT_LINE ('INPUT CHARACTER IS IN UPPERCASE');
		ELSE
			DBMS_OUTPUT.PUT_LINE ('INPUT CHARACTER IS IN LOWERCASE');
		END IF;
	END;
	
-- 4.Write a PYTHON program to check whether a number is divisible by 5 and 11 or not.

	SET SERVEROUTPUT ON

	DECLARE 
		NO1 NUMBER := &NO1;
	BEGIN
		IF MOD(NO1,5) = 0 AND MOD(NO1,11) = 0
			THEN DBMS_OUTPUT.PUT_LINE('NUMBER IS DIVISIBLE BY  5 AND 11');
		ELSE
			DBMS_OUTPUT.PUT_LINE('NUMBER IS NOT DIVISIBLE BY  5 AND 11');
		END IF;
	END;

-- 5.Write a PYTHON program to input any alphabet and check whether it is vowel or consonant.

    SET SERVEROUTPUT ON
    DECLARE 
     TEXT CHAR := &CHARCTER;
    BEGIN
        IF UPPER(TEXT) IN ('A','E','I','O','U')
        THEN  DBMS_OUTPUT.PUT_LINE('THE CHARACTER IS VOWEL');
        ELSE
            DBMS_OUTPUT.PUT_LINE('THE CHARACTER IS CONSONANT');
        END IF;
    END;
========================================================================================

-- 6. if department's maximum salary is greater than 10000 then good otherwise bad
	SET SERVEROUTPUT ON
    
    DECLARE
        DEPT NUMBER := &DEPT ;
        DID NUMBER ;
        MAX_SAL NUMBER;
        
    BEGIN
        SELECT DEPARTMENT_ID, MAX(SALARY) INTO DID, MAX_SAL
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = DEPT
        GROUP BY DEPARTMENT_ID;
        
        IF MAX_SAL > 10000
            THEN DBMS_OUTPUT.PUT_LINE('GOOD SALARY');
        ELSE
            DBMS_OUTPUT.PUT_LINE('BAD SALARY');
        END IF;
    END;
    

-- 7. If employee has commission then 20%  otherewise give  5%
    
    SET SERVEROUTPUT ON
    DECLARE
        EMP_ID        NUMBER := &EID;
        SALARY        NUMBER;
        COMM          NUMBER;
        NEW_SALARY    NUMBER;
    BEGIN
    SELECT SALARY, COMMISSION_PCT INTO SALARY, COMM
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = EMP_ID;
    IF COMM IS NOT NULL 
        THEN
        NEW_SALARY := SALARY + (SALARY * 0.10);
        DBMS_OUTPUT.PUT_LINE('Employee has commission.');
        DBMS_OUTPUT.PUT_LINE('20% hike applied.');
    ELSE
        NEW_SALARY := SALARY + (SALARY * 0.05);
        DBMS_OUTPUT.PUT_LINE('Employee has no commission.');
        DBMS_OUTPUT.PUT_LINE('5% hike applied.');
    END IF;
    END;
        
-- 8.IF CNT IS > 20 THEN HAVE GOOD WORKING EMPLOYEE STRENTH
	SET SERVEROUTPUT ON

	DECLARE
		DEPT_ID NUMBER(3) := &DEPT_ID;
		DID NUMBER (3);
		DNAME VARCHAR2(10);
		EMP_CNT NUMBER (2);
		
	BEGIN
		SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME , COUNT(*) INTO DID, DNAME, EMP_CNT
		FROM EMPLOYEES E  JOIN DEPARTMENTS D
		ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
		WHERE D.DEPARTMENT_ID = DEPT_ID
		GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME;

		IF EMP_CNT > 20
			THEN DBMS_OUTPUT.PUT_LINE('DEPARTMENT HAVE GOOD WORKING EMPLOYEE STRENGTH');
		ELSE
			DBMS_OUTPUT.PUT_LINE('DEPARTMENT HAVE BAD WORKING EMPLOYEE STRENGTH');
		END IF;
		
	END;

-- 9. If employee joined in current month the display  FRESHER  otherwise  old employee
    SET SERVEROUTPUT ON
    
    DECLARE
        EMP_ID NUMBER(3) := &EMP_ID;
        HIRE_MONTH VARCHAR2(7);
        HIRE_YEAR VARCHAR2(7);
    BEGIN
        SELECT TO_CHAR(HIRE_DATE,'MM'), TO_CHAR(HIRE_DATE,'YYYY') INTO HIRE_MONTH, HIRE_YEAR
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = EMP_ID;
    
        IF  HIRE_MONTH = TO_CHAR(SYSDATE,'MM')
            AND HIRE_YEAR = TO_CHAR(SYSDATE,'YYYY')
            THEN DBMS_OUTPUT.PUT_LINE('FRESHER');
        ELSE
            DBMS_OUTPUT.PUT_LINE('OLD EMPLOYEE');
        END IF;
        
    END;
    
    
    
    
    
    











