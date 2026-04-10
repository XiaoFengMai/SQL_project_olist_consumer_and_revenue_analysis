-- churn risk customers

WITH last_orders AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_purchase,
        COUNT(DISTINCT o.order_id)      AS total_orders,
        SUM(p.payment_value)            AS total_spent
    FROM clean_orders o
    JOIN customers c USING(customer_id)
    JOIN payments p USING(order_id)
    GROUP BY c.customer_unique_id
)
SELECT *,
    (SELECT MAX(order_purchase_timestamp) FROM clean_orders) - last_purchase AS days_inactive,
    CASE
        WHEN last_purchase < (SELECT MAX(order_purchase_timestamp) FROM clean_orders) - INTERVAL '180 days'
        THEN 'Churn Risk'
        ELSE 'Active'
    END AS status
FROM last_orders
ORDER BY days_inactive DESC;