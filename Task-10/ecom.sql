--Schema
CREATE TABLE Customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Products(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    stock INT
);

CREATE TABLE Orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    order_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE OrderDetails(
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT,
    PRIMARY KEY (order_id,product_id)
);

--Data Insertion
INSERT INTO Customers (name) VALUES ('Aayush'),('Ravi');
INSERT INTO Products (name,price,stock) VALUES('Laptop',50000,10),('Phone',20000,20);
INSERT INTO Orders (customer_id) VALUES (1),(2);
INSERT INTO OrderDetails VALUES(1,1,1),(1,2,2),(2,2,1);

-- Indexing
CREATE INDEX idx ON Orders(customer_id);

-- Trigger
CREATE OR REPLACE FUNCTION reduce_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Products
    SET stock = stock-NEW.quantity
    WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER stock_trigger
AFTER INSERT ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION reduce_stock();

INSERT INTO OrderDetails VALUES (2,1,1);
SELECT * FROM Products;

--Transaction
BEGIN;

INSERT INTO Orders (customer_id) VALUES (1);
INSERT INTO OrderDetails (order_id,product_id,quantity) VALUES (1,1,2);

COMMIT;

--views

CREATE VIEW order_summary AS
SELECT o.order_id,c.name,p.price * od.quantity AS total
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;

SELECT * FROM order_summary;