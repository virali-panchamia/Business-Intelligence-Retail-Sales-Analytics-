DELIMITER $$

-- Returns total and average sales by product category and by region using views within a date range.
CREATE PROCEDURE sales_by_category_region
(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    -- By product category
    SELECT
        p.Category,
        SUM(oi.Quantity * oi.UnitPrice) AS TotalSales,
        AVG(oi.Quantity * oi.UnitPrice) AS AvgSales
    FROM orderitems_view oi
    JOIN products_view p ON oi.ProductID = p.ProductID
    JOIN orders_view o ON oi.OrderID = o.OrderID
    WHERE o.OrderDate BETWEEN start_date AND end_date
    GROUP BY p.Category;

    -- By region
    SELECT
        s.Region,
        SUM(oi.Quantity * oi.UnitPrice) AS TotalSales,
        AVG(oi.Quantity * oi.UnitPrice) AS AvgSales
    FROM orderitems_view oi
    JOIN orders_view o ON oi.OrderID = o.OrderID
    JOIN stores_view s ON o.StoreID = s.StoreID
    WHERE o.OrderDate BETWEEN start_date AND end_date
    GROUP BY s.Region;
END$$

DELIMITER ;
