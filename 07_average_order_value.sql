-- Overall average order value
SELECT ROUND(AVG(payment_value)::NUMERIC, 2) AS overall_aov
FROM payments
WHERE order_id IN (SELECT order_id FROM clean_orders);

-- average order value by payment type
SELECT
    payment_type,
    COUNT(*)                                 AS transactions,
    ROUND(AVG(payment_value)::NUMERIC, 2)    AS avg_value,
    ROUND(SUM(payment_value)::NUMERIC, 2)    AS total_value
FROM payments
WHERE order_id IN (SELECT order_id FROM clean_orders)
GROUP BY payment_type
ORDER BY total_value DESC;