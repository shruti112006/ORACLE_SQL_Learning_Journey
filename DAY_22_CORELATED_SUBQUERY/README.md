

Correlated Subquery in Oracle SQL

- A Correlated Subquery is a subquery that depends on the outer query for its values.

- The inner query is logically evaluated for each row processed by the outer query, although Oracle's optimizer may transform the execution for better performance.

- EXISTS and NOT EXISTS: Frequently used with correlated subqueries to check whether matching records exist or do not exist.
    
    1. EXISTS Operator : The EXISTS operator checks whether at least one matching record exists in the subquery.
 
    2. NOT EXISTS Operator : The NOT EXISTS operator checks whether the subquery returns zero rows.

- Aggregate Functions: Can be used with AVG(), MAX(), MIN(), COUNT() and other aggregate functions.

- SQL Statements: Correlated subqueries can be used with SELECT, UPDATE and DELETE.
