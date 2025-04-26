-- To achieve 1NF, we need to split the Products column into individual rows
-- We will create a new table with each product in a separate row for the same OrderID

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert each individual product from the original table into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Check the newly created table
SELECT * FROM ProductDetail_1NF;


-- Step 1: Create the Customer table to store customer information separately
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Step 2: Insert data into the Customers table, keeping only the unique OrderID and CustomerName
INSERT INTO Customers (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Step 3: Create a new table for the OrderDetails, without the CustomerName column
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Step 4: Insert data into the new OrderDetails_2NF table, excluding CustomerName
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Check the newly created tables
SELECT * FROM Customers;
SELECT * FROM OrderDetails_2NF;
