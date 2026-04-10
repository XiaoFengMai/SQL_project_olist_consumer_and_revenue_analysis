SELECT		-- starts the query
	DATE_TRUNC('month', o.order_purchase_timestamp) AS month,		-- rounds a timestamp down to the first day of the month according to the date the order was placed and renames the column to month as the result 
	COUNT(DISTINCT o.order_id)						AS total_orders,		-- counts rows, ensures each order is counted once even if it has multiple payments, and labels column as total_orders	
	ROUND(SUM(p.payment_value)::NUMERIC, 2)			AS total_revenue,		-- adds up all payment values for that month, converts to a 2 decimal number, labels the column total_revenue
	ROUND(AVG(p.payment_value)::NUMERIC, 2)			AS avg_order_value		-- averages the payment value for that month, converts to a 2 decimal number, labels the column "avg_order_value"
FROM clean_orders o					-- uses clean view, delivered orders only, no NULL timestamps, and o is a shorthand alias for o.order_purchase_timestamp
JOIN payments p USING(order_id)		-- JOIN payments connects the payments table to orders, p is shorthand for payment table, joins where order_id matches in both tables
-- join payments because revenue data (payment value) lives in the payments table, not orders

GROUP BY 1		-- groups results by the first column in the SELECT, which is month
ORDER BY 1;		-- sorts results by the first column (month) in ascending order