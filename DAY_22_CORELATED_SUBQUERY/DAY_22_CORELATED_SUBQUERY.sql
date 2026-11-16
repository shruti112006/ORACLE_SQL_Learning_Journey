
-- DATE : 03-02-2026
-- TOPIC : CORELATED SUBQUERY (EXISTS & NOT EXISTS OPERATORS)

-- TABLES	
	SELECT * FROM BOOK;
	SELECT * FROM BOOK_ISSUE;
	
-- EXISTS OPERATOR

-- Q.1 WAQD details of book those are issued and return before the due date

    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE B2.BOOK_ID = B1.BOOK_ID
                   AND B2.FINE_AMT = 0);
				   
---------------------------------- EXECUTION -----------------------------------------
--1) BOOK ID = 501 
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(501)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE 501 = 501 --- TRUE
                   AND 100 = 0     --- FALSE
				 );
--- Conditions are FALSE so row will not fetched

-- 2) BOOK ID = 502 
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(502)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  B2.BOOK_ID = 502
                   AND B2.FINE_AMT = 0);
                   
---  There is no record for book id 502 so row will not fetched

-- 3) BOOK ID = 508
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(508)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  508 = 508 --- TRUE
                   AND 0 = 0  --- TRUE
                );

                   
--- Conditions are TRUE so row will get fetched

-- 4) BOOK ID = 504
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(504)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  504 = 504 --- TRUE
                   AND 150 = 0  --- FALSE
                );

-- 5) BOOK ID = 505 
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(505)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  B2.BOOK_ID = 505 
                   AND B2.FINE_AMT = 0 
                );

-- 6) BOOK ID = 506
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(506)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  B2.BOOK_ID = 506
                   AND B2.FINE_AMT = 0 
                );
---  There is no record for book id 505 & 506 so those row will not get fetched
              
-- 7) BOOK ID = 507
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(507)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  507 = 507 --- TRUE
                   AND 80.9 = 0  --- FALSE
                );
  
--- Conditions are FALSE so row will not get fetched

-- 8) BOOK ID = 503
    SELECT * 
    FROM BOOK B1
    WHERE EXISTS ---(503)
                 ( SELECT 1
                   FROM BOOK_ISSUE B2
                   WHERE  503 = 503 --- TRUE
                   AND 0 = 0  --- TRUE
                );

--- Conditions are TRUE so row will get fetched

====================================================================================================
-- NOT EXISTS OPERATOR


-- Q.2 Find members who joined but not issued a book yet
    
    SELECT * 
    FROM MEMBERS M
    WHERE NOT EXISTS (SELECT 1
                       FROM BOOK_ISSUE
                       WHERE MEMBER_ID = M.MEMBER_ID);
					   
------------------------------- EXECUTION -----------------------------------------
-- 1) Member_id = 1 
    SELECT * 
    FROM MEMBERS M 
    WHERE NOT EXISTS --- (1)
					(SELECT 1
                       FROM BOOK_ISSUE
                       WHERE 1 = 1 ---- TRUE
                     );
--- Condition is TRUE so the record will not get fetched as we use NOT EXISTS.

-- 2) Member_id = 3
    SELECT * 
    FROM MEMBERS M 
    WHERE NOT EXISTS --- (3)
					(SELECT 1
                       FROM BOOK_ISSUE
                       WHERE MEMBER_ID = 3 ---- FALSE
                     );
--- Condition is FALSE so the record will  get fetched as we use NOT EXISTS.

-- 3) Member_id = 2
    SELECT * 
    FROM MEMBERS M 
    WHERE NOT EXISTS --- (2)
					(SELECT 1
                       FROM BOOK_ISSUE
                       WHERE MEMBER_ID = 2 ---- FALSE
                     );
--- Condition is FALSE so the record will  get fetched as we use NOT EXISTS.
                       
-- 4) Member_id = 4
    SELECT * 
    FROM MEMBERS M 
    WHERE NOT EXISTS --- (4)
					(SELECT 1
                       FROM BOOK_ISSUE
                       WHERE 4 = 4 ---- TRUE
                     );
                     
--- Condition is TRUE so the record will not get fetched as we use NOT EXISTS.
                       
    
-- 5) Member_id = 5
    SELECT * 
    FROM MEMBERS M 
    WHERE NOT EXISTS --- (5)
                    (SELECT 1
                       FROM BOOK_ISSUE
                       WHERE 5= 5 ---- TRUE
                     );
                     
--- Condition is TRUE so the record will not get fetched as we use NOT EXISTS.
                       
    
                          
    

                       
    