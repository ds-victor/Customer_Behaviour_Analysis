# SQL Analytics – Customer Behavior Analysis

This repository contains an **advanced SQL analytics project** analyzing customer purchase behavior using real-world transactional data.  
The analysis uses advanced queries, window functions, and stored procedures to generate actionable insights about customer spending, frequency, and engagement patterns.

📌 **Dataset Source (excluded from repo due to size):**  
https://www.kaggle.com/datasets/carrie1/ecommerce-data

## 📌 Problem Statement

Retail businesses generate large volumes of customer transaction data. However, deriving **actionable insights** from this data requires structured analysis to understand:

- Which customers contribute the most revenue  
- How often customers purchase  
- Which customers have become inactive  
- How revenue is distributed across regions

This project uses **MySQL** to load, clean, transform, and analyze the transactional dataset, enabling data-driven decisions that support marketing, retention, and business strategy.

## 📁 Project Structure
```
Customer_Behaviour_Analysis/
│
├── data/ # (Ignored in GitHub; dataset link provided above)
│
├── sql/ # SQL scripts for schema, import, analysis
│ ├── 01_schema.sql
│ ├── 02_data_import.sql
│ ├── 03_advanced_queries.sql
│ └── 04_stored_procedures.sql
│
├── insights.md # Key findings & business insights
├── .gitignore
└── README.md
```

## 🧠 Tools & Technologies

✔ MySQL (local database)  
✔ SQL Analytics  
✔ Window functions (NTILE, SUM OVER)  
✔ Stored Procedures & Views  
✔ Command-line and Workbench workflows


## 🧰 Data Loading

1. Create a staging table to prevent import errors due to text issues, quotes, and encoding differences.
2. Load the raw CSV into the staging table.
3. Clean and cast fields into the analytical `transactions` table with proper types.
4. Create a clean view (`clean_transactions`) to apply business filters for analysis.


## 🧾 What You Will Find

### Advanced SQL Queries  
- Customer lifetime value (revenue)
- Purchase frequency
- RFM (Recency, Frequency, Monetary) analysis
- Top customers by revenue
- Inactive customer detection
- Country-level revenue distribution

### Stored Procedures  
- `customer_summary`
- `high_value_customers`
- `inactive_customers`


## 🚀 How to Use

1. Clone the repository.
2. Import the dataset into your local MySQL database using the provided SQL scripts.
3. Run the SQL scripts in order:
   - `01_schema.sql`
   - `02_data_import.sql`
   - `03_advanced_queries.sql`
   - `04_stored_procedures.sql`
4. Explore insights using custom queries or by executing stored procedures.


## 📌 Benefits of This Project

✔ Demonstrates advanced SQL skills  
✔ Shows understanding of data cleaning and transformation  
✔ Uses window functions and stored procedures  
✔ Projects real business insights from raw transaction data  
✔ Perfect for SQL / Data Analyst portfolios


