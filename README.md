# Business-Intelligence-Retail-Sales-Analytics-
Retail Sales Dataset provided by Buharishehu (2024) as the basis for analysis. The dataset contains transactional and master data typical of a retail business. The data appears to cover Customer, Product, Store, and Order information, allowing for detailed analysis of sales performance, customer behavior, and product popularity.
The Database is named RetailDB and five primary tables, such as customers, orderitems, orders, products, and stores, along with five cleaner views. Strategically developed five dedicated views, customers_view, orders_view, products_view, stores_view, and orderitems_view to enforce data quality and standardization before any analytical reporting takes place. 
The SQL script strategically employs five dedicated views: customers_view, orders_view, products_view, stores_view, and orderitems_view to enforce data quality and standardization before any analytical reporting takes place. This approach ensures that all subsequent queries and stored procedures operate on clean, reliable data.
Handling Missing and Messy String Data
To ensure consistency and prevent errors caused by inconsistent string inputs, the views apply two critical functions: TRIM and NULLIF.
•	The TRIM () function removes any extraneous leading or trailing spaces from string columns, for instance CustomerID, City, and ProductName. This prevents identical entries from being treated as distinct values due to hidden whitespace.
•	The expression NULLIF (column_name, '') explicitly converts any field that contains an empty string (') into a standard SQL NULL value. This is a crucial step because treating empty strings as NULL simplifies filtering and ensures data consistency across the database. Any resulting NULL is then trimmed.
Standardizing Categorical and Numerical Data
The views implement specific format changes to ensure categorical fields are uniform and monetary fields are mathematically correct:
•	In customers_view, the Gender column is converted to uppercase using the UPPER () function. This standardizes entries like 'male', 'Male', and 'MALE' into a single, consistent value, improving the accuracy of any gender-based segmentation or reporting.
•	For all financial metrics specifically UnitPrice, TotalAmount (in orders_view), and CostPrice (in products_view), the ROUND (..., 2) function is applied. This enforces the required precision for currency data, ensuring that all values are consistently stored and analyzed in two decimal places.
Filtering Invalid and Illogical Records
Each view includes specific WHERE clauses to implement data validation by excluding records that are invalid or violate business logic, often preventing critical errors in aggregate analysis:
•	The primary validation step for all views ensures that the primary key columns (e.g., CustomerID, OrderID, ProductID) are not NULL and not empty. This prevents orphaned or unidentifiable records from entering the cleaned dataset.
Specific numerical checks are applied to the orders_view and products_view to enforce logical consistency:
•	Prices and amounts must be non-negative (UnitPrice >= 0 and TotalAmount >= 0). This guards against typographical errors or invalid credit entries being misinterpreted as revenue or cost. The structure utilizes foreign keys to establish relationships, forming a classic Star Schema with Orders as the central fact table.
Dimensional Modeling
After creating the tables and loading the data, a logical ERD was drawn using draw.io. The model includes Customers, Products, Stores, Orders, and OrderItems. These tables form the foundation for designing a star schema suitable for analytics.

Design Logical ERD
This table summarizes the one-to-many relationships defined in the logical ERD of the RetailDB schema. Each foreign key establishes how operational entities connect within the transaction flow. The OrderItems table uses a composite primary key (OrderID + ProductID) to maintain the uniqueness of product entries within each order.

Logical ERD Relationship Summary
Parent Table	Child Table	Relationship	Key Used
Customers	Orders	1 : M	CustomerID
Stores	Orders	1 : M	StoreID
Orders	OrderItems	1 : M	OrderID
Products	OrderItems	1 : M	ProductID

Star Schema Identification
The fact table captures line-level transaction details, while the surrounding dimension tables provide descriptive attributes required for filtering, grouping, and analytical interpretation.

Star Schema Identification
Table Type	Table Name	Key	Grain / Role	Main Attributes
Fact	OrderItems	OrderID, ProductID	One row per product per order	Quantity, UnitPrice, (can derive TotalSales)
Dimension	Customers	CustomerID	Customer descriptive information	FirstName, LastName, Gender, BirthDate, City, JoinDate
Dimension	Products	ProductID	Product descriptive attributes	ProductName, Category, SubCategory, UnitPrice, CostPrice
Dimension	Stores	StoreID	Store location and region details	StoreName, City, Region
Dimension	Orders	OrderID	Order-level details (acts as a degenerate or supporting dimension)	OrderDate, CustomerID, StoreID, Quantity, Discount, PaymentMethod, UnitPrice, TotalAmount

Data Schema Description and Business Query Support
The schema extracted from the RetailDB MySQL local server represents the core transactional structure of the retail system. It includes the Customers, Orders, OrderItems, Products, and Stores tables, connected through primary and foreign key relationships that reflect how customers place orders; stores fulfil them, and products are sold at the order-item level. Each table captures a different aspect of the business process, allowing the schema to support a wide range of analytical queries.

To prepare the data for analysis, a set of cleaned SQL views was created for each operational table. These views standardize text fields, remove invalid or empty identifiers, enforce non-negative pricing and quantity values, and ensure that all keys remain complete and consistent. The creation of these analytical views follows the transformation of scripts developed in the SQL workflow. For the full SQL statements used to construct customers_view, orders_view, orderitems_view, products_view, and stores_view, please refer to the Appendix SQL file. The cleaned views provide an analysis-ready layer that isolates business reporting from raw data issues and enables more reliable analytical queries.

As mentioned, because all analytical queries use the cleaned views rather than the raw tables, the data can be joined with consistent keys, standardized formats, and validated numeric fields. This improves reliability and reduces errors during analysis. With this cleaned analytical layer, the schema effectively supports business queries such as sales performance analysis, customer trend exploration, store comparisons, and discount impact evaluation.
