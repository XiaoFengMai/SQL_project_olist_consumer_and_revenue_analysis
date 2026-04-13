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
7. 
8. 
9. Run scripts in order: 01 → 06

