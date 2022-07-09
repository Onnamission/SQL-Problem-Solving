/*
Q. We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*\

select months*salary, count(*) from employee
group by months*salary
order by months*salary desc
limit 1;

SELECT 
	MONTHS * SALARY, COUNT(*)
FROM 
	EMPLOYEE
GROUP BY 
	MONTHS * SALARY
ORDER BY
	MONTH * SALARY DESC
LIMIT 1;
