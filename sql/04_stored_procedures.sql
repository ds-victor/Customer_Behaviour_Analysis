USE customer_db;

-- Customer Purchase Summary
DELIMITER //

CREATE PROCEDURE customer_summary(IN p_customer_id INT)
BEGIN
    SELECT
        customer_id,
        COUNT(DISTINCT invoice_no) AS total_orders,
        ROUND(SUM(revenue), 2) AS total_spend,
        MAX(invoice_date) AS last_purchase
    FROM clean_transactions
    WHERE customer_id = p_customer_id
    GROUP BY customer_id;
END //

DELIMITER ;

-- Example usage
CALL customer_summary(17850);

-- High-Value Customers (Dynamic Revenue Threshold)
DELIMITER //

CREATE PROCEDURE high_value_customers(IN min_revenue DECIMAL(10,2))
BEGIN
    SELECT
        customer_id,
        ROUND(SUM(revenue), 2) AS total_revenue
    FROM clean_transactions
    GROUP BY customer_id
    HAVING SUM(revenue) >= min_revenue
    ORDER BY total_revenue DESC;
END //

DELIMITER ;


-- Example usage
CALL high_value_customers(5000);


-- Inactive Customers (Dynamic Days)
DELIMITER //

CREATE PROCEDURE inactive_customers(IN inactive_days INT)
BEGIN
    SELECT
        customer_id,
        MAX(invoice_date) AS last_purchase_date
    FROM clean_transactions
    GROUP BY customer_id
    HAVING MAX(invoice_date) < CURRENT_DATE - INTERVAL inactive_days DAY;
END //

DELIMITER ;

-- Example use case
CALL inactive_customers(120);


-- Performance Optimization
CREATE INDEX idx_customer_id ON transactions(customer_id);
CREATE INDEX idx_invoice_date ON transactions(invoice_date);
CREATE INDEX idx_country ON transactions(country);


