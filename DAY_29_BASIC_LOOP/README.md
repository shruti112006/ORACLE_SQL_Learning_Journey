
A Basic LOOP (also called a Simple LOOP) is an iterative control statement in PL/SQL that executes a block of statements repeatedly until an EXIT condition is satisfied.
A Basic LOOP always executes at least once because its condition is checked inside the loop.

SYNTAX :
LOOP

   statements;

   EXIT WHEN condition;
   
END LOOP;


- LOOP: Starts the loop.

- statements: Contains the statements to be executed repeatedly.

- EXIT WHEN: Terminates the loop when the condition becomes TRUE.

- END LOOP: Marks the end of the loop.

* Important Points
  1. Basic LOOP is an iterative control statement.

  2. It executes statements repeatedly.

  3. It executes at least once.

  4. It does not have a condition in its opening statement.

  5. EXIT and EXIT WHEN are used to terminate the loop.

  6. If no EXIT condition is provided, it can become an infinite loop.

  7. Every Basic LOOP must end with END LOOP.
