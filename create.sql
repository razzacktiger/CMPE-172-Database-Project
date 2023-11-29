/* Delete all tables if they exist */
/* 
to execute on command line: mysql -u root -p company 
then enter password 
*/

drop database if exists coffeeShop;
create database coffeeShop;
use coffeeShop;
DROP TABLE IF EXISTS MenuItems;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS EmployeeSchedules;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS MenuItemIngredients;

-- SQL Script to Create Tables for Coffee Shop Model

-- Table for Menu Items
CREATE TABLE MenuItems (
	MenuItemID INT PRIMARY KEY,
	Name VARCHAR(100),
	Price DECIMAL(10, 2)
);

-- Table for Employees
CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Position VARCHAR(100),
	HireDate DATE,
	Email VARCHAR(100),
	Phone VARCHAR(8),
	PhoneAreaCode VARCHAR(3),
  	Ssn CHAR(9) NOT NULL,
  	Bdate CHAR(10),
  	Address VARCHAR(30),
  	Sex CHAR,
  	Salary DECIMAL,
  	Super_ssn VARCHAR(9) REFERENCES Employees(Ssn)
);

-- Table for Customers
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(8),
	PhoneAreaCode VARCHAR(3)
);

-- Table for Suppliers
CREATE TABLE Suppliers (
	SupplierID INT PRIMARY KEY,
	Name VARCHAR(100),
	Contact VARCHAR(100)
);

-- Table for Inventory (Ingredients)
CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY,
	Name VARCHAR(100),
	Quantity INT,
	SupplierID INT,
    Cost DECIMAL(10, 2),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


