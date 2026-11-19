
-- DATE : 11-02-2026
-- TOPIC : PL/SQL



-- BLOCK 1

SET SERVEROUTPUT ON
DECLARE

EMPID NUMBER := 100 ;
ENAME VARCHAR2(20) := 'SHRUTI';

BEGIN
-- ACTUAL CODE / LOGIC
DBMS_OUTPUT.PUT_LINE('This is my first PLSQL block ') ;
DBMS_OUTPUT.PUT_LINE(EMPID);
DBMS_OUTPUT.PUT_LINE(ENAME);

END ;

=================================

-- BLOCK 2

SET SERVEROUTPUT ON
DECLARE
EID NUMBER ;

BEGIN

DBMS_OUTPUT.PUT_LINE('EID VALUE IS '|| EID) ;

END ;
--EID VALUE IS 

====================================

-- BLOCK 3 

SET SERVEROUTPUT ON

BEGIN

DBMS_OUTPUT.PUT_LINE('This is my first PLSQL block') ;

END ;

====================================

-- BLOCK 4

SET SERVEROUTPUT ON
DECLARE
A NUMBER(5) := 11;
B NUMBER(5) := 11;
C NUMBER ;

BEGIN

C := A*B;
DBMS_OUTPUT.PUT_LINE('RESULT OF MULTIPLICATION IS : '|| C) ;

END ;

====================================

-- BLOCK 5

SET SERVEROUTPUT ON
DECLARE
HIREDATE DATE  ;

BEGIN
HIREDATE := SYSDATE;
DBMS_OUTPUT.PUT_LINE('THE HIREDATE IS : '|| HIREDATE) ;

END ;

