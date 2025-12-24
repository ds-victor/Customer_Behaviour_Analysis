-- Create database
CREATE DATABASE customer_db;

USE customer_db;

-- Create a staging table
CREATE TABLE transactions_staging (
    invoice_no TEXT,
    stock_code TEXT,
    description TEXT,
    quantity TEXT,
    invoice_date TEXT,
    unit_price TEXT,
    customer_id TEXT,
    country TEXT
);

SELECT * FROM transactions_staging;

-- Create analytical table
CREATE TABLE transactions (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price DECIMAL(10,2),
    customer_id INT,
    country VARCHAR(50)
);

-- Check empty table
SELECT * FROM transactions;
