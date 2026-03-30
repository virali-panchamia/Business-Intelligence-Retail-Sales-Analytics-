CREATE VIEW customers_view AS
SELECT
  TRIM(NULLIF(CustomerID, '')) AS CustomerID,
  TRIM(NULLIF(FirstName, '')) AS FirstName,
  TRIM(NULLIF(LastName, '')) AS LastName,
  UPPER(TRIM(NULLIF(Gender, ''))) AS Gender,
  BirthDate,
  TRIM(NULLIF(City, '')) AS City,
  JoinDate
FROM customers
WHERE CustomerID IS NOT NULL AND CustomerID <> ''
  AND FirstName IS NOT NULL AND FirstName <> ''
  AND LastName IS NOT NULL AND LastName <> '';


CREATE VIEW orderitems_view AS
(
SELECT
    OrderID,
    ProductID,
    Quantity,
    UnitPrice
FROM orderitems
WHERE 
    OrderID IS NOT NULL AND TRIM(OrderID) != '' AND
    ProductID IS NOT NULL AND TRIM(ProductID) != '' AND
    Quantity IS NOT NULL AND TRIM(Quantity) != '' AND
    UnitPrice IS NOT NULL AND TRIM(UnitPrice) != ''
    );
    
    
CREATE VIEW orders_view AS
SELECT
  TRIM(NULLIF(OrderID, '')) AS OrderID,
  OrderDate,
  TRIM(NULLIF(CustomerID, '')) AS CustomerID,
  TRIM(NULLIF(StoreID, '')) AS StoreID,
  Quantity,
  Discount,
  TRIM(NULLIF(PaymentMethod, '')) AS PaymentMethod,
  ROUND(UnitPrice, 2) AS UnitPrice,
  ROUND(TotalAmount, 2) AS TotalAmount
FROM orders
WHERE
  OrderID IS NOT NULL AND OrderID <> ''
  AND CustomerID IS NOT NULL AND CustomerID <> ''
  AND StoreID IS NOT NULL AND StoreID <> ''
  AND Quantity > 0
  AND UnitPrice >= 0
  AND TotalAmount >= 0;
  
CREATE VIEW products_view AS
SELECT
  TRIM(NULLIF(ProductID, '')) AS ProductID,
  TRIM(NULLIF(ProductName, '')) AS ProductName,
  TRIM(NULLIF(Category, '')) AS Category,
  TRIM(NULLIF(SubCategory, '')) AS SubCategory,
  ROUND(UnitPrice, 2) AS UnitPrice,
  ROUND(CostPrice, 2) AS CostPrice
FROM products
WHERE
  ProductID IS NOT NULL AND ProductID <> ''
  AND ProductName IS NOT NULL AND ProductName <> ''
  AND UnitPrice >= 0
  AND CostPrice >= 0;
  

  
CREATE OR REPLACE VIEW stores_view AS
SELECT
  TRIM(NULLIF(StoreID, '')) AS StoreID,
  TRIM(NULLIF(StoreName, '')) AS StoreName,
  TRIM(NULLIF(City, '')) AS City,
  TRIM(NULLIF(Region, '')) AS Region
FROM stores
WHERE
  StoreID IS NOT NULL AND StoreID <> ''
  AND StoreName IS NOT NULL AND StoreName <> ''
  AND City IS NOT NULL AND City <> ''
  AND Region IS NOT NULL AND Region <> '';


  


