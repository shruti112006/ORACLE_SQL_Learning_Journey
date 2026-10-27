
GROUPBY & HAVING CLAUSE

*Purpose : 

1. GROUP BY CLAUSE :  It groups rows that have the same values in one or more columns into groups, allowing aggregate functions to calculate a result for each group.

    - Groups rows with identical values in the specified column(s).
      
    - Commonly used with aggregate functions such as COUNT(), SUM(), AVG(), MIN(), and MAX().
  
    - Returns one result row per group.

     - You can group by one or multiple columns.

    - GROUP BY does not sort the results automatically.

    - In a grouped query, columns in the SELECT list generally must be grouped columns or used inside aggregate functions.
    

2.  HAVING CLAUSE :  HAVING filters groups created by GROUP BY based on a specified condition, often involving aggregate functions.
    
    - Filters groups, not individual rows.
  
    - Commonly used with aggregate functions such as COUNT(), SUM(), and AVG().

    - Usually used with GROUP BY when filtering aggregated results.

    - Unlike WHERE, it can filter using aggregate conditions such as COUNT(*) > 5.

    - If a query has no GROUP BY, HAVING can still filter the single aggregate group.

    - Multiple conditions can be combined using AND and OR.
