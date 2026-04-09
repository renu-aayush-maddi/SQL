SELECT name,department,salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM Employees;

SELECT name,department,salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM Employees;

SELECT name,salary,
       LAG(salary) OVER (ORDER BY salary) AS prevs,
       LEAD(salary) OVER (ORDER BY salary) AS nexts
FROM Employees;