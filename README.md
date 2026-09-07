 E-Commerce Sales & Customer Analytics

📌 Project Overview

This project analyzes e-commerce sales data to identify insights related to sales performance, customer behavior, product performance, payment preferences, and revenue trends.

The project uses Python for data cleaning and exploratory data analysis and PostgreSQL for structured business analysis using SQL queries.

The goal is to transform raw transactional data into meaningful insights that can support data-driven business decisions.



🎯 Business Problem

An e-commerce company wants to better understand its sales performance and customer purchasing behavior.

The analysis focuses on identifying key revenue trends, high-performing products and categories, customer purchasing patterns, payment preferences, returns, and regional performance.



🎯 Project Objectives

The project aims to answer the following business questions:

📈 Sales Performance

- How does revenue change over time?
- Which months generate the highest revenue?
- What is the average order value?
- How does revenue vary across different days of the week?

📦 Product Analysis

- Which product categories generate the highest revenue?
- Which products generate the highest sales?
- Which categories have the highest profit percentage?
- Which products have the highest quantity sold?
- How are categories ranked based on revenue?

👥 Customer Analysis

- Who are the top customers based on spending?
- How many unique customers are present?
- How does customer spending vary across different age groups?

💳 Payment Analysis

- Which payment methods generate the highest revenue?
- What is the average order value for each payment method?
- Which payment methods are most frequently used?

🔄 Returns Analysis

- What percentage of orders are returned?
- How does revenue differ between returned and non-returned orders?

🌍 Regional Analysis

- Which regions generate the highest revenue and profit?
- How does sales performance vary across different regions?



🛠️ Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn

- **PostgreSQL**
  - Data aggregation
  - GROUP BY
  - CASE statements
  - Common Table Expressions (CTEs)
  - Window Functions
  - RANK()
  - LAG()

- **GitHub**
- **Jupyter Notebook**
- **Power BI** *(Dashboard development)*



🔄 Project Workflow

Raw Data  
↓  
Data Cleaning & Preprocessing using Python  
↓  
Exploratory Data Analysis (EDA)  
↓  
PostgreSQL Database  
↓  
SQL Business Analysis  
↓  
Power BI Dashboard  
↓  
Business Insights & Recommendations



📂 Project Structure

```text
ecommerce-sales-customer-analytics/
│
├── data/
│   ├── raw/
│   │   └── ecommerce_sales.csv
│   │
│   └── cleaned/
│       └── ecommerce_sales_cleaned.csv
│
├── python/
│   └── Ecommerce_Sales_Customer_Analysis.ipynb
│
├── sql/
│   ├── 01_database_schema.sql
│   └── 02_data_analysis.sql
│
├── powerbi/
│   └── ecommerce_analytics_dashboard.pbix
│
├── images/
│   ├── dashboard_overview.png
│   └── data_model.png
│
└── README.md
