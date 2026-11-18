
Analytical Functions in Oracle SQL
Analytical functions (also called Window Functions) perform calculations across a group of related rows while keeping individual rows in the output.

Unlike aggregate functions, analytical functions do not collapse multiple rows into a single row.

They use the OVER() clause to define the window of rows over which calculations are performed.

* Common Analytical Functions

  1. ROW_NUMBER() ->	Assigns a unique sequential number to each row
  
  2. RANK()	-> Assigns ranks, leaving gaps after ties
  
  3. DENSE_RANK()	-> Assigns ranks without gaps
  
  4. NTILE() ->	Divides rows into a specified number of groups

  5. LAG() ->	Accesses a value from a previous row
  
  6. LEAD() ->	Accesses a value from a following row

  7. SUM() OVER() ->	Calculates a running or window-based sum

  8. AVG() OVER() ->	Calculates an average over a window

* SYNTAX :
  
SELECT
    column_name,
    analytical_function() OVER (
        PARTITION BY column_name
        ORDER BY column_name
    )
FROM table_name;

- OVER() defines the analytical window.
  
- PARTITION BY divides rows into groups.

- ORDER BY determines the order of rows within the window.

  
