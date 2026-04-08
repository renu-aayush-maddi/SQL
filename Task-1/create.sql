CREATE TABLE Employees(
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees(name,department,salary) VALUES
('Aayush','IT',60000),
('Ravi','Sales',45000),
('Neha','HR',50000);

SELECT * FROM Employees;