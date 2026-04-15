------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 🛒 E-Commerce Customer & Revenue Analytics | SQL

---

## 🤔 What Is This Project?

Imagine you work for a huge online shop — like Amazon, but in Brazil. The shop has hundreds of thousands of orders, customers, and products. Your job is to look at all that data and answer important questions like:

- 💰 Which customers spend the most money?
- 📅 Which months had the most sales?
- 🏆 Which product types are most popular?
- ⚠️ Which customers might stop shopping with us?

This project uses real data from **Olist** — Brazil's largest e-commerce platform — and **SQL** (a language for talking to databases) to answer all these questions.

---

## 🧰 What You Will Need

| Tool | What It Does | Where To Get It |
|---|---|---|
| PostgreSQL 18 | The database that stores all your data | postgresql.org/download |
| pgAdmin 4 | A visual tool to manage your database | Comes with PostgreSQL |
| Kaggle Account | Where you download the dataset | kaggle.com |

---

## 📦 The Data — What Are We Working With?

Think of the data like a collection of spreadsheets (called tables) that all connect to each other:

| Table Name | What It Contains | Number of Rows |
|---|---|---|
| `customers` | Information about each customer (name, city, state) | ~99,000 |
| `orders` | Every order placed — when it was bought, its status | ~99,000 |
| `order_items` | Every individual item inside each order | ~112,000 |
| `products` | Details about each product (category, weight, size) | ~32,000 |
| `payments` | How each order was paid and how much | ~103,000 |
| `category_translation` | Translates product categories from Portuguese to English | ~71 |

---

## 🏗️ Phase 1: Setting Up Your Database

> Think of this phase like building empty filing cabinets before putting any files in them.

### Step 1: Create Your Database

Open pgAdmin 4 from your Start menu. In the left panel you will see **Databases**. Right-click on it and select:

```
Create → Database → type 'olist_ecommerce' → Save
```

You have just created an empty database — like an empty folder that will hold all your data.

### Step 2: Create Your Tables

Open the Query Tool (the pencil icon at the top) and run:

```
01_create_tables.sql
```

This script creates 6 empty tables inside your database. You will see this message when it works:

```
CREATE TABLE
CREATE TABLE
CREATE TABLE  (repeats 6 times)

Query returned successfully.
```

> ⚠️ **Important:** No data has been loaded yet — the tables are completely empty at this point. That comes next!

---

## 📥 Phase 2: Loading Your Data

> Think of this phase like printing out thousands of records and filing them into your empty filing cabinets.

### Step 3: Download the Dataset

Go to [kaggle.com](https://kaggle.com) and search for **"Brazilian E-Commerce Public Dataset by Olist"**. Download the zip file (~45MB) and unzip it to your Desktop. You should see these files:

- 📄 olist_customers_dataset.csv
- 📄 olist_orders_dataset.csv
- 📄 olist_order_items_dataset.csv
- 📄 olist_products_dataset.csv
- 📄 olist_order_payments_dataset.csv
- 📄 product_category_name_translation.csv
- <img width="861" height="267" alt="image" src="https://github.com/user-attachments/assets/b672a0ee-a1cc-4bc8-b256-c17141fde9c4" />

> 💡 **Tip:** Rename these files to simple names like `customers.csv`, `orders.csv` etc. This prevents errors when importing.

### Step 4: Import Each CSV File

For each table, follow these steps in pgAdmin:

1. Right-click the table name in the left panel
2. Click **Import/Export Data**
3. Click the folder icon and select the matching CSV file
4. Under the **Options** tab, make sure **Header is turned ON**
5. Click **OK** and wait for the green **Finished** message
6. <img width="1920" height="1032" alt="image" src="https://github.com/user-attachments/assets/3bf6eac3-552a-4b0a-99c5-c7f6a5179f24" />

| Table in pgAdmin | CSV File to Select |
|---|---|
| `customers` | customers.csv |
| `orders` | orders.csv |
| `order_items` | order_items.csv |
| `products` | products.csv |
| `payments` | payments.csv |
| `category_translation` | product_category_name_translation.csv |

---

## 🚨 Common Errors and How to Fix Them

| Error Message | What It Means | How to Fix It |
|---|---|---|
| `duplicate key value` | Table already has data in it | Run `TRUNCATE TABLE tablename CASCADE;` then import again |
| `extra data after last expected column` | Wrong CSV file selected | Browse and pick the correct CSV file for that table |
| `invalid input syntax for type integer` | Header toggle is OFF | Go back to Import, turn Header ON under Options tab |
| `permission denied` | PostgreSQL can't access the file location | Move your CSV files to the Desktop and try again |

---

## 🧹 Phase 3: Cleaning Your Data

Before analyzing, we need to make sure the data is clean and ready. Run:

```
02_data_audit.sql
```

This script checks three things:
- ✅ How many rows are in each table (should match the numbers above)
- ✅ Whether any important columns have missing values
- ✅ What order statuses exist (delivered, cancelled, shipped etc.)

Then run this script to create a clean view of only delivered orders:

```
03_create_clean_view.sql
```

This creates something called `clean_orders` — a filtered version of your orders table that only includes completed, delivered orders. Think of it as a **lens** that only shows you the orders worth analyzing.

> ✅ When you run the verification query you should see approximately **96,000 rows**.

---

## 📊 Phase 4: Answering Business Questions
 
Now the fun part! Run each script below to answer a specific business question:
 
| Script | Business Question | What You Will See |
|---|---|---|
| `04_monthly_revenue_trends.sql` | What are our monthly revenue trends? | A table showing revenue, orders and average order value for each month |
| `05_top_customers.sql` | Who are our top 20 customers? | A ranked list of customers by total spending |
| `06_best_performing_categories.sql` | Which product categories make the most money? | Top 15 categories ranked by total revenue |
| `07_average_order_value.sql` | What is our average order value? | Overall AOV plus breakdown by payment type |
| `08_rfm_customer_segmentation.sql` | Which customers are loyal vs at risk? | Every customer labeled as Champion, Loyal, At Risk, Lost etc. |
 
---

---

## 💡 Key Insights

- 📈 Revenue grew approximately **3x** between January and November 2017 — driven by Black Friday
- 🏆 **Health and Beauty** is typically the #1 revenue category
- ⚠️ Around **60% of customers** never place a second order — a big churn problem
- 💳 **Credit card users** tend to spend about 2x more per order than boleto (bank slip) users
- 🗺️ Most top customers are located in **São Paulo** — Brazil's largest city

---

## 📁 Final File Structure

```
ecommerce-sql-analysis/
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_data_audit.sql
│   ├── 03_create_clean_view.sql
│   ├── 04_monthly_revenue_trends.sql
│   ├── 05_top_customers.sql
│   ├── 06_best_performing_categories.sql
│   ├── 07_average_order_value.sql
│   └── 08_rfm_customer_segmentation.sql
│
├── results/
│   ├── monthly_revenue.png
|   ├── top_customers.png     
│   └── other screenshots...
│
└── README.md                      ← this file
```

---

## 🛠️ Tools Used

| Tool | Version | Purpose |
|---|---|---|
| PostgreSQL | 18 | Database to store and query data |
| pgAdmin | 4 | Visual interface to manage the database |
| SQL | Standard | Language used to write all queries |
| Kaggle | N/A | Source of the dataset |

---


*Dataset credit: Olist, the largest department store in Brazilian marketplaces. Data made publicly available on Kaggle under the CC BY-NC-SA 4.0 licence.*
