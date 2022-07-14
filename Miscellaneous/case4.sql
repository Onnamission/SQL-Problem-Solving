/*
Q. Find the employees in each department who earn more than the average salary in that department.
*/

SELECT "emp_name"
FROM "Employee" as e1
WHERE "salary" > (SELECT AVG("salary")
                 FROM "Employee" AS e2
                 WHERE e2."dept_name" = e1."dept_name")
GROUP BY e1."emp_name";
