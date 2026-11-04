
SET OPERATORS in SQL (Oracle SQL)

Set Operators are used to combine the results of two or more SELECT statements into a single result set.

- Combines results from multiple SELECT queries.
- Each SELECT statement must return the same number of columns.
- Corresponding columns must have compatible data types.
- Column names in the final output are generally taken from the first SELECT statement.
- ORDER BY can be used to sort the final combined result.
- Set Operators work on result sets, not directly on tables.

Types of SET OPERATORS

Oracle SQL supports four main Set Operators:

1. UNION : UNION combines the results of two or more SELECT statements and removes duplicate records from the final result.

2. UNION ALL : UNION ALL combines the results of two or more SELECT statements and retains all records, including duplicates.

3. INTERSECT : INTERSECT returns only the common records that appear in the results of both SELECT statements.

4. MINUS : MINUS returns records from the first SELECT statement that are not present in the second SELECT statement.
