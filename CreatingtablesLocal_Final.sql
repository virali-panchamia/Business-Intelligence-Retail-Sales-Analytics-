CREATE DATABASE RetailDB;
USE RetailDB;

CREATE TABLE Customers (
  CustomerID VARCHAR(20) PRIMARY KEY,
  FirstName VARCHAR(100),
  LastName VARCHAR(100),
  Gender VARCHAR(100),
  BirthDate DATE,
  City VARCHAR(100),
  JoinDate DATE
);

CREATE TABLE Products (
  ProductID VARCHAR(20) PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  SubCategory VARCHAR(50),
  UnitPrice DECIMAL(10,2),
  CostPrice DECIMAL(10,2)
);

CREATE TABLE Stores (
  StoreID VARCHAR(20) PRIMARY KEY,
  StoreName VARCHAR(100),
  City VARCHAR(100),
  Region VARCHAR(50)
);

CREATE TABLE Orders (
  OrderID VARCHAR(20) PRIMARY KEY,
  OrderDate DATE,
  CustomerID VARCHAR(20),
  StoreID VARCHAR(20),
  Quantity INT,
  Discount DECIMAL(12,2),
  PaymentMethod VARCHAR(50),
  UnitPrice DECIMAL(12,2),
  TotalAmount DECIMAL(12,2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);


CREATE TABLE OrderItems (
  OrderID VARCHAR(20),
  ProductID VARCHAR(20),
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


