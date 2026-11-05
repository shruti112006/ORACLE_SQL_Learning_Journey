CASE and DECODE in Oracle SQL

Both CASE and DECODE are used to implement conditional logic in SQL. They allow you to return different results based on specified conditions.

1. CASE Statement : CASE is a conditional expression in SQL that evaluates specified conditions and returns a result based on the first condition that is satisfied.

- Used to implement IF-THEN-ELSE logic in SQL.

- Evaluates conditions one by one.

- Returns the result corresponding to the first matching condition.

- Supports multiple conditions using WHEN.

- Supports comparison operators such as =, >, <, >=, <=.

- Supports logical operators such as AND and OR.

- Can be used with SELECT, WHERE, ORDER BY, and other SQL clauses.

- If no condition matches, the ELSE result is returned.

- If ELSE is not specified and no condition matches, it returns NULL.


2. DECODE Function : DECODE() is an Oracle SQL function that compares an expression with specified search values and returns the corresponding result when a match is found.

- Primarily used for conditional comparisons in Oracle SQL.

- Compares one expression against multiple search values.

- Returns the corresponding result when a match is found.

- Supports multiple search-result pairs.

- Uses equality-based comparisons rather than range conditions.

- Supports a default value if no match is found.

- If no default value is specified, it returns NULL when no match is found.

- Can compare NULL values with NULL search values, unlike ordinary = comparisons.
