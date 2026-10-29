
JOINS  : A JOIN is used to combine data from two or more tables based on a related column between them.

- Combines related data from multiple tables.
- Usually uses a common column, such as a primary key and a foreign key.
- Helps retrieve related information without storing all data in one table.
- SQL supports different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN


  * INNER JOIN returns only the rows that have matching values in both tables based on the specified join condition.

    - INNER JOIN is not limited to primary key–foreign key relationships; you can join using other appropriate conditions.

    - If multiple rows match, the result can contain multiple rows for the same employee.

    - NULL does not match another NULL using the ordinary equality condition =.
