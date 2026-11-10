
TCL (Transaction Control Language) in Oracle SQL
     - TCL stands for Transaction Control Language. It is a category of SQL commands used to manage transactions in a database.
     - A transaction is a logical unit of work consisting of one or more SQL statements. 
     - TCL commands help you save or undo changes made by DML statements.

* Types of TCL commands : Oracle SQL primarily uses two TCL commands:

    - COMMIT

    - ROLLBACK

1. COMMIT : COMMIT permanently saves the changes made during the current transaction.

2. ROLLBACK : ROLLBACK undoes changes made during the current transaction that have not yet been committed.

3. SAVEPOINT : The SAVEPOINT is not a command it the keyword used along with the ROLLBACK command.
               It creates a named point within a transaction. You can roll back to that point without undoing the entire transaction
