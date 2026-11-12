
VIEWS

 - A VIEW in SQL is a virtual table created using a SQL query. It displays data from one or more existing tables without normally storing a separate copy of that data.

 - A view stores the SQL query definition, not the actual table data.
 - 
* Types of Views
     - There are two commonly discussed types of views in Oracle SQL.
       
    A. Simple View :  A simple view is created using a single base table and generally does not contain grouping functions or complex operations.
  
    B. Complex View : A complex view is created using multiple tables or features such as joins, aggregate functions or GROUP BY.


  * WITH CHECK OPTION  : Ensures that INSERT or UPDATE operations performed through a view satisfy the view's WHERE condition.
 
*NOTE :
  - A view is a virtual table based on a SQL query.
    
  - A normal view stores the query definition, not a separate copy of the underlying data.
    
  - Changes to underlying table data are reflected when the view is queried again.
