
-- Selecting database
USE customer_db;

-- Verify LOCAL INFILE is enabled
SHOW VARIABLES LIKE 'local_infile';

-- As it is off, turning it on
SET GLOBAL local_infile = 1;


-- Import data from csv
LOAD DATA LOCAL INFILE
'B:/Training/BIA/Projects/Customer_Behaviour_Analysis/data/data.csv'
INTO TABLE transactions_staging
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM transactions_staging;

-- Load data from staging table to transactions table
INSERT INTO transactions (
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country
)
SELECT
    invoice_no,
    stock_code,
    description,
    CAST(quantity AS SIGNED) AS quantity,
    STR_TO_DATE(invoice_date, '%m/%d/%Y %H:%i') AS invoice_date,
    CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
    NULLIF(customer_id, '') AS customer_id,
    country
FROM transactions_staging
WHERE
    quantity REGEXP '^-?[0-9]+'
    AND unit_price REGEXP '^[0-9]+(\\.[0-9]+)?';


SELECT * FROM transactions;