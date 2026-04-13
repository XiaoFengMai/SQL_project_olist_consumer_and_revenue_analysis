# SQL_project_olist_consumer_and_revenue_analysis
consumer and revenue analysis of olist brazilian e-commerce dataset


# 🛒 E-Commerce Revenue & Customer Analysis (SQL)

## Business Context
Analyzed 100k+ orders from Brazil's largest e-commerce platform
to identify revenue trends, top customers, and churn risk.

## Dataset
- Source: Olist Brazilian E-Commerce (Kaggle)
- Size: ~100k orders, 9 tables
- Period: 2016–2018

## Business Questions Answered
1. What are monthly revenue trends?
2. Who are the top customers by spend?
3. Which product categories generate most revenue?
4. What is the average order value by payment type?
5. Which customers are at risk of churning?

## Key Insights
- Revenue grew 3x from Jan 2017 to Nov 2017
- Health & Beauty is the #1 category by revenue
- 60% of customers never re-ordered (churn opportunity)
- Credit card users have 2x higher AOV than boleto users

## Tools Used
PostgreSQL, pgAdmin 4

## How to Run
1. Download and setup PostgreSQL and pgAdmin 4.
2. Download the olist ecommerce dataset: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce?resource=download
3. Create a PostgreSQL database named `olist_ecommerce`
4. Go to tools in the olist ecommerce database, add a Query Tool. Put content of 01_olist_create_tables.sql into new Query Tool and run it.
5. Unzip the dataset downloaded in step 2: <img width="861" height="267" alt="image" src="https://github.com/user-attachments/assets/b672a0ee-a1cc-4bc8-b256-c17141fde9c4" />
6. Import CSVs
to manually import the data into the tables created refer to image below. do that for each of the tables. adjust the header toggle (under options) on or off if an error pops up. select the appropriate file where data of the file should match the table name. example: for the order items table in the olist database, import the "olist_order_items_dataset.csv".
<img width="1920" height="1032" alt="image" src="https://github.com/user-attachments/assets/3bf6eac3-552a-4b0a-99c5-c7f6a5179f24" />
7. Create new Query Tools for each of the scripts 01 → 10 and put content from each script into a Query Tool.
8. Run the scripts in order to generate charts and gather necessary insights.

