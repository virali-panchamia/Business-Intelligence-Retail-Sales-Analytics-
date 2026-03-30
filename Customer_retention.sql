DELIMITER $$

-- Returns customers who placed at least min_orders and what percent of total customers they represent, using views.
CREATE PROCEDURE customer_retention(
    IN min_orders INT
)
BEGIN
    -- Find retained customers
    SELECT
        c.CustomerID,
        c.FirstName,
        c.LastName,
        COUNT(o.OrderID) AS OrderCount
    FROM customers_view c
    JOIN orders_view o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
    HAVING OrderCount >= min_orders;

    -- Find percentage of retained customers
    SELECT
        ROUND(
            (
                SELECT COUNT(DISTINCT c.CustomerID)
                FROM customers_view c
                JOIN orders_view o ON c.CustomerID = o.CustomerID
                GROUP BY c.CustomerID
                HAVING COUNT(o.OrderID) >= min_orders
            ) / COUNT(*) * 100, 2
        ) AS RetentionPercent
    FROM customers_view;
END$$

DELIMITER ;
