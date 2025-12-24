USE customer_db;

SELECT * FROM transactions;
-- Create Clean Analytics View
CREATE OR REPLACE VIEW clean_transactions AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    quantity * unit_price AS revenue
FROM transactions
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND unit_price > 0
  AND invoice_no NOT LIKE 'C%';
  
  -- Customer Lifetime Value (CLV)
  SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS lifetime_value
FROM clean_transactions
GROUP BY customer_id
ORDER BY lifetime_value DESC;


-- Purchase Frequency per Customer
SELECT
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders
FROM clean_transactions
GROUP BY customer_id
ORDER BY total_orders DESC;

-- RFM Metrics (Recency, Frequency, Monetary)
SELECT
    customer_id,
    MAX(invoice_date) AS last_purchase_date,
    COUNT(DISTINCT invoice_no) AS frequency,
    ROUND(SUM(revenue), 2) AS monetary_value
FROM clean_transactions
GROUP BY customer_id;

-- Top 10% Customers by Revenue
SELECT customer_id, total_revenue
FROM (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue,
        NTILE(10) OVER (ORDER BY SUM(revenue) DESC) AS revenue_bucket
    FROM clean_transactions
    GROUP BY customer_id
) t
WHERE revenue_bucket = 1;


-- Inactive Customers (No Purchase in Last 90 Days)
SELECT
    customer_id,
    MAX(invoice_date) AS last_purchase_date
FROM clean_transactions
GROUP BY customer_id
HAVING MAX(invoice_date) < CURRENT_DATE - INTERVAL 90 DAY;


-- Country-wise Revenue Contribution
SELECT
    country,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        SUM(SUM(revenue)) OVER (), 2
    ) AS revenue_percentage
FROM clean_transactions
GROUP BY country
ORDER BY total_revenue DESC;







