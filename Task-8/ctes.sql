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
(1,'CEO',NULL),
(2,'Manager1',1),
(3,'Manager2',1),
(4,'Emp1',2),
(5,'Emp2',2);


WITH RECURSIVE org_chart AS (
    SELECT emp_id,name,manager_id,1 AS level
    FROM Org
    WHERE manager_id IS NULL

    UNION ALL

    SELECT o.emp_id,o.name,o.manager_id,oc.level+1
    FROM Org o
    JOIN org_chart oc ON o.manager_id = oc.emp_id
)
SELECT * FROM org_chart;
