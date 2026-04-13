-- Create clean view for analysis
CREATE VIEW clean_orders as			-- creates a reusable view named clean_orders
SELECT * 			-- selects all columns from the orders table
FROM orders			-- pulls from your raw orders table
WHERE order_status = 'delivered'		--only keeps orders that were actually delivered
  AND order_purchase_timestamp IS NOT NULL;		-- removes any rows with missing date, only keeps rows with timestamps, needed for time-based analysis


-- Verify
SELECT COUNT(*) FROM clean_orders; -- Should be ~96k rows
