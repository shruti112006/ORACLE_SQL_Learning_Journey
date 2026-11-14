
-- DATE : 31-01-2026
-- TOPIC : SEQUENCE


---------- HOMEWORK 1 ----------

	CREATE SEQUENCE SEQ_01
	INCREMENT BY 1
	START WITH 0
	MAXVALUE 10
	MINVALUE 0
	CYCLE 
	NOCACHE
	
	SELECT SEQ_01.CURRVAL FROM DUAL  ;   
				---ORA-08002: sequence SEQ_01.CURRVAL is not yet defined in this session
				---08002. 00000 -  "sequence %s.CURRVAL is not yet defined in this session"
				---*Cause:    sequence CURRVAL has been selected before sequence NEXTVAL
				---*Action:   select NEXTVAL from the sequence before selecting CURRVAL
	SELECT SEQ_01.NEXTVAL FROM DUAL; -- FIRST VAL : 0
	
	SELECT SEQ_01.CURRVAL FROM DUAL ; -- 0

---------- HOMEWORK 2 ----------	
	
	CREATE SEQUENCE SEQ_02
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 5
    MINVALUE 0
    CYCLE 
    NOCACHE;
    
    SELECT SEQ_02.NEXTVAL FROM DUAL ; --- FIRST VAL : 1
	
		--- AFTER IT REACHES THE MAXVALUE THEN IT RESET TO THE MINVALUE NOT THE START WITH VALUE
   
----- HOMEWORK 3 ------

    CREATE SEQUENCE SEQ_03
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 5
    MINVALUE 0
    NOCYCLE 
    NOCACHE;
    
    SELECT SEQ_03.NEXTVAL FROM DUAL ; -- First value : 1  
    
		--- AFTER IT REACHES TO MAXVALUE THEN IT THROWS AS ERROR OF 'LIMIT EXCEEDS'
		---	BECAUSE IN SEQUENCE IT MENTIONED AS 'NOCYCLE'
		
					---ORA-08004: sequence SEQ_03.NEXTVAL exceeds MAXVALUE and cannot be instantiated
					---08004. 00000 -  "sequence %s.NEXTVAL %s %sVALUE and cannot be instantiated"
					---*Cause:    instantiating NEXTVAL would violate one of MAX/MINVALUE
					---*Action:   alter the sequence so that a new value can be requested
					
	SELECT SEQ_03.CURRVAL FROM DUAL ; --- LAST VALUE : 5
	

----- HOMEWORK 4 ------

    CREATE SEQUENCE SEQ_04
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 15
    MINVALUE 10
    NOCYCLE 
    NOCACHE;

	SELECT SEQ_04.CURRVAL FROM DUAL ;

		--- START VALUE MUST BE IN BETWEEN THE RANGE MINVALUE AND MAXVALUE 
		
----- HOMEWORK 5 ------
	











