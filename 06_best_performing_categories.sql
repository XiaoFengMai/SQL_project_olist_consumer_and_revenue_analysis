-- best performing product categories
-- which product categories generate the most revenue?
-- ranks  top 15 categories by total revenue, showing order count and average price


-- starts the query, everything below is what we want to display in results
SELECT


-- coalesce(...) returns the first non-NULL value from a list of options)
-- first choice is the english translation of the category name hence the t.product...english
-- second choice falls back to the portuguese name if no english translation exists, hence the p.product...name
-- 'Unknown' is the last resort if both the first and second choice are null.
-- category names in product tables are in portuguese, translation converts them to english, but not every category has a translation so CAOLESCE handles those gaps.
COALESCE (t.product_category_name_english, p.product_category_name, 'Unknown') AS category,


-- counts unique orders containing items from this category
-- prevents double counting orders and labels column "total_orders"
COUNT(DISTINCT oi.order_id) AS total_orders,


-- SUM(oi.price) adds up all item prices for (oi.price) the price of individual items, this comes from order_items
-- we use oi.price instead of p.payment_value because we want item-level revenue by one category, payment value can also include freight and other categories
-- ::NUMERIC converts to numeric value so round works correctly
-- ROUND(... , 2) rounds to 2 decimal places
-- AS total_revenue labels the column "total_revenue"
ROUND(SUM(oi.price)::NUMERIC, 2) AS total_revenue,


-- AVG(oi.price) calculates the average item price for this category
-- ::NUMERIC type converts to number for ROUND
-- ROUND(... , 2) rounds two decimal places
-- AS avg_price labels the column "avg_price"
-- tells whether a category wins on volume (many cheap items) or value (fewer expensive items))
ROUND(AVG(oi.price)::NUMERIC, 2) AS avg_price


-- FROM clean_orders starts with delivered orders only from your clean view
-- o is shorthand for clean_orders
FROM clean_orders o


-- JOIN order_items connects the order_items table
-- oi is short for order_items
-- USING(order_id) joins where order_id matches in both clean_orders and order_items
-- this is needed to get the product_category name for each item
JOIN order_items oi USING (order_id)

-- connects the order_items table, oi short for order_items, USING(order_id) joins where order_id matches in both clen_orders and product_id
JOIN products p using(product_id)


-- left join keeps all rows from products even if no translation exists
-- a regular join would drop any product whose category has no english translation, left join keeps them
-- category_translation is the table mapping portuguese to english names
-- t is shorthand for category_translation value
-- USING(product_category_name) joins where category matches products table (which has product_category_name in portuguese (p)) and category_translation table (which has the portuguese name (p) and english translation (t))
LEFT JOIN category_translation t USING(product_category_name)


GROUP BY 1		-- all values (revenue/orders/avg_price) of the same category are grouped into each row output


ORDER BY total_revenue DESC		-- sorts by total revenue from highest to lowest so most profitable category appears first


LIMIT 15;		-- returns only the top 15 categories by revenue.







