SELECT name,salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);


SELECT name,department,salary
FROM Employees e1
WHERE salary >(
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e1.department = e2.department
);

SELECT name,salary,(SELECT AVG(salary) FROM Employees) AS avg_salary
FROM Employees;