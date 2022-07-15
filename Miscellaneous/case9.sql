/*
Q. Give 10% increment to all employees in Bangalore location based on the maximum salary earned by an employee in each department. 
Use employee_history.
*/

WITH max_sal AS (SELECT "dept_name", MAX("salary") AS "maxsal"
                 FROM "employee_history"
                 GROUP BY "dept_name")
UPDATE "employee_history" AS e
SET "salary" = (SELECT maxsal + (0.1 * maxsal)
               FROM max_sal
               WHERE e."dept_name" = max_sal."dept_name")
WHERE e."location" = 'Banglore';
