
-- DATE : 22-01-2026
-- TOPICS : DDL (ALTER, DROP, TRUNCATE), TCL (COMMIT, ROLLBACK) COMMANDS 

-- 1. Add an 'Address' column in student table
    ALTER TABLE STUDENTS
    ADD ADDRESS VARCHAR2(22);
    
-- 2. Change the values of address to PUNE for all students except piyush because he lived in Nagpur
    UPDATE STUDENTS
    SET ADDRESS = CASE  
                        WHEN STUD_ID IN (SELECT STUD_ID
                                        FROM STUDENTS
                                        WHERE INITCAP(STUD_NAME) = 'Piyush')  THEN 'NAGPUR'
                        ELSE 'PUNE'
                  END;

-- 3. change the name of column academic year to A_year

    ALTER TABLE STUDENTS
    RENAME COLUMN ACADEMIC_YEAR TO A_YEAR ;  
	
-- 4. Modify the size of column stud_id to number(3)
    ALTER TABLE STUDENTS
    MODIFY STUD_ID NUMBER (3);
   
-- 5. can we reduce the size of column after inserting values in it
    ALTER TABLE STUDENTS
    MODIFY STUD_NAME VARCHAR2(9) ;
     
-- 6. Change the size of column A_year to number (3) and see whether it is possible or not? 
    ALTER TABLE STUDENTS
    MODIFY A_YEAR NUMBER(3);   -- Yes we can alter the size if the existing values stored 
							   --are smaller than the new altered value
    
    DESC STUDENTS;

-- 7. Add table fees to students table
    ALTER TABLE STUDENTS
    ADD FEES NUMBER (6,2);
    
-- 8. Delete the column fees from students
    ALTER TABLE STUDENTS
    DROP COLUMN FEE;
    
-- 9. Add table fees to students table with p = 8 and s=2
    ALTER TABLE STUDENTS
    ADD FEES NUMBER (8,2);
	
-- 10.Update the values in column fees according to the branch
--   comp = 96000.50 , entc = 56042.3 , it = 70000, mech = 32510.4 
    UPDATE STUDENTS
    SET FEES = DECODE(LOWER(BRANCH),'comp', 96000.5 ,
                                    'entc', 56042.3 , 
                                    'it' ,70000, 
                                    'mech' ,32510.4 );
									
-- 11. Delete table stu_bkp1 and BKP_1 from the database
    DROP TABLE STU_BKP1;
    DROP TABLE BKP_1;

-- 12. Delete all the records in table Movie_details
    TRUNCATE TABLE MOVIE_DETAILS;

-- 13. Delete the table MOVIE_DETAILS from the database
    DROP TABLE MOVIE_DETAILS;
    
-- 14. Delete all the records in the backup table of Students i.e stu_bkp 
--   After that drop it 

    TRUNCATE TABLE STU_BKP;
    DROP TABLE STU_BKP;

-- 15. change column name captain_id to cap_id
	
	ALTER TABLE CRICKET
	RENAME COLUMN CAPTAIN_ID TO CAP_ID;

-- 16. rename without using alter command
	RENAME CRICKET TO CRICKET_DETAILS;
	
-- 17. Add column college_add to COURSE TABLE

    ALTER TABLE COURSE
    ADD COLLEGE_ADD VARCHAR2(10);

-- 18. update column values as WARJE in column college_add  

    UPDATE COURSE
    SET COLLEGE_ADD = DECODE(COLLEGE_ADD, NULL,'WARJE') ;
-- 19. HOMEWORK 1
	CREATE TABLE CRICKET
	(
	PLAYER_ID NUMBER(3),
	PLAYER_NAME  VARCHAR2(20),
	CAPTAIN NUMBER(3),
	TEAM VARCHAR2(20)
	);


	SELECT * FROM CRICKET;


	INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
				 VALUES(1, 'ROHIT', NULL, 'MI');
	INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
				 VALUES(2, 'KOHLI', 1, 'RCB');
	INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
				 VALUES(3, 'DHONI', NULL, 'CSK');
				 
	UPDATE CRICKET
	SET CAPTAIN = 4;

	DELETE FROM CRICKET;

	ROLLBACK;

-- 20. HW2


INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(1, 'ROHIT', NULL, 'MI');
INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(2, 'KOHLI', 1, 'RCB');
        
SAVEPOINT S1;

INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(3, 'DHONI', NULL, 'CSK');
             
    UPDATE CRICKET
    SET CAPTAIN = 4;
ROLLBACK TO SAVEPOINT S1;

DELETE FROM CRICKET;

-------. HW3

INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(1, 'ROHIT', NULL, 'MI');
INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(2, 'KOHLI', 1, 'RCB');
        
SAVEPOINT S1;

INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(3, 'DHONI', NULL, 'CSK');
SAVEPOINT S2;

UPDATE CRICKET
SET CAPTAIN = 4;

COMMIT;

DELETE FROM CRICKET;

ROLLBACK TO SAVEPOINT S2;
										
-------- HW4
INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(1, 'ROHIT', NULL, 'MI');
INSERT INTO CRICKET(PLAYER_ID, PLAYER_NAME, CAPTAIN, TEAM)
             VALUES(2, 'KOHLI', 1, 'RCB');
        
SAVEPOINT S1;

ALTER TABLE CRICKET
RENAME COLUMN CAPTAIN TO CAPTAIN_ID;

ROLLBACK TO SAVEPOINT S1;
