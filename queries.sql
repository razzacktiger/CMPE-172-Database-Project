use coffeeShop;
-- queries for coffeeShop

-- Basic Queries

-- 1. Inventory Reorder List
-- ingredients with low stock.
SELECT Name as LowStockItem, Quantity
FROM Inventory 
WHERE Quantity < 50;

-- 2. Current Inventory Levels
-- Provides a quick view of current stock levels for each ingredient.
SELECT Name, Quantity as QuantityInPackets
FROM Inventory;

-- 3. Employee Contact Information
-- Useful for quickly accessing employee contact information.
SELECT Name, Position, Email, CONCAT(PhoneAreaCode, '-', Phone) AS Phone
FROM Employees;

-- 4. Update the contact information for a specific customer
UPDATE Customers
SET Email = 'newemail@example.com', Phone = '1234567', PhoneAreaCode = '408'
WHERE CustomerID = 1; -- Replace with the actual CustomerID

SELECT * FROM Customers;

-- 5. Add a new column to indicate if a customer is part of the loyalty program
ALTER TABLE Customers
ADD COLUMN IsLoyaltyMember BOOLEAN DEFAULT FALSE;

SELECT * FROM Customers;

-- Intermediate Queries

-- 6. Monthly Sales Report
-- This query calculates the total sales for each month.
SELECT MONTH(Date) AS Month, SUM(TotalAmount) AS TotalSales 
FROM Orders 
GROUP BY MONTH(Date);

-- 7. Daily Sales Total
-- Shows the total sales for each day.
SELECT DATE(Date) AS SalesDate, SUM(TotalAmount) AS DailyTotal 
FROM Orders 
GROUP BY SalesDate;

-- 8. Top Selling Menu Items
-- Identifies the most popular menu items based on sales quantity.
SELECT MenuItems.Name, SUM(OrderDetails.Quantity) AS TotalSold 
FROM OrderDetails 
JOIN MenuItems ON OrderDetails.MenuItemID = MenuItems.MenuItemID 
GROUP BY MenuItems.Name 
ORDER BY TotalSold DESC;

-- 9. Natural Join on Orders and Customers
-- Lists all orders and customers, including customers who have not placed any orders yet.
SELECT *
FROM Orders
NATURAL JOIN Customers;

-- 10. Supplier and Inventory Details
-- Lists all ingredients and their suppliers.
SELECT Inventory.Name AS InventoryItem, Suppliers.Name AS SupplierName, Suppliers.Contact
FROM Inventory
INNER JOIN Suppliers ON Inventory.SupplierID = Suppliers.SupplierID;

-- 11. Inventory Usage per Menu Item
-- Tracks how much of each menu item is sold.
SELECT MenuItems.Name, SUM(OrderDetails.Quantity) AS TotalSold
FROM OrderDetails 
JOIN MenuItems ON OrderDetails.MenuItemID = MenuItems.MenuItemID 
GROUP BY MenuItems.Name;

-- 12. Employee Shifts for the Week
-- Lists employee shifts for a specific week.
SELECT Employees.Name, EmployeeSchedules.WorkDate, EmployeeSchedules.StartTime, EmployeeSchedules.EndTime 
FROM EmployeeSchedules 
JOIN Employees ON EmployeeSchedules.EmployeeID = Employees.EmployeeID 
WHERE EmployeeSchedules.WorkDate BETWEEN '2021-01-01' AND '2021-01-07';

-- 13. Gets the total number of visits and total amount spent for each customer.
SELECT Customers.Name, Customers.Email, CONCAT(Customers.PhoneAreaCode, '-', Customers.Phone) AS Phone, COUNT(Orders.OrderID) AS VisitCount, SUM(Orders.TotalAmount) AS TotalSpent
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
GROUP BY Customers.CustomerID
HAVING VisitCount > 5;

-- 14. Customer Order History
-- Provides a history of orders for each customer.
SELECT Customers.Name, Orders.Date, SUM(Orders.TotalAmount) AS TotalSpent 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
GROUP BY Customers.Name, Orders.Date;

