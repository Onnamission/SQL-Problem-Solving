/*
Q. Delete all employees who do not have any department.
*/

DELETE FROM "Department" 
WHERE "dept_name" IN (SELECT "dept_name"
                      FROM "Department"
                      WHERE "dept_name" NOT IN (SELECT "dept_name" FROM "Employee"));
                      
SELECT * FROM "Department";
