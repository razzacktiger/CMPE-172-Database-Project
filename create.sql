/* Delete all tables if they exist */
/* 
to execute on command line: mysql -u root -p company 
then enter password 
*/
drop database if exists coffeeShop;
create database coffeeShop;
use coffeeShop;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Products;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(100)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Date DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


--insert into CustomerID, Name, Email, Phone 15 sample values
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(1, 'Alice Smith', 'alice@email.com', '555-0101'),
(2, 'Bob Johnson', 'bob@email.com', '555-0102'), 
(3, 'Charlie Williams', 'charlie@email.com, '555-0103'),
(4, 'Daniel Brown', 'dannyBrown@email.com', '566-0120'),
(5, 'Eve Jones', 'Yoyo@email.com', '555-8505'),
(6, 'Frank Miller', 'frank@email.com', '545-5588'),
(7, 'George Garcia', 'george@email.com', '764-0107'),
(8, 'Harry Davis', 'harry@email.com', '530-0108'),
(9, 'Iris Rodriguez', 'iris@email.com', '556-0109'),
(10, 'John Rodriguez', 'john@email.com', '555-0110'),
(11, 'Kevin Davis', 'kevin@email.com', '959-0111'),
(12, 'Larry Garcia', 'larry@email.com', '334-0112'),
(13, 'Michael Miller', 'michael@email.com', '949-0113'),
(14, 'Nancy Jones', 'nancy@email.com', '400-0114'),
(15, 'Olivia Brown', 'olivia@email.com', '689-0115');

INSERT INTO Products (ProductID, Name, Price, Category) VALUES
(1, 'Espresso', 2.50, 'Coffee'),
(2, 'Cappuccino', 3.50, 'Coffee'),
(3, 'Latte', 4.00, 'Coffee'),
(4, 'Mocha', 4.50, 'Coffee'),
(5, 'Americano', 3.00, 'Coffee'),
(6, 'Hot Chocolate', 3.50, 'Hot Drinks'),
(7, 'Tea', 2.50, 'Hot Drinks'),
(8, 'Iced Tea', 3.00, 'Cold Drinks'),
(9, 'Lemonade', 3.50, 'Cold Drinks'),
(10, 'Orange Juice', 3.00, 'Cold Drinks'),
(11, 'Croissant', 2.00, 'Pastries'),
(12, 'Muffin', 2.50, 'Pastries'),
(13, 'Cinnamon Roll', 3.00, 'Pastries'),
(14, 'Bagel', 2.50, 'Pastries'),
(15, 'Scone', 2.50, 'Pastries');

INSERT INTO Employees (EmployeeID, Name, Position, HireDate) VALUES
(1, 'John Doe', 'Barista', '2021-01-01'),
(2, 'Jane Smith', 'Barista', '2021-01-01'),
(3, 'Bob Johnson', 'Cashier', '2021-01-02'),
(4, 'Alice Lee', 'Manager', '2021-01-02'),
(5, 'Tom Brown', 'Barista', '2021-01-03'),
(6, 'Sara Garcia', 'Barista', '2021-01-03'),
(7, 'Mike Davis', 'Cashier', '2021-01-04'),
(8, 'Emily Rodriguez', 'Manager', '2021-01-04'),
(9, 'David Kim', 'Barista', '2021-01-05'),
(10, 'Amy Chen', 'Barista', '2021-01-05');

INSERT INTO Suppliers (SupplierID, Name, Contact) VALUES
(1, 'Coffee Supplier', 'John Smith'),
(2, 'Milk Supplier', 'Jane Smith'),
(3, 'Tea Supplier', 'Bob Johnson'),
(4, 'Pastry Supplier', 'Alice Lee'),
(5, 'Juice Supplier', 'Tom Brown');


INSERT INTO Orders (OrderID, CustomerID, Date, TotalAmount) VALUES
(1, 1, '2021-01-01', 9.50),
(2, 2, '2021-01-02', 12.00),
(3, 3, '2021-01-03', 8.00),
(4, 4, '2021-01-04', 5.00),
(5, 5, '2021-01-05', 14.00),
(6, 6, '2021-01-06', 7.00),
(7, 7, '2021-01-07', 11.50),
(8, 8, '2021-01-08', 5.00),
(9, 9, '2021-01-09', 10.00),
(10, 10, '2021-01-10', 6.50),
(11, 1, '2021-01-11', 8.50),
(12, 2, '2021-01-12', 13.00),
(13, 3, '2021-01-13', 9.00),
(14, 4, '2021-01-14', 4.50),
(15, 5, '2021-01-15', 15.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 1, 2, 5.00),
(2, 1, 3, 1, 4.00),
(3, 2, 2, 1, 3.50),
(4, 2, 5, 2, 6.00),
(5, 3, 4, 1, 4.50),
(6, 3, 6, 1, 3.50),
(7, 4, 1, 1, 2.50),
(8, 4, 7, 1, 2.50),
(9, 5, 3, 2, 8.00),
(10, 5, 5, 1, 3.00),
(11, 6, 2, 1, 3.50),
(12, 6, 6, 1, 3.50),
(13, 7, 4, 2, 9.00),
(14, 7, 7, 1, 2.50),
(15, 8, 1, 1, 2.50);

INSERT INTO Inventory (InventoryID, ProductID, Quantity, SupplierID) VALUES
(1, 1, 10, 1),
(2, 2, 20, 2),s
(3, 3, 5, 3),
(4, 4, 15, 4),
(5, 5, 30, 5),
(6, 6, 8, 1),
(7, 7, 12, 2),
(8, 8, 25, 3),
(9, 9, 18, 4),
(10, 10, 22, 5),
(11, 11, 7, 1),
(12, 12, 13, 2),
(13, 13, 4, 3),
(14, 14, 9, 4),
(15, 15, 11, 5),
(16, 16, 16, 1),
(17, 17, 21, 2),
(18, 18, 6, 3),
(19, 19, 14, 4),
(20, 20, 19, 5),
(21, 21, 23, 1),
(22, 22, 27, 2),
(23, 23, 3, 3),
(24, 24, 17, 4),
(25, 25, 29, 5),
(26, 26, 2, 1),
(27, 27, 24, 2),
(28, 28, 1, 3),
(29, 29, 26, 4),
(30, 30, 28, 5);

