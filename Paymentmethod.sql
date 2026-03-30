DELIMITER $$

-- Returns payment method and its percentage distribution for the region with highest total sales, using views.
CREATE PROCEDURE payment_distribution_top_region()
BEGIN
    -- Find top region by revenue
    SELECT s.Region, SUM(o.TotalAmount) AS Revenue
    INTO @top_region, @max_revenue
    FROM orders_view o
    JOIN stores_view s ON o.StoreID = s.StoreID
    GROUP BY s.Region
    ORDER BY Revenue DESC
    LIMIT 1;

    -- Payment method breakdown in the top region
    SELECT
        o.PaymentMethod,
        COUNT(*) AS NumOrders,
        SUM(o.TotalAmount) AS TotalSales,
        ROUND(SUM(o.TotalAmount) / @max_revenue * 100, 2) AS PercentRevenue
    FROM orders_view o
    JOIN stores_view s ON o.StoreID = s.StoreID
    WHERE s.Region = @top_region
    GROUP BY o.PaymentMethod;
END$$

DELIMITER ;
