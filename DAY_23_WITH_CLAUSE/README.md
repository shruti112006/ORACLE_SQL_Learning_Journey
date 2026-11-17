
WITH Clause in Oracle SQL (CTE – Common Table Expression)
The WITH clause in Oracle SQL is used to define a temporary named query result that can be referenced within the main SQL statement.

It is also known as a CTE (Common Table Expression).

The WITH clause helps you:
- Break complex queries into smaller sections.
- Improve query readability.
- Reuse a named query result within the main statement.
- Avoid repeating the same query logic.

* SYNTAX :
  WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
  )
  SELECT *
  FROM cte_name;
