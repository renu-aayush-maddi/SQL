-- non recursive

WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_sal
    FROM Employees
    GROUP BY department
)
SELECT * FROM dept_avg;

-- recursive
CREATE TABLE Org (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO Org VALUES
(1,'CEO',23),
(2,'Manager',34);   

