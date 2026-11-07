
-- DATE : 21-01-2026
-- TOPICS : DDL (CREATE), DML (INSERT, UPDATE, DELETE)

-- 1. WAQ to create a STUDENT table
	CREATE TABLE STUDENTS(
		STUD_ID NUMBER(2),
		STUD_NAME VARCHAR2(20),
		DOB DATE,
		PHONENUMBER NUMBER(10),
		EMAIL VARCHAR2(25),
		BRANCH VARCHAR2(5),
		ACADEMIC_YEAR NUMBER(4),
		GRADE CHAR
		);
    
-- 2. WAQ to insert 2 records in the table 
	INSERT INTO STUDENTS VALUES (1,'SHRUTI','11-03-2026',7498365478,'sshete@', 'comp', 2025, 'A');

	INSERT INTO STUDENTS VALUES (2,'MRUNAL','01-12-97',1457865478,'mjadhav@', 'entc', 2000, 'O');
	
-- 3.WAQ to insert 3 records in table using different syntax 
	INSERT  INTO STUDENTS (STUD_ID,STUD_NAME,DOB,PHONENUMBER,EMAIL)
			VALUES (3, 'SAGAR','14-08-96',3564789456,'sadli@');
			
	INSERT INTO STUDENTS (STUD_ID, STUD_NAME, BRANCH, DOB, ACADEMIC_YEAR, PHONENUMBER, GRADE, EMAIL)
			VALUES (4,'HARSH','entc','03-08-2005',2024,9564875123,'B','hkhapra@');
			
	INSERT INTO STUDENTS VALUES (5,'PIYUSH','23-08-99',1245789451,'pbhat@','IT',2023,'A');
        
    
-- 4. WAQ to update the details of students whose id is 5 and name is PEEU
    UPDATE STUDENTS
    SET STUD_NAME = 'PEEU', BRANCH = 'CIVIL', STUD_ID = 6
    WHERE DOB = '16-04-04';

-- 5. WAQ to update the details of student belong to mechanical department change the student id to '7'
-- and phone number to 9487894546

    UPDATE STUDENTS
    SET STUD_ID = 7 , PHONENUMBER = 9487894546
    WHERE BRANCH = 'MECH';

-- 6.WAQ to update the grade of STUDID 8 to A
    UPDATE STUDENTS
    SET GRADE = 'A'
    WHERE STUD_ID = 8;
	
-- 7.WAQ to delete the record of student having id 6
    DELETE FROM STUDENTS
    WHERE STUD_ID = 6;
   
-- 8. WAQD total students per branch
    SELECT BRANCH , COUNT(STUD_ID) AS TOTAL_STUD
    FROM STUDENTS
    WHERE BRANCH IS NOT NULL
    GROUP BY BRANCH;
	
-- 9. WAQ to create a backup table for students
    CREATE TABLE STU_BKP1
    AS SELECT * 
    FROM STUDENTS;

-- 10. WAQ to copy structure of table students as a backup
    CREATE TABLE STU_BKP1
    AS SELECT * 
    FROM STUDENTS
    WHERE NULL=NULL;
    
    SELECT * FROM STU_BKP1;
	
-- 11. WAQ to change the DOB of student whose name is SHRUTI to 11-03-06
	UPDATE STUDENTS
	SET DOB = '11-03-06'
	WHERE STUD_NAME = 'SHRUTI';
    
-- 12.WAQ to update stud id using DECODE
	UPDATE STUDENTS
	SET STUD_ID = DECODE (STUD_ID ,1,11,
									2,12,
									3,13,
									4,14,
									5,15,
									7,17);

-- 13. WAQ to change the values of null to 'no data' 
 
    SELECT  STUD_ID, STUD_NAME,PHONENUMBER, NVL(BRANCH, 'NO DATA') AS BRANCH, 
            NVL(TO_CHAR(ACADEMIC_YEAR), 'NO DATA') AS ACAD_YEAR, 
            NVL(GRADE, 'NO') AS GRADE
    FROM STUDENTS;
	
-- 14. WAQ TO CREATE COURSE TABLE 

	CREATE TABLE COURSE (
		COURSE_ID NUMBER(3),
		COURSE_NAME VARCHAR2(50),
		DURATION_MONTHS NUMBER(10),
		FEES NUMBER(6)
	);
	SELECT * FROM COURSE;
	
-- 15. WAQ TO INSERT VALUES INTO COURSE

	INSERT INTO COURSE VALUES (201, 'Java Full Stack', 6, 45000);

	INSERT INTO COURSE VALUES (202, 'Data Science', 8, 65000);

	INSERT INTO COURSE VALUES (203, 'Python Full Stack', 6, 50000);

	INSERT INTO COURSE VALUES (205, 'DevOps Engineer', 8, 70000);

	INSERT INTO COURSE VALUES (205, 'AI Engineer', 8, 80000);

	INSERT INTO COURSE VALUES (206, NULL, 8, 70000);

-- 16. WAQ TO UPDATE NULL VALUE AS BUISINESS ANALYST

	UPDATE COURSE
	SET COURSE_NAME = 'BUISINESS ANALYST'
	WHERE COURSE_ID = 206;

-- 17. WAQ TO UPDATE COURSE NAME TO FULL STACK WHOSE FEES IS EQUAL TO MINIMUM FEES OF ALL COURSES
	UPDATE COURSE
	SET COURSE_NAME = 'Full Stack'
	WHERE FEES = (  SELECT MIN(FEES)
					FROM COURSE 
                 );

-- 18. WAQ TO UPDATE COURSE NAME TO DEVOPS ENGINEER WHOSE FEES IS SIMILAR TO COURSE ID 206

	UPDATE COURSE
	SET COURSE_NAME = 'DevOps Engg'
	WHERE FEES = (SELECT FEES
					FROM COURSE
					WHERE COURSE_ID = 206)
    AND COURSE_ID = 206;

-- 19. WAQ TO DELETE THE COURSES WHOSE SALARY GREATER THAN SALARY OF COURSE ID 201
    
    DELETE FROM COURSE
    WHERE FEES > (SELECT FEES
                    FROM COURSE
                    WHERE COURSE_ID = 201);
                    
-- 20. CREATE A BACKUP TABLE FOR COURSES         
	CREATE TABLE BKP_1 AS
	SELECT * FROM COURSE
	WHERE 1=4;       