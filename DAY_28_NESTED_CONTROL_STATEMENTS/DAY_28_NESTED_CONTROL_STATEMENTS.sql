
-- DATE : 15-02-2026
-- TOPICS: NESTED CONTROL STATEMENTS 

-- 1.Write a Python program to input all sides of a triangle and check whether triangle is valid or not
	SET SERVEROUTPUT ON 

	DECLARE
	SIDE_1 NUMBER:= &SIDE_1;
	SIDE_2 NUMBER:= &SIDE_2;
	SIDE_3 NUMBER:= &SIDE_3;

	BEGIN

	IF (SIDE_1+SIDE_2 > SIDE_3) AND (SIDE_2+SIDE_3 > SIDE_1) AND (SIDE_1+SIDE_3 > SIDE_2)
	  THEN
	  DBMS_OUTPUT.PUT_LINE('VALID TRIANGLE'); 
	ELSE 
	 DBMS_OUTPUT.PUT_LINE('INVALID TRIANGLE');
	END IF;
	END ;

-- 2.Write a Python program to input angles of a triangle and check whether triangle is valid or not.
	SET SERVEROUTPUT ON
	DECLARE
		ANGLE_1 NUMBER := &A1;
		ANGLE_2 NUMBER := &A2;
		ANGLE_3 NUMBER := &A3;
		TOTAL_ANGLE NUMBER;
		
	BEGIN
		-- CALCULATE SUM
		TOTAL_ANGLE := ANGLE_1 + ANGLE_2 + ANGLE_3;
			
		IF ANGLE_1 <= 0 OR ANGLE_2 <= 0 OR ANGLE_3 <= 0
			THEN DBMS_OUTPUT.PUT_LINE('ERROR MESSAGE: INVALID ANGLES ');
		ELSIF TOTAL_ANGLE = 180
			THEN DBMS_OUTPUT.PUT_LINE('VALID TRIANGLE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('INVALID TRIANGLE. THE SUM OF ALL ANGLES MUST BE 180');
		END IF;
			
	END;

-- 3.Write a Python program to check whether the triangle is equilateral, isosceles or scalene triangle.

	SET SERVEROUTPUT ON
	DECLARE
		SIDE_1 NUMBER:= &SIDE_1;
		SIDE_2 NUMBER:= &SIDE_2;
		SIDE_3 NUMBER:= &SIDE_3;

	BEGIN
		IF (SIDE_1+SIDE_2 > SIDE_3) AND (SIDE_2+SIDE_3 > SIDE_1) AND (SIDE_1+SIDE_3 > SIDE_2)
			THEN
			IF SIDE_1 = SIDE_2 AND  SIDE_2 = SIDE_3 AND SIDE_1 = SIDE_3
				THEN DBMS_OUTPUT.PUT_LINE('TRIANGLE IS EQUILATERAL');
			ELSIF SIDE_1 = SIDE_2 OR  SIDE_2 = SIDE_3 OR SIDE_1 = SIDE_3
				 THEN DBMS_OUTPUT.PUT_LINE('TRIANGLE IS ISOSCELES');
			ELSE
				DBMS_OUTPUT.PUT_LINE('TRIANGLE IS SCALENE');
			END IF;
		END IF;
	END;
	

-- 4. Check whether it is a alphabet , special character or digit

	SET SERVEROUTPUT ON
	DECLARE
		USER_STR VARCHAR2(5) := &STR;

	BEGIN

			IF ASCII(UPPER(USER_STR)) BETWEEN 65 AND 90
				THEN DBMS_OUTPUT.PUT_LINE(USER_STR || ' IS A CHARACTER');
			ELSIF ASCII(USER_STR) BETWEEN 48 AND 57
				THEN DBMS_OUTPUT.PUT_LINE (USER_STR || 'IS A NUMBER');
			ELSE 
				DBMS_OUTPUT.PUT_LINE (USER_STR || 'IS A SPECIAL CHARACTER');
			END IF;
		
	END;

-- 5.Write a Python program to input basic salary of an employee and calculate its Gross salary according to following:
--    Basic Salary <= 10000 : HRA = 20%, DA = 80%
--    Basic Salary <= 20000 : HRA = 25%, DA = 90%
--    Basic Salary > 20000 : HRA = 30%, DA = 95%


	SET SERVEROUTPUT ON
	DECLARE
		BASIC_SAL NUMBER := &SAL;
		GROSS_SAL NUMBER;
		HRA NUMBER ;
		DA NUMBER;
		
	BEGIN
		IF  BASIC_SAL <= 10000 
			THEN  HRA :=  BASIC_SAL *0.2;
				  DA := BASIC_SAL *0.8;
				  
		ELSIF BASIC_SAL <= 20000 
			THEN  HRA :=  BASIC_SAL * 0.25;
				  DA := BASIC_SAL * 0.9;
		ELSE
			HRA :=  BASIC_SAL * 0.3;
			DA := BASIC_SAL * 0.95;
		END IF;
		
		GROSS_SAL := BASIC_SAL + HRA + DA;
		
		DBMS_OUTPUT.PUT_LINE('SALARY : '||BASIC_SAL);
		DBMS_OUTPUT.PUT_LINE('HRA : '||HRA);
		DBMS_OUTPUT.PUT_LINE('DA : '||DA);
		DBMS_OUTPUT.PUT_LINE('GROSS SALARY : '||GROSS_SAL);

	END;


			



============================= -- DATE : 16-02-2026 =========================================
--- SALARY WISE RANK OF GIVEN EID IN HIS DEPARTMENT
	SET SERVEROUTPUT ON

	DECLARE
		USER_EID NUMBER := &EID;
		DID NUMBER;
		SAL NUMBER;
		RNK NUMBER;
	BEGIN
		SELECT * INTO USER_EID,DID,SAL,RNK
		FROM(  SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY, 
					DENSE_RANK() OVER ( PARTITION BY  DEPARTMENT_ID ORDER BY SALARY DESC )
				FROM EMPLOYEES )
		WHERE EMPLOYEE_ID = USER_EID;
		   
			DBMS_OUTPUT.PUT_LINE (RNK);
	END;

