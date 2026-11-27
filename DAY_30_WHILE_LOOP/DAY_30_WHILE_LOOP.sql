
-- DATE : 18-02-2026
-- TOPIC : WHILE LOOP IN PL/SQL


-- Q.1 CHECK PALINDROME

    SET SERVEROUTPUT ON
    DECLARE
        USER_NO NUMBER := &N;
        REMD NUMBER ;
        REV_NO NUMBER := 0;
        A NUMBER := USER_NO;

    BEGIN
        
        WHILE  A != 0
        LOOP
            REMD := MOD(A,10);
            REV_NO := REV_NO*10 + REMD;
            A := TRUNC(A /10);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(REV_NO);
        IF REV_NO = USER_NO
            THEN  DBMS_OUTPUT.PUT_LINE('IT IS  A PALINDROME');
        ELSE          
            DBMS_OUTPUT.PUT_LINE('IT IS NOT A PALINDROME');
        END IF;
    END;
	

-- Q.2 CHECK ARMSTRONG

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
        
        WHILE  A2 != 0
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
	
-- Q.3 FIBONACCI SERIES

    SET SERVEROUTPUT ON
    DECLARE
        USER_NO NUMBER := &N;
        A NUMBER := -1;
        B NUMBER := 1;
        TOTAL NUMBER ;
        CNT NUMBER := 0;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('FIBONACCI SERIES ');
        WHILE  CNT < USER_NO
        LOOP
            TOTAL := (A+B);
            DBMS_OUTPUT.PUT_LINE(TOTAL);
            A := B ;
            B := TOTAL;
            CNT := CNT +1;
        END LOOP;
    END;

-- Q.4 Addition of even number between given numbers

	SET SERVEROUTPUT ON
	DECLARE
		NO1 NUMBER := &N1;
		NO2 NUMBER := &N2;
		TOTAL NUMBER := 0;
	BEGIN
		WHILE NO1 <= NO2
		LOOP
			IF MOD (NO1 ,2) = 0
				THEN
					TOTAL := TOTAL + NO1;
			END IF;
			NO1 := NO1 + 1;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE(TOTAL);
	END;
