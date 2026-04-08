CREATE TABLE Customers(customer_id INT PRIMARY KEY,name VARCHAR(50));
CREATE TABLE Orders (order_id INT PRIMARY KEY,customer_id INT REFERENCES Customers(customer_id),amount INT);

INSERT INTO Customers (name) VALUES
('Aayush'),('Ravi'),('Neha');

INSERT INTO Orders (customer_id, amount) VALUES
(1,2000),(1,1500),(2,3000);

SELECT Customers.name,Orders.amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

SELECT Customers.name,Orders.amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;