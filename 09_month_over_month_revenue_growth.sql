-- month-over-month revenue growth (window function)

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        ROUND(SUM(p.payment_value)::NUMERIC, 2)         AS revenue
    FROM clean_orders o
    JOIN payments p USING(order_id)
    GROUP BY 1
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100
    , 2) AS mom_growth_pct
FROM monthly_revenue
ORDER BY month;