
--Function

CREATE OR REPLACE FUNCTION get_bonus(salary INT)
RETURNS INT AS $$
BEGIN
    RETURN salary * 0.10;
END;
$$ LANGUAGE plpgsql;

SELECT name,salary,get_bonus(salary) AS bonus
FROM Employees;


--Stored Procedure


CREATE OR REPLACE PROCEDURE get_sales(IN start_date DATE,IN end_date DATE)
AS $$
BEGIN
    SELECT SUM(amount)
    FROM Orders
    WHERE order_date BETWEEN start_date AND end_date;
END;
$$ LANGUAGE plpgsql;