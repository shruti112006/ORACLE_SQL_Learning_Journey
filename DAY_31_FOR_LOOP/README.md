
FOR LOOP in PL/SQL
 - A FOR LOOP is an iterative control statement in PL/SQL that is used to execute a block of statements repeatedly for a specified number of iterations.
 - FOR LOOP is used when we already know how many times we want to execute a statement.

* Syntax of FOR LOOP
  
BEGIN

  FOR counter IN lower_limit..upper_limit
    
  LOOP
       
   statements;
    
  END LOOP;

END;

* Explanation:
  
- FOR: Starts the FOR LOOP.
- counter: Automatically declared loop variable.
- IN: Specifies the range.
- lower_limit: Starting value.
- upper_limit: Ending value.
- LOOP: Starts the loop body.
- END LOOP: Terminates the loop.

REVERSE in FOR LOOP : The REVERSE keyword is used when you want to execute the loop in descending order.

- The loop variable is automatically declared.

- You don't need to declare the counter in the DECLARE section.

- The loop variable is automatically incremented by 1.

- The loop variable is local to the loop and cannot be modified manually.

- The FOR LOOP automatically terminates after completing the specified range.

- REVERSE is used for descending order.

- You cannot change the loop counter manually.
