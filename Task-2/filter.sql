SELECT * FROM Employees
WHERE department ='IT'
ORDER BY salary DESC;

SELECT * FROM Employees
WHERE salary>50000 AND department ='IT';

SELECT * FROM Employees
WHERE salary>50000 OR department ='IT';
