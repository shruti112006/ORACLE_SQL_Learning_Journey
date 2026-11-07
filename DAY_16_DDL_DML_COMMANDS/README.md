
SQL commands are classified into different categories based on their purpose. Two important categories are DDL (Data Definition Language) and DML (Data Manipulation Language).

1. DDL – Data Definition Language  : DDL commands are used to define, create, modify, and delete the structure of database objects such as tables, views, indexes, and schemas.

    - Deals with the structure of database objects.
    - Used to create, modify, and remove database objects.
    - Does not primarily deal with inserting or modifying table records.
    - DDL commands generally perform implicit commits in Oracle.
    - Changes made through DDL are generally not reversible using ROLLBACK.

* Types of DDL commands

    1. CREATE	-> Creates a new database object.
    2. ALTER ->	Modifies the structure of an existing object.
    3. DROP -> Permanently removes a database object.
    4. TRUNCATE -> Removes all rows from a table while keeping its structure.
    5. RENAME	-> Renames an existing database object.
 
2. DML – Data Manipulation Language : DML commands are used to insert, modify, and delete records stored inside database tables.
    
    - Deals with the data stored in tables.
    - Used to insert new records.
    - Used to update existing records.
    - Used to delete records.
    - DML changes can generally be committed or rolled back in Oracle.
    - Changes remain part of the current transaction until committed or rolled back.
* Types of DML commands
    
    1. INSERT -> Adds new records into a table.
    2. UPDATE	-> Modifies existing records.
    3. DELETE	-> Removes records from a table.
