-- Use the BillManagerDB database (create it if it doesn't exist)
CREATE DATABASE IF NOT EXISTS BillManagerDB;
USE BillManagerDB;

-- Step 1: Create Tables
-- Create the customer table
CREATE TABLE customer (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(100),
    email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    customerAddress VARCHAR(100)
);

-- Create the bills table
CREATE TABLE bills (
    billID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    TotalAmount DECIMAL(10, 2),
    CategoryID INT,
    Status VARCHAR(50),
    BillDate DATE,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- Create the bill_items table
CREATE TABLE bill_items (
    itemID INT AUTO_INCREMENT PRIMARY KEY,
    billID INT,
    itemDescription VARCHAR(255),
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (billID) REFERENCES bills(billID)
);

-- Create the payments table
CREATE TABLE payments (
    paymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    BillID INT,
    FOREIGN KEY (BillID) REFERENCES bills(billID)
);

-- Step 2: Insert Data
-- Insert data into the customer table
INSERT INTO customer (customerName, email, PhoneNumber, customerAddress)
VALUES 
('John Doe', 'john@example.com', '1234567890', 'Kisii'),
('Jane Smith', 'jane@example.com', '0987654321', 'Nairobi'),
('Alice Brown', 'alice@example.com', '1122334455', 'Kiambu');

-- Insert data into the bills table
INSERT INTO bills (customerID, TotalAmount, CategoryID, Status, BillDate)
VALUES 
(1, 500.00, 101, 'unpaid', '2024-11-15'),
(2, 1200.00, 102, 'paid', '2024-11-10'),
(3, 300.00, 103, 'unpaid', '2024-11-20');

-- Insert data into the bill_items table
INSERT INTO bill_items (billID, itemDescription, LineTotal)
VALUES 
(1, 'Electricity Bill', 300.00),
(1, 'Water Bill', 200.00),
(2, 'Internet Bill', 1200.00);

-- Insert data into the payments table
INSERT INTO payments (PaymentAmount, PaymentMethod, BillID)
VALUES 
(300.00, 'Mpesa', 1),
(1200.00, 'Visa', 2),
(200.00, 'Cash', 1);

-- Step 3: Queries
-- 1. Retrieve the customerName, email, and PhoneNumber from the customer table.
SELECT customerName, email, PhoneNumber 
FROM customer;

-- 2. Retrieve the customerName, email, and PhoneNumber from the customer table where customerAddress is equal to Kisii.
SELECT customerName, email, PhoneNumber 
FROM customer 
WHERE customerAddress = 'Kisii';

-- 3. Retrieve the customerID and TotalAmount from the bills table where status is equal to unpaid.
SELECT customerID, TotalAmount 
FROM bills 
WHERE status = 'unpaid';

-- 4. Retrieve the customerID, TotalAmount, and CategoryID from the bills table where status is equal to paid.
SELECT customerID, TotalAmount, CategoryID 
FROM bills 
WHERE status = 'paid';

-- 5. Retrieve the customerID and Status from the bills table where BillDate is between 2024-11-01 and 2024-11-30.
SELECT customerID, Status 
FROM bills 
WHERE BillDate BETWEEN '2024-11-01' AND '2024-11-30';

-- 6. Retrieve the billID, itemDescription, and LineTotal from the bill_items table ordered by LineTotal in descending order.
SELECT billID, itemDescription, LineTotal 
FROM bill_items 
ORDER BY LineTotal DESC;

-- 7. Retrieve the billID, itemDescription, and LineTotal from the bill_items table ordered by LineTotal in ascending order.
SELECT billID, itemDescription, LineTotal 
FROM bill_items 
ORDER BY LineTotal ASC;

-- 8. Retrieve the billID, itemDescription, and LineTotal from the bill_items table where LineTotal is greater than 100 and retrieve the result in descending order using billID.
SELECT billID, itemDescription, LineTotal 
FROM bill_items 
WHERE LineTotal > 100 
ORDER BY billID DESC;

-- 9. Retrieve the PaymentAmount and PaymentMethod from the payments table where paymentMethod contains 'esa'.
SELECT PaymentAmount, PaymentMethod 
FROM payments 
WHERE PaymentMethod LIKE '%esa';

-- 10. Retrieve the CustomerName and CustomerAddress from the customer table where CustomerAddress starts with 'Ki'.
SELECT CustomerName, CustomerAddress 
FROM customer 
WHERE CustomerAddress LIKE 'Ki%';
