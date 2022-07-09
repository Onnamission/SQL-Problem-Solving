/*
Q. You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*\

SELECT NAME
FROM STUDENTS
INNER JOIN FRIENDS ON STUDENTS.ID = FRIENDS.ID
INNER JOIN PACKAGES as P1 ON STUDENTS.ID = P1.ID
INNER JOIN PACKAGES as P2 ON FRIENDS.FRIEND_ID = P2.ID
WHERE P2.SALARY > P1.SALARY
ORDER BY P2.SALARY;
