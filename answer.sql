-- Create the database
CREATE DATABASE IF NOT EXISTS bills;

-- Use the database
USE bills;

-- Create the customer table
CREATE TABLE IF NOT EXISTS customer (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(100),
    email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    customerAddress VARCHAR(255)
);

-- Insert data into customer table
INSERT INTO customer (customerName, email, PhoneNumber, customerAddress)
VALUES 
('John Doe', 'john@example.com', '123456789', 'Kisii'),
('Jane Smith', 'jane@example.com', '987654321', 'Nairobi'),
('Mike Johnson', 'mike@example.com', '456123789', 'Kisumu');

-- Retrieve customerName, email, and PhoneNumber from customer table
SELECT customerName, email, PhoneNumber FROM customer;

-- Create the bills table
CREATE TABLE IF NOT EXISTS bills (
    billID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    TotalAmount DECIMAL(10, 2),
    status VARCHAR(50),
    BillDate DATE,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- Insert data into bills table
INSERT INTO bills (customerID, TotalAmount, status, BillDate)
VALUES 
(1, 150.75, 'unpaid', '2024-10-15'),
(2, 200.00, 'paid', '2024-11-05'),
(3, 120.50, 'unpaid', '2024-11-20');

-- Retrieve customerID, TotalAmount from the bills table where status is 'unpaid'
SELECT customerID, TotalAmount FROM bills WHERE status = 'unpaid';

-- Retrieve customerID, TotalAmount, and CategoryID from the bills table where status is 'paid'
SELECT customerID, TotalAmount, 'CategoryID' FROM bills WHERE status = 'paid';

-- Create the bill_items table
CREATE TABLE IF NOT EXISTS bill_items (
    billItemID INT AUTO_INCREMENT PRIMARY KEY,
    billID INT,
    itemDescription VARCHAR(255),
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (billID) REFERENCES bills(billID)
);

-- Insert data into bill_items table
INSERT INTO bill_items (billID, itemDescription, LineTotal)
VALUES
(1, 'Electricity', 50.00),
(1, 'Water', 30.75),
(2, 'Internet', 70.00),
(3, 'Rent', 100.50);

-- Retrieve billID, itemDescription, and LineTotal ordered by LineTotal in descending order
SELECT billID, itemDescription, LineTotal FROM bill_items ORDER BY LineTotal DESC;

-- Retrieve billID, itemDescription, and LineTotal ordered by LineTotal in ascending order
SELECT billID, itemDescription, LineTotal FROM bill_items ORDER BY LineTotal ASC;

-- Retrieve billID, itemDescription, and LineTotal where LineTotal is greater than 100, ordered by billID in descending order
SELECT billID, itemDescription, LineTotal FROM bill_items WHERE LineTotal > 100 ORDER BY billID DESC;

-- Retrieve PaymentAmount and PaymentMethod from payments table where PaymentMethod like '%esa'
SELECT PaymentAmount, PaymentMethod FROM payments WHERE PaymentMethod LIKE '%esa';

-- Retrieve CustomerName and CustomerAddress where CustomerAddress like 'Ki%'
SELECT customerName, customerAddress FROM customer WHERE customerAddress LIKE 'Ki%';
