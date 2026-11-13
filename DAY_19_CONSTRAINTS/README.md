
Constraints in Oracle SQL
Constraints are rules applied to table columns or tables to maintain the accuracy, validity and integrity of data in a database.

* Types of Constraints in Oracle SQL
Oracle SQL has five commonly used constraints:

1. NOT NULL -> The NOT NULL constraint ensures that a column cannot contain NULL values.

2. UNIQUE -> The UNIQUE constraint ensures that values in a column, or a combination of columns, are unique.

3. PRIMARY KEY  -> A PRIMARY KEY uniquely identifies every record in a table.

      It combines two properties:
      - UNIQUE: Duplicate values are not allowed.
      - NOT NULL: NULL values are not allowed.
        
4. FOREIGN KEY -> A FOREIGN KEY establishes a relationship between two tables.
                 -It ensures that a value in the child table refers to an existing key value in the parent table.

5. CHECK  -> The CHECK constraint ensures that values satisfy a specified condition.
