--audits data and check row counts for easier usability

SELECT 'orders' AS table_name, COUNT(*) FROM orders 	-- creates two columns, "table_name" and "count", first row contains "orders" and # or orders
UNION ALL SELECT 'customers', count(*) FROM customers		-- UNION ALL stacks the result of each SELECT into one list under first row "orders"
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items		-- count provides the number of each thing under the count columnm
UNION ALL SELECT 'payments', COUNT(*) FROM payments
UNION ALL SELECT 'products', COUNT(*) FROM products;


-- check for NULLs in critical columns
SELECT
	COUNT(*) AS total,	 -- counts all rows including nulls, total # of rows
	COUNT(order_id) AS has_order_id,	  -- counts only rows where order_id is NOT null, names it has_order_id
	COUNT(customer_id) AS has_customer_id,		-- counts only rows where customer_id is NOT null, names it has_customer_id
	COUNT(order_purchase_timestamp) AS has_timestamp,	-- counts only rows where timestamp is NOT null, names it has_timestamp
	COUNT(order_status) AS has_status		-- counts only rows where status is NOT null, names it, has_status
FROM orders;


-- check order statuses
SELECT order_status, COUNT(*) AS count		-- pulls each unique status value, counts how many orders have each status
FROM orders		-- from orders table 
GROUP BY order_status		-- groups rows together by their status value
ORDER BY count DESC;		-- shows the most common status first

	
