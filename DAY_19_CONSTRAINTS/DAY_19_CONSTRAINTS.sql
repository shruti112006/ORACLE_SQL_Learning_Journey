
-- DATE : 29-01-2026
-- TOPIC : CONSTRAINTS

------------- HOMEWORK 1 -------------

--- STEP 1:
	CREATE TABLE DEPT(
		DID NUMBER CONSTRAINT DEPT_PK PRIMARY KEY,
		DEPT_NAME VARCHAR2(12) NOT NULL,
		LOC_ID NUMBER (4)
	);

	INSERT INTO DEPT VALUES (1,'HR',1700);
	INSERT INTO DEPT VALUES (2,'SALES',1000);
	INSERT INTO DEPT VALUES (3,'FINANCE',1200);
	INSERT INTO DEPT VALUES (4,'IT',1500);
	INSERT INTO DEPT VALUES (5,'CLERK',1100);

	SELECT * FROM DEPT;

	COMMIT;

---STEP 2 :

    CREATE TABLE EMP(
        EMPID NUMBER(3) CONSTRAINT EMP_PK PRIMARY KEY, -----COLUMN LEVEL
        ENAME VARCHAR2(10) CONSTRAINT ENAME_NN NOT NULL,
        SALARY NUMBER(6) NOT NULL,
        EMAIL VARCHAR2(15) CONSTRAINT EMAIL_U UNIQUE,
        COMMISSION NUMBER(2,1) CHECK (COMMISSION > 0),
        DID NUMBER,
        
        CONSTRAINT DEPT_FK FOREIGN KEY (DID) -----TABLE LEVEL
        REFERENCES DEPT(DID)
        );
		
    SELECT * FROM EMP;
    
    INSERT INTO EMP VALUES (101,'SHRUTI',60000,'shruti@',0.1,1);
    INSERT INTO EMP VALUES (101,'KEDAR',80000,'kedar@',0.0,2);
	   
--	Error starting at line : 19 in command -
--			INSERT INTO EMP VALUES (101,'KEDAR',80000,'kedar@',0.0,2)
--		Error report -
--		ORA-02290: check constraint (HR.SYS_C007097) violated

-- if more than one constraint gets violated then it displays error randomly there is not a predefined order of checking

	INSERT INTO EMP (ENAME,SALARY,EMAIL,COMMISSION,DID) VALUES ('ANAGHA',70000,'anagha@',105,4);
--	cannot insert NULL into ("HR"."EMP"."EMPID")

------------- HOMEWORK 2 -------------

-- Can we apply more than one constraint to a single column
-- STEP 1:

    CREATE TABLE DEPT (
        DID NUMBER CONSTRAINT DEPT_PK PRIMARY KEY,
        DNAME VARCHAR2(15) CONSTRAINT DNAME_U UNIQUE
                            NOT NULL,
        LOC_ID NUMBER(4)
    );

	INSERT INTO DEPT VALUES (1,'HR',1700);
	INSERT INTO DEPT VALUES (2,'SALES',1000);
	INSERT INTO DEPT VALUES (3,'FINANCE',1200);
	INSERT INTO DEPT VALUES (4,'IT',1500);
	INSERT INTO DEPT VALUES (5,'CLERK',1100);

	SELECT * FROM DEPT;

	COMMIT;
-- ANS: YES, We can give more than one constraint to a single column such as UNIQUE,NOT NULL,CHECK
--      If a column have PK or FK constraint, we can also apply other constraints to it 
--      Don't use UNIQUE with PK cause it will throw an duplication error 

---STEP 2 :

    CREATE TABLE EMP(
        EMPID NUMBER(3) CONSTRAINT EMP_PK PRIMARY KEY, -----COLUMN LEVEL
        ENAME VARCHAR2(10) CONSTRAINT ENAME_NN NOT NULL,
        SALARY NUMBER(6) NOT NULL,
        EMAIL VARCHAR2(15) CONSTRAINT EMAIL_U UNIQUE,
        COMMISSION NUMBER(2,1) CHECK (COMMISSION > 0),
        DID NUMBER,
        
        CONSTRAINT DEPT_FK FOREIGN KEY (DID) -----TABLE LEVEL
        REFERENCES DEPT(DID)
        );
		
    SELECT * FROM EMP;
	INSERT INTO EMP VALUES (101,'SHRUTI',60000,'shruti@',0.1,1);
    INSERT INTO EMP VALUES (102,'KEDAR',80000,'kedar@',1.0,2);
    INSERT INTO EMP  VALUES (103,'ANAGHA',70000,'anagha@',0.2,4);
    INSERT INTO EMP  VALUES (104,'SWARA',70000,'swaRa@',0.2,2);
   
-- TRY TO INSERT 2,3  records and try to keep PK & FK VALUES differently .. ( IMP )
-- ( IN EMP TABLE TRY TO KEEP DID VALUES : 100,200,300)
	INSERT INTO EMP  VALUES (105,'NILESH',70000,'nilesh@',0.2,200)	 

-- ANS : IF THE PK FROM PARENT TABLE AND FORIGEN KEY FROM CHILD TABLE HAS DIFFERENT VALUES IT WILL THROWS AN ERROR

---	ORA-02291: integrity constraint (HR.DEPT_EMP_F) violated - parent key not found.


------------- HOMEWORK 3 -------------   

-- A. Can use update statement to change the did to that value which is not present in parent table
  
    UPDATE EMP
    SET DID = 100
    WHERE DID = 4 ;
-- ANS: No. If we try to replace or change the value in fk with that value which is not present in the parent table 
--      then it will throw an Integrity constraint violation error.

----------- HOMEWORK 4 (REVISION TOPICS ) -----------

-- CREATE A VIEW ON EMP.
	CREATE OR REPLACE VIEW EMP_VW
	AS
	SELECT EMPID, ENAME,EMAIL, DID, COMMISSION
	FROM EMP
	WHERE DID = 2;

	SELECT * FROM EMP_VW;
	
	INSERT INTO EMP_VW VALUES (111,'SONU','sonu@',0.5,2);

-- ANS :  CONSTRAINTS GET COPIED TO THE VIEW TABLE.
	

--		 When we create a view which display some columns of base table and try to perform insertion operation
--       so the compiler will put NULL value to columns which are not in view while insertion but if that column 
--       have constraint such as NOT NULL then it will throw an Error

--INSERT INTO EMP_VW VALUES (111,'SONU','sonu@',0.5,2)
--Error report -
--ORA-01400: cannot insert NULL into ("HR"."EMP"."SALARY") 

----------- HOMEWORK 5 (REVISION TOPICS ) -----------


-- Create a backup table which stores DDL along with all data then check whether the constraints which are 
-- applicable on main table are also application to that backup table or not


-- 1. CREATION OF BACKUP TABLE FOR EMP
    
    CREATE TABLE EMP_BKP
    AS
    SELECT * 
    FROM EMP;
    
    SELECT * 
    FROM EMP_BKP;
	
-- ANS : The backup table EMP_BKP only have 'NOT NULL' constraint.
