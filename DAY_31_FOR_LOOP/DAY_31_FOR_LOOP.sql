
-- DATE : 19-02-2026
-- TOPIC : FOR LOOP IN PL/SQL



-- Q. SIMPLE EXAMPLE OF  FOR LOOP
	SET SERVEROUTPUT ON
	DECLARE
	BEGIN 

		FOR I IN 1..5
		LOOP
			DBMS_OUTPUT.PUT_LINE(I);
		END LOOP;
	END;

======================================================
-- Q. CHECK WHETHER VALUE OF I OVERRIDES OR NOT
	SET SERVEROUTPUT ON
	DECLARE
		I NUMBER := 11;
	BEGIN
		FOR I IN 1..5
		LOOP
			DBMS_OUTPUT.PUT_LINE(I);
		END LOOP;
	END;

-- ANS: VALUE OF I DOES NOT OVERRIDE. IN FOR LOOP THE VARIABLE ASSIGNATION HAPPENS AUTOMATICALLY.
=================================================================================================
-- Q. CHECK WHETHER VALUE OF I OUTSIDE THE LOOP
 
    SET SERVEROUTPUT ON
	DECLARE
		I NUMBER := 11;
	BEGIN
		FOR I IN 1..5  --- IMPLICITLY ASSIGNS THE VALUE THAT WE SPECIFIED
		LOOP
			DBMS_OUTPUT.PUT_LINE(I);
		END LOOP;
        DBMS_OUTPUT.PUT_LINE(I); -- DISPLAY THE VALUE THAT INITIALIZED IN DECLARE 
								 --> 11
	END;

=========================================================

-- Q.1 DISPLAY EVEN NO BETWEN 100 AND 200

    SET SERVEROUTPUT ON
    DECLARE
        RESLT NUMBER;
    BEGIN
        FOR I IN 100..200
        LOOP
            IF MOD(I,2) = 0
                THEN    
                RESLT := I;
                DBMS_OUTPUT.PUT_LINE(RESLT);
            END IF;
        END LOOP;
    END;


-- Q.2 DISPLAY EVEN AND ODD NUMBERS BETWEN 100 AND 200

    SET SERVEROUTPUT ON
    DECLARE
    
    BEGIN
        FOR I IN 100..200
        LOOP
            IF MOD(I,2) = 0
                THEN    
                DBMS_OUTPUT.PUT_LINE('EVEN NO : '||I);
            ELSE
                DBMS_OUTPUT.PUT_LINE('ODD NO : '||I);
            END IF;
        END LOOP;
    END;
	
-- Q.3 DISPLAY ALL EVEN NUMBERS AND THEN ALL ODD NUMBERS BETWEN 100 AND 200	
	SET SERVEROUTPUT ON
    DECLARE
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('ALL EVEN NO : ');
        FOR I IN 10..20
        LOOP
            IF MOD(I,2) = 0
                THEN    
                DBMS_OUTPUT.PUT_LINE('EVEN NO : '||I);
            END IF;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('ALL ODD NO : ');
        FOR I IN 10..20
        LOOP
            IF MOD(I,2) != 0
                THEN    
                DBMS_OUTPUT.PUT_LINE('ODD NO : '||I);
            END IF;
        END LOOP;
    END;	


-- Q.4 FIBONACCI SERIES. TAKE INPUT FROM USER

    SET SERVEROUTPUT ON
    DECLARE
        USER_NO NUMBER := &N;
        A NUMBER := -1;
        B NUMBER := 1;
        TOTAL NUMBER ;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('FIBONACCI SERIES ');
        FOR I IN 1..USER_NO
        LOOP
            TOTAL := (A+B);
            DBMS_OUTPUT.PUT_LINE(TOTAL);
            A := B ;
            B := TOTAL;
        END LOOP;
    END;
	
