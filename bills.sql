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

-- Create the bills table
CREATE TABLE IF NOT EXISTS bills (
    billID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT,
    TotalAmount DECIMAL(10, 2),
    status VARCHAR(50),
    BillDate DATE,
    FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- Create the bill_items table
CREATE TABLE IF NOT EXISTS bill_items (
    billItemID INT AUTO_INCREMENT PRIMARY KEY,
    billID INT,
    itemDescription VARCHAR(255),
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (billID) REFERENCES bills(billID)
);

-- Insert some initial data into customer table
INSERT INTO customer (customerName, email, PhoneNumber, customerAddress)
VALUES
('John Doe', 'john@example.com', '123456789', 'Kisii'),
('Jane Smith', 'jane@example.com', '987654321', 'Nairobi'),
('Mike Johnson', 'mike@example.com', '456123789', 'Kisumu');
