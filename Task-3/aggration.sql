SELECT department,AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary)>11000;