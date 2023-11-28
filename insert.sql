use coffeeShop;

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

-- insert into CustomerID, Name, Email, Phone 15 sample values
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(1, 'Alice Smith', 'alice@email.com', '323-555-0101'),
(2, 'Bob Johnson', 'bob@email.com', '440-555-0102'), 
(3, 'Charlie Williams', 'charlie@email.com', '409-555-0103'),
(4, 'Daniel Brown', 'dannyBrown@email.com', '444-566-0120'),
(5, 'Eve Jones', 'Yoyo@email.com', '510-555-8505'),
(6, 'Frank Miller', 'frank@email.com', '430-545-5588'),
(7, 'George Garcia', 'george@email.com', '510-764-0107'),
(8, 'Harry Davis', 'harry@email.com', '444-530-0108'),
(9, 'Iris Rodriguez', 'iris@email.com', '233-556-0109'),
(10, 'John Rodriguez', 'john@email.com', '408-555-0110'),
(11, 'Kevin Davis', 'kevin@email.com', '410-959-0111'),
(12, 'Larry Garcia', 'larry@email.com', '510-334-0112'),
(13, 'Michael Miller', 'michael@email.com', '453-949-0113'),
(14, 'Nancy Jones', 'nancy@email.com', '433-400-0114'),
(15, 'Olivia Brown', 'olivia@email.com', '420-689-0115');

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
(1, 1, '2023-11-01', '08:00:00', '16:00:00'),
(2, 2, '2023-11-01', '12:00:00', '20:00:00'),
(3, 3, '2023-11-02', '09:00:00', '17:00:00'),
(4, 1, '2023-11-03', '08:00:00', '16:00:00'),
(5, 2, '2023-11-03', '10:00:00', '18:00:00'),
(6, 4, '2023-11-04', '09:00:00', '17:00:00'),
(7, 5, '2023-11-04', '12:00:00', '20:00:00'),
(8, 3, '2023-11-05', '08:00:00', '16:00:00'),
(9, 1, '2023-11-05', '14:00:00', '22:00:00'),
(10, 2, '2023-11-06', '08:00:00', '16:00:00'),
(11, 3, '2023-11-06', '12:00:00', '20:00:00'),
(12, 4, '2023-11-07', '09:00:00', '17:00:00'),
(13, 5, '2023-11-07', '08:00:00', '16:00:00'),
(14, 6, '2023-11-08', '12:00:00', '20:00:00'),
(15, 7, '2023-11-08', '08:00:00', '16:00:00'),
(16, 8, '2023-11-09', '09:00:00', '17:00:00'),
(17, 9, '2023-11-09', '08:00:00', '16:00:00'),
(18, 10, '2023-11-10', '12:00:00', '20:00:00'),
(19, 1, '2023-11-10', '08:00:00', '16:00:00'),
(20, 2, '2023-11-11', '09:00:00', '17:00:00'),
(21, 3, '2023-11-11', '08:00:00', '16:00:00'),
(22, 4, '2023-11-12', '12:00:00', '20:00:00'),
(23, 5, '2023-11-12', '08:00:00', '16:00:00'),
(24, 6, '2023-11-13', '09:00:00', '17:00:00'),
(25, 7, '2023-11-13', '08:00:00', '16:00:00'),
(26, 8, '2023-11-14', '12:00:00', '20:00:00'),
(27, 9, '2023-11-14', '08:00:00', '16:00:00'),
(28, 10, '2023-11-15', '09:00:00', '17:00:00');

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


