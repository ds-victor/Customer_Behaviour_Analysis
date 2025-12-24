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

## 📁 Project Structure

