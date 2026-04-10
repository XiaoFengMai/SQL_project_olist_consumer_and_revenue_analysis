-- who are our top 20 customers by total spending?

SELECT		-- starts the query
	c.customer_unique_id,		-- refers to the customers table (c) and true identifier for a customer (customer_unique_id)
	c.customer_city,			-- city that the customer is from
	c.customer_state,			-- state that the customer is from (useful for spotting geographic patterns)
	COUNT(DISTINCT o.order_id) 			AS total_orders,		-- counts rows, ensures each order is counted even if there are multiple payments, labels the column total_orders; tells you if a customer placed one big order or many orders over time.
	ROUND(SUM(p.payment_value)::NUMERIC, 2) AS total_spent		-- adds up every payment the customer has mdoe, converts to numeric type, rounds to two decimal places, labels column "total_spent"

FROM clean_orders o		-- starts with your clean view, delivered orders only, o is shorthand for clean_orders
JOIN customers c USING(customer_id)		-- connects the customers table, c is short for customers, joins where customer_id matches in both tables
JOIN payments p USING(order_id)

GROUP BY 1, 2, 3		-- groups by 1st, 2nd, and 3rd columns in SELECT which are customer_unique_id, customer_city, customer_state. this means that SUM and COUNT calculate per customer rather than across all daat. any column in select that isnt aggregated (sum, count, avg) must appear in groupby.

ORDER BY total_spent DESC		-- sorts results by the total_spent column, highest spender appears first

LIMIT 20;		-- only returns the top 20 rows; we ordered by total_spent DESC so the 20 highest spenders are displayed