-- Q.5.REVERSE DIGITS 
	SET SERVEROUTPUT ON 
	DECLARE 
        NO1 NUMBER := &ENTER_NUMBER;
        L_DIGIT NUMBER ;
        REV_NO NUMBER := 0;
        A NUMBER ;
          B NUMBER;
        CNT NUMBER :=0;
	BEGIN
            A := NO1;
            B:=NO1;

        LOOP
            A := TRUNC(A/10);--5896
            CNT := CNT +1;
        EXIT WHEN A = 0;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(CNT);
        
        FOR I IN 1..CNT 
        LOOP 
            L_DIGIT := MOD(B,10);
            REV_NO := REV_NO *10 + L_DIGIT;
           B :=TRUNC(B/10);

        END LOOP;
        DBMS_OUTPUT.PUT_LINE('REVERSE NUMBER : '|| REV_NO);
	END; 
	 
-- Q.6 CHECK ARMSTRONG

    SET SERVEROUTPUT ON
    DECLARE
        USER_NO NUMBER := &N;
        CNT NUMBER := 0;
        REMD NUMBER ;
        EXPO NUMBER := 0;
        A1 NUMBER := USER_NO;
        A2 NUMBER := USER_NO;
       
    BEGIN 
        LOOP
            A1 := TRUNC(A1/10);
            CNT := CNT + 1;
        EXIT WHEN A1 = 0; 
        END LOOP;
        
        FOR I IN 1..CNT
        LOOP
            REMD := MOD(A2,10);
            EXPO := EXPO + REMD ** CNT;
            A2 := TRUNC(A2 /10);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE(USER_NO);
        DBMS_OUTPUT.PUT_LINE(EXPO);
        IF EXPO = USER_NO
            THEN  DBMS_OUTPUT.PUT_LINE('IT IS  A ARMSTRONG');
        ELSE          
            DBMS_OUTPUT.PUT_LINE('IT IS NOT A ARMSTRONG');
        END IF;
    END;
	
-- Q.7 Addition of even number between given numbers
	
	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &N1;
		NO2 NUMBER := &N2;
		TOTAL NUMBER := 0;
	BEGIN
		FOR I IN NO1..NO2
		LOOP
			IF MOD (I ,2) = 0
				THEN
					TOTAL := TOTAL + I;
			END IF;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(TOTAL);
	END;
	
=============================================================== 
--   NESTED FOR LOOP  
    SET SERVEROUTPUT ON
	DECLARE
		
	BEGIN
		FOR I IN 1..3
		LOOP
            FOR J IN 1..3
			LOOP
                DBMS_OUTPUT.PUT_LINE('VALUE OF i: '||I ||'   VALUE OF j: '|| J);
            END LOOP;
		END LOOP;

	END;
	
===========================================================================

-- Q. PRINT PATTERN 
* 
** 
*** 
**** 

	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &NI1;
		S NUMBER :=1;
	BEGIN
		FOR I IN 1..NO1
		LOOP
			FOR J IN 1..I-1
			LOOP
				DBMS_OUTPUT.PUT('*');
			END LOOP;
		DBMS_OUTPUT.PUT_LINE(' ');
		END LOOP;
	END;
	
-- Q. PRINT PATTERN 
***** 
**** 
*** 
** 
* 

	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &NI1;
		S NUMBER ;
	BEGIN

		FOR I IN REVERSE 1..NO1
		LOOP
            S:=I + 1;
			FOR J IN 1..S-1
			LOOP
                 DBMS_OUTPUT.PUT('*');
			END LOOP;
		DBMS_OUTPUT.PUT_LINE(' ');
		END LOOP;
	END;
	
-----------------------------------

	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &NI1;
		S NUMBER ;
	BEGIN

		FOR I IN  1..NO1
		LOOP
            S:= I+1;
			FOR J IN 1..S-1
			LOOP
                 DBMS_OUTPUT.PUT(' ');
			END LOOP;
		DBMS_OUTPUT.PUT_LINE('*');
        END LOOP;
        FOR I IN 1..NO1
        LOOP
            FOR J IN 1..NO1-1
                LOOP
                    IF J > I 
                        THEN  DBMS_OUTPUT.PUT('*');
                    ELSE
                        CONTINUE;
                    END IF;
            END LOOP;
        END LOOP;
	END;

-------------------------
	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &NI1;
	BEGIN

		FOR I IN  1..NO1
		LOOP
            CONTINUE WHEN I = 3;
            DBMS_OUTPUT.PUT_LINE('ITERATION: '||I);
        END LOOP;
	END;