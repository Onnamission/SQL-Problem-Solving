/*
Q. Find the employees whose salary is more than the average salary earned by all employees.

*subquery is not dependent on outer query.
*/

-- Method 1

SELECT "emp_name"
FROM "Employee"
WHERE "salary" > (SELECT AVG("salary") FROM "Employee");

-- Method 2

SELECT *
FROM "Employee" AS E
INNER JOIN (SELECT AVG("salary") AS "avg_salary" FROM "Employee") AS avg_sal
ON E."salary" > avg_sal."avg_salary";