-- 15. Monthly Sales Comparison by Year
-- Compares monthly sales across different years.
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(TotalAmount) AS MonthlySales 
FROM Orders 
GROUP BY YEAR(Date), MONTH(Date);

-- 16. Detailed Inventory Status
-- Provides a detailed view of inventory, including supplier information.
SELECT Inventory.Name, Inventory.Quantity, Suppliers.Name AS Supplier 
FROM Inventory 
JOIN Suppliers ON Inventory.SupplierID = Suppliers.SupplierID;

-- 17. Menu Items Without Orders
-- Lists menu items that have not been ordered yet.
SELECT MenuItems.Name
FROM MenuItems
LEFT JOIN OrderDetails ON MenuItems.MenuItemID = OrderDetails.MenuItemID
WHERE OrderDetails.OrderID IS NULL;

-- 18. Employee Schedule with Unassigned Shifts
-- Lists employee shifts that have not been assigned to an employee.
SELECT Employees.Name, EmployeeSchedules.WorkDate, EmployeeSchedules.StartTime, EmployeeSchedules.EndTime
FROM Employees
RIGHT JOIN EmployeeSchedules ON Employees.EmployeeID = EmployeeSchedules.EmployeeID
WHERE Employees.Name IS NULL;

-- Advanced Queries

-- 19. Sales by Menu Item per Month
-- Breaks down monthly sales by each menu item.
SELECT MenuItems.Name, MONTH(Orders.Date) AS Month, SUM(OrderDetails.Quantity) AS QuantitySold 
FROM OrderDetails 
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID 
JOIN MenuItems ON OrderDetails.MenuItemID = MenuItems.MenuItemID 
GROUP BY Month, MenuItems.Name;

-- 20. Employee Performance (Based on Orders Handled)
-- Calculates the number of orders handled by each employee.
SELECT Employees.Name, COUNT(Orders.OrderID) AS OrdersHandled 
FROM Employees 
JOIN EmployeeSchedules ON Employees.EmployeeID = EmployeeSchedules.EmployeeID 
JOIN Orders ON EmployeeSchedules.WorkDate = Orders.Date 
AND Orders.Time BETWEEN EmployeeSchedules.StartTime AND EmployeeSchedules.EndTime
GROUP BY Employees.Name;

-- 21. Ingredient Usage Forecast
-- Calculates the average monthly usage for each ingredient.
SELECT Inventory.Name, SUM(OrderDetails.Quantity) / COUNT(DISTINCT MONTH(Orders.Date)) AS AvgMonthlyUsage 
FROM OrderDetails 
JOIN MenuItems ON OrderDetails.MenuItemID = MenuItems.MenuItemID 
JOIN MenuItemIngredients ON MenuItems.MenuItemID = MenuItemIngredients.MenuItemID 
JOIN Inventory ON MenuItemIngredients.InventoryID = Inventory.InventoryID 
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID 
GROUP BY Inventory.Name;

-- 22. Profit Margin Analysis
-- Calculates the profit margin for each menu item.
SELECT MenuItems.Name, MenuItems.Price - 
(SELECT SUM(Inventory.Cost) 
FROM Inventory 
JOIN MenuItemIngredients ON Inventory.InventoryID = MenuItemIngredients.InventoryID 
WHERE MenuItemIngredients.MenuItemID = MenuItems.MenuItemID) 
AS ProfitMargin 
FROM MenuItems;

-- 23. Full Overview of Customers and Orders
-- Lists all customers, their order dates and total amount spent, including customers who have not placed any orders yet.
SELECT Customers.Name AS CustomerName, Orders.Date AS OrderDate, Orders.TotalAmount 
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.Name AS CustomerName, Orders.Date AS OrderDate, Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 24. Overview of ingredients used in each menu item
-- SELECT MenuItems.Name, Inventory.Name AS Ingredient 
FROM MenuItemIngredients
JOIN MenuItems ON MenuItemIngredients.MenuItemID = MenuItems.MenuItemID
JOIN Inventory ON MenuItemIngredients.InventoryID = Inventory.InventoryID
GROUP BY MenuItems.Name, Inventory.Name;