-- Table for Employee Schedules
CREATE TABLE EmployeeSchedules (
	ScheduleID INT PRIMARY KEY,
	EmployeeID INT,
	WorkDate DATE,
	StartTime TIME,
	EndTime TIME,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table for Orders
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	Date DATE,
    Time TIME,
	TotalAmount DECIMAL(10, 2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Order Details (associates Orders with MenuItems)
CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	MenuItemID INT,
	Quantity INT,
	Subtotal DECIMAL(10, 2),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

-- Create table for the many-to-many relationship between MenuItems and Inventory
CREATE TABLE MenuItemIngredients (
    MenuItemID INT,
    InventoryID INT,
    PRIMARY KEY (MenuItemID, InventoryID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);

-- insert into MenuItemID, Name, Price 10 sample values
INSERT INTO MenuItems (MenuItemID, Name, Price) VALUES
(1, 'Espresso', 2.50),
(2, 'Cappuccino', 3.50),
(3, 'Latte', 3.00),
(4, 'Mocha', 3.75),
(5, 'Americano', 2.75),
(6, 'Flat White', 3.25),
(7, 'Macchiato', 2.80),
(8, 'Hot Chocolate', 3.00),
(9, 'Chai Latte', 3.50),
(10, 'Green Tea', 2.50);

-- insert into CustomerID, Name, Email, Phone, PhoneAreaCode 15 sample values
INSERT INTO Customers (CustomerID, Name, Email, Phone, PhoneAreaCode) VALUES
(1, 'Alice Smith', 'alice@email.com', '555-0101', '323'),
(2, 'Bob Johnson', 'bob@email.com', '555-0102', '440'), 
(3, 'Charlie Williams', 'charlie@email.com', '555-0103', '409'),
(4, 'Daniel Brown', 'dannyBrown@email.com', '566-0120', '444'),
(5, 'Eve Jones', 'Yoyo@email.com', '555-8505', '510'),
(6, 'Frank Miller', 'frank@email.com', '545-5588', '430'),
(7, 'George Garcia', 'george@email.com', '764-0107', '510'),
(8, 'Harry Davis', 'harry@email.com', '530-0108', '444'),
(9, 'Iris Rodriguez', 'iris@email.com', '556-0109', '233'),
(10, 'John Rodriguez', 'john@email.com', '555-0110', '408'),
(11, 'Kevin Davis', 'kevin@email.com', '959-0111', '410'),
(12, 'Larry Garcia', 'larry@email.com', '334-0112', '510'),
(13, 'Michael Miller', 'michael@email.com', '949-0113', '453'),
(14, 'Nancy Jones', 'nancy@email.com', '400-0114', '433'),
(15, 'Olivia Brown', 'olivia@email.com', '689-0115', '420');

INSERT INTO Employees (EmployeeID, Name, Position, HireDate, email, Phone, PhoneAreaCode, Ssn, Bdate, Address, Sex, Salary, Super_ssn) VALUES
(1, 'John Doe', 'Barista', '2021-01-01', 'john.doe@example.com', '555-1234', '555', '123456789', '1990-01-01', '123 Main St', 'M', 2500.00, 321789456),
(2, 'Jane Smith', 'Barista', '2021-01-01', 'jane.smith@example.com', '555-5678', '555', '987654321', '1992-02-02', '456 Elm St', 'F', 2500.00, 321789456),
(3, 'Bob Johnson', 'Cashier', '2021-01-02', 'bob.johnson@example.com', '555-4321', '555', '456789123', '1991-03-03', '789 Oak St', 'M', 2000.00, 321654987),
(4, 'Alice Lee', 'Manager', '2021-01-02', 'alice.lee@example.com', '555-8765', '555', '321654987', '1993-04-04', '987 Pine St', 'F', 5000.00, NULL),
(5, 'Tom Brown', 'Barista', '2021-01-03', 'tom.brown@example.com', '555-1357', '555', '654987321', '1992-05-05', '654 Cedar St', 'M', 2500.00, 321789456),
(6, 'Sara Garcia', 'Barista', '2021-01-03', 'sara.garcia@example.com', '555-8642', '555', '789654123', '1994-06-06', '321 Maple St', 'F', 2500.00, 321789456),
(7, 'Mike Davis', 'Cashier', '2021-01-04', 'mike.davis@example.com', '555-2468', '555', '987123654', '1993-07-07', '654 Oak St', 'M', 2000.00, 321654987),
(8, 'Emily Rodriguez', 'Manager', '2021-01-04', 'emily.rodriguez@example.com', '555-6802', '555', '321789456', '1995-08-08', '987 Elm St', 'F', 5000.00, NULL),
(9, 'David Kim', 'Barista', '2021-01-05', 'david.kim@example.com', '555-3579', '555', '654321987', '1994-09-09', '789 Pine St', 'M', 2500.00, 321789456),
(10, 'Amy Chen', 'Barista', '2021-01-05', 'amy.chen@example.com', '555-7913', '555', '987456321', '1996-10-10', '321 Cedar St', 'F', 2500.00, 321789456);

INSERT INTO Suppliers (SupplierID, Name, Contact) VALUES
(1, 'Global Coffee Suppliers', 'contact@gcs.com'),
(2, 'Dairy Best', 'info@dairybest.com'),
(3, 'Sweet Sugar Inc.', 'sales@sweetsugar.com'),
(4, 'Choco Delights', 'support@chocodelights.com'),
(5, 'Tea Time Supplies', 'contact@teatimesupplies.com'),
(6, 'Vanilla Ventures', 'info@vanillaventures.com'),
(7, 'Creamy Creations', 'contact@creamycreations.com'),
(8, 'Honey Harvest', 'sales@honeyharvest.com'),
(9, 'Spice World', 'info@spiceworld.com'),
(10, 'Almond Affairs', 'contact@almondaffairs.com');

INSERT INTO Inventory (InventoryID, Name, Quantity, SupplierID, Cost) VALUES
(1, 'Coffee Beans', 100, 1, 10.00),
(2, 'Sugar', 200, 3, 5.00),
(3, 'Milk', 150, 2, 3.00),
(4, 'Chocolate Syrup', 50, 4, 8.00),
(5, 'Vanilla Extract', 30, 6, 6.00),
(6, 'Whipped Cream', 20, 7, 4.00),
(7, 'Honey', 100, 8, 7.00),
(8, 'Cinnamon', 40, 9, 5.00),
(9, 'Nutmeg', 25, 9, 4.00),
(10, 'Almond Milk', 80, 10, 6.00),
(11, 'Caramel Sauce', 60, 4, 9.00),
(12, 'Coconut Milk', 70, 10, 7.00),
(13, 'Hazelnut Syrup', 45, 4, 8.00),
(14, 'Maple Syrup', 55, 8, 6.00),
(15, 'Peppermint Extract', 35, 6, 5.00);

INSERT INTO EmployeeSchedules (ScheduleID, EmployeeID, WorkDate, StartTime, EndTime) VALUES
(1, 1, '2021-1-01', '08:00:00', '16:00:00'),
(2, 2, '2021-1-01', '12:00:00', '20:00:00'),
(3, 3, '2021-1-02', '09:00:00', '17:00:00'),
(4, 1, '2021-1-03', '08:00:00', '16:00:00'),
(5, 2, '2021-1-03', '10:00:00', '18:00:00'),
(6, 4, '2021-1-04', '09:00:00', '17:00:00'),
(7, 5, '2021-1-04', '12:00:00', '20:00:00'),
(8, 3, '2021-1-05', '08:00:00', '16:00:00'),
(9, 1, '2021-1-05', '14:00:00', '22:00:00'),
(10, 2, '2021-1-06', '08:00:00', '16:00:00'),
(11, 3, '2021-1-06', '12:00:00', '20:00:00'),
(12, 4, '2021-1-07', '09:00:00', '17:00:00'),
(13, 5, '2021-1-07', '08:00:00', '16:00:00'),
(14, 6, '2021-1-08', '12:00:00', '20:00:00'),
(15, 7, '2021-1-08', '08:00:00', '16:00:00'),
(16, 8, '2021-1-09', '09:00:00', '17:00:00'),
(17, 9, '2021-1-09', '08:00:00', '16:00:00'),
(18, 10, '2021-1-10', '12:00:00', '20:00:00'),
(19, 1, '2021-1-10', '08:00:00', '16:00:00'),
(20, 2, '2021-1-11', '09:00:00', '17:00:00'),
(21, 3, '2021-1-11', '08:00:00', '16:00:00'),
(22, 4, '2021-1-12', '12:00:00', '20:00:00'),
(23, 5, '2021-1-12', '08:00:00', '16:00:00'),
(24, 6, '2021-1-13', '09:00:00', '17:00:00'),
(25, 7, '2021-1-13', '08:00:00', '16:00:00'),
(26, 8, '2021-1-14', '12:00:00', '20:00:00'),
(27, 9, '2021-1-14', '08:00:00', '16:00:00'),
(28, 10, '2021-1-15', '09:00:00', '17:00:00');

INSERT INTO Orders (OrderID, CustomerID, Date, Time, TotalAmount) VALUES
(1, 1, '2021-01-01', '10:33:00', 9.50),
(2, 2, '2021-01-02', '11:15:00', 12.25),
(3, 3, '2021-01-03', '09:45:00', 8.75),
(4, 4, '2021-01-04', '14:20:00', 10.50),
(5, 5, '2021-01-05', '12:10:00', 7.80),
(6, 6, '2021-01-06', '10:55:00', 9.00),
(7, 7, '2021-01-07', '13:30:00', 11.50),
(8, 8, '2021-01-08', '15:45:00', 8.25),
(9, 9, '2021-01-09', '11:40:00', 10.75),
(10, 10, '2021-01-10', '09:20:00', 7.50),
(11, 11, '2021-01-11', '12:05:00', 9.80),
(12, 12, '2021-01-12', '14:50:00', 11.00),
(13, 13, '2021-01-13', '10:25:00', 8.50),
(14, 14, '2021-01-14', '13:15:00', 10.25),
(15, 15, '2021-01-15', '15:30:00', 7.75),
(16, 1, '2021-02-01', '09:45:00', 8.00),
(17, 2, '2021-02-05', '11:30:00', 13.50),
(18, 3, '2021-02-10', '10:15:00', 9.25),
(19, 4, '2021-02-15', '14:00:00', 12.75),
(20, 5, '2021-02-20', '12:45:00', 7.00), 
(21, 1, '2021-03-03', '10:20:00', 10.50),
(22, 2, '2021-03-08', '11:55:00', 11.75),
(23, 3, '2021-03-13', '09:30:00', 8.00),
(24, 4, '2021-03-18', '14:15:00', 10.25),
(25, 5, '2021-03-23', '12:00:00', 9.50),
(26, 1, '2021-04-05', '10:05:00', 9.75),
(27, 2, '2021-04-10', '11:40:00', 12.00),
(28, 3, '2021-04-15', '09:25:00', 7.50),
(29, 4, '2021-04-20', '14:10:00', 11.20),
(30, 5, '2021-04-25', '12:55:00', 8.90);

INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, Subtotal) VALUES
(1, 1, 1, 2, 5.00),
(2, 1, 2, 1, 3.50),
(3, 2, 3, 2, 6.00),
(4, 2, 4, 1, 3.75),
(5, 3, 5, 1, 2.75),
(6, 4, 6, 1, 3.25),
(7, 5, 7, 1, 2.80),
(8, 6, 8, 1, 3.00),
(9, 7, 9, 1, 3.50),
(10, 8, 10, 1, 2.50),
(11, 9, 1, 1, 2.50),
(12, 10, 2, 1, 3.50),
(13, 11, 3, 1, 3.00),
(14, 12, 4, 1, 3.75),
(15, 13, 5, 1, 2.75),
(16, 14, 6, 1, 3.25),
(17, 15, 7, 1, 2.80);


INSERT INTO MenuItemIngredients (MenuItemID, InventoryID) VALUES
(1, 1), -- Espresso - Coffee Beans
(1, 2), -- Espresso - Sugar
(1, 3), -- Espresso - Milk
(2, 1), -- Cappuccino - Coffee Beans
(2, 2), -- Cappuccino - Sugar
(2, 3), -- Cappuccino - Milk
(2, 7), -- Cappuccino - Whipped Cream
(3, 1), -- Latte - Coffee Beans
(3, 2), -- Latte - Sugar
(3, 3), -- Latte - Milk
(3, 6), -- Latte - Vanilla Extract
(4, 1), -- Mocha - Coffee Beans
(4, 2), -- Mocha - Sugar
(4, 3), -- Mocha - Milk
(4, 4), -- Mocha - Chocolate Syrup
(5, 1), -- Americano - Coffee Beans
(5, 2), -- Americano - Sugar
(5, 3), -- Americano - Milk
(6, 1), -- Flat White - Coffee Beans
(6, 2), -- Flat White - Sugar
(6, 3), -- Flat White - Milk
(6, 6), -- Flat White - Whipped Cream
(7, 1), -- Macchiato - Coffee Beans
(7, 2), -- Macchiato - Sugar
(7, 3), -- Macchiato - Milk
(7, 7), -- Macchiato - Honey
(8, 1), -- Hot Chocolate - Coffee Beans
(8, 2), -- Hot Chocolate - Sugar
(8, 3), -- Hot Chocolate - Milk
(8, 4), -- Hot Chocolate - Chocolate Syrup
(9, 1), -- Chai Latte - Coffee Beans
(9, 2), -- Chai Latte - Sugar
(9, 3), -- Chai Latte - Milk
(9, 8), -- Chai Latte - Cinnamon
(10, 1), -- Green Tea - Coffee Beans
(10, 2), -- Green Tea - Sugar
(10, 3), -- Green Tea - Milk
(10, 10); -- Green Tea - Almond Milk

