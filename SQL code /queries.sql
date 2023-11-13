-- Basic Queries

-- List All Products and Prices
SELECT Name, Price FROM Products;

-- Total Number of Orders for Each Customer
SELECT CustomerID, COUNT(*) as TotalOrders FROM Orders GROUP BY CustomerID;

-- Daily Sales Total
SELECT Date, SUM(TotalAmount) as DailySales FROM Orders GROUP BY Date;

-- Inventory Status for Each Product
SELECT P.Name, I.Quantity FROM Inventory I JOIN Products P ON I.ProductID = P.ProductID;

-- Employee Roster
SELECT Name, Position FROM Employees;

-- Intermediate Queries

-- Monthly Sales by Product Category
SELECT MONTH(O.Date) as Month, P.Category, SUM(OD.Subtotal) as Sales 
FROM Orders O 
JOIN OrderDetails OD ON O.OrderID = OD.OrderID 
JOIN Products P ON OD.ProductID = P.ProductID 
GROUP BY MONTH(O.Date), P.Category;

-- Average Order Value
SELECT AVG(TotalAmount) FROM Orders;

-- Top 5 Selling Products
SELECT P.Name, SUM(OD.Quantity) as TotalSold 
FROM OrderDetails OD 
JOIN Products P ON OD.ProductID = P.ProductID 
GROUP BY P.ProductID 
ORDER BY TotalSold DESC LIMIT 5;

-- Customer Order History
SELECT C.Name, O.OrderID, O.Date, O.TotalAmount 
FROM Customers C 
JOIN Orders O ON C.CustomerID = O.CustomerID;

-- Product Reorder List
SELECT P.Name, I.Quantity 
FROM Inventory I 
JOIN Products P ON I.ProductID = P.ProductID 
WHERE I.Quantity < 10;

-- Advanced Queries

-- Yearly Sales Comparison by Month
SELECT YEAR(Date) as Year, MONTH(Date) as Month, SUM(TotalAmount) as MonthlySales 
FROM Orders 
GROUP BY YEAR(Date), MONTH(Date);

-- Customer Lifetime Value
SELECT C.CustomerID, C.Name, SUM(O.TotalAmount) as LifetimeValue 
FROM Customers C 
JOIN Orders O ON C.CustomerID = O.CustomerID 
GROUP BY C.CustomerID;

-- Supplier Reliability
SELECT S.Name, COUNT(I.SupplierID) as TotalDeliveries, AVG(I.Quantity) as AvgQuantity 
FROM Suppliers S 
JOIN Inventory I ON S.SupplierID = I.SupplierID 
GROUP BY S.SupplierID;

-- Employee Efficiency (Orders Handled)
-- Note: This query assumes a link between employees and orders in the database schema.
SELECT E.Name, COUNT(O.OrderID) as OrdersHandled 
FROM Employees E 
JOIN Orders O ON E.EmployeeID = O.EmployeeID 
GROUP BY E.EmployeeID;

-- Sales Trend Analysis
SELECT ProductID, YEAR(Date) as Year, MONTH(Date) as Month, SUM(Quantity) as TotalQuantitySold 
FROM Orders O 
JOIN OrderDetails OD ON O.OrderID = OD.OrderID 
GROUP BY ProductID, YEAR(Date), MONTH(Date);
