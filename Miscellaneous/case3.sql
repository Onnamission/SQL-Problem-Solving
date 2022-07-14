/*
Q. Find the department who do not have any employees
*/

SELECT DISTINCT("dept_name")
FROM "Department"
WHERE "dept_name" NOT IN (SELECT DISTINCT("dept_name") FROM "Employee");
