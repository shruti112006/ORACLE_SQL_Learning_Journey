

OUTER JOIN :  An OUTER JOIN is used to combine data from two or more tables and returns matching rows along with non-matching rows from one or both tables.

- Returns matching as well as non-matching records.
- Unlike INNER JOIN, it does not discard all unmatched records.
- Missing values from the other table are represented as NULL.
- There are three types of OUTER JOIN:
  1. LEFT OUTER JOIN
  2. RIGHT OUTER JOIN
  3. FULL OUTER JOIN

  * LEFT JOIN returns all records from the left table and matching records from the right table.
     If there is no match, NULL values are returned for the right table's columns.

  * RIGHT JOIN returns all records from the right table and matching records from the left table.
     If there is no match, NULL values are returned for the left table's columns.

  * FULL OUTER JOIN returns all records from both tables, including matching and non-matching records. Non-matching columns are filled with NULL values.
  
