ALTER TABLE Orders ADD COLUMN order_date DATE;

UPDATE Orders SET order_date = CURRENT_DATE - INTERVAL '10 days' WHERE order_id = 1;
UPDATE Orders SET order_date = CURRENT_DATE - INTERVAL '20 days' WHERE order_id = 2;

SELECT order_id,CURRENT_DATE - order_date AS days_diff
FROM Orders;

SELECT * FROM Orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';