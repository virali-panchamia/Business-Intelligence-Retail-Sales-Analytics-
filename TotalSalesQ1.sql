-- sales_summaryDELIMITER $$

-- Returns total and average sales grouped by day, month, and year from orders_view in the given date range.
CREATE PROCEDURE sales_summary(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    -- Daily sales totals and averages
    SELECT
        DATE(OrderDate) AS SaleDay,
        SUM(TotalAmount) AS TotalSales,
        AVG(TotalAmount) AS AvgSales
    FROM orders_view
    WHERE OrderDate BETWEEN start_date AND end_date
    GROUP BY SaleDay;

    -- Monthly sales totals and averages
    SELECT
        DATE_FORMAT(OrderDate, '%Y-%m') AS SaleMonth,
        SUM(TotalAmount) AS TotalSales,
        AVG(TotalAmount) AS AvgSales
    FROM orders_view
    WHERE OrderDate BETWEEN start_date AND end_date
    GROUP BY SaleMonth;

    -- Yearly sales totals and averages
    SELECT
        YEAR(OrderDate) AS SaleYear,
        SUM(TotalAmount) AS TotalSales,
        AVG(TotalAmount) AS AvgSales
    FROM orders_view
    WHERE OrderDate BETWEEN start_date AND end_date
    GROUP BY SaleYear;
END$$

DELIMITER ;
