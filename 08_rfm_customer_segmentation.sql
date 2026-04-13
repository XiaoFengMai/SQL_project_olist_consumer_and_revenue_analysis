-- Advanced Analysis
-- RFM (Recency, Frequency, Monetary), a classic marketing framework
-- Customer segmentation

WITH rfm_base AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp)              AS last_order_date,
        COUNT(DISTINCT o.order_id)                   AS frequency,
        ROUND(SUM(p.payment_value)::NUMERIC, 2)      AS monetary
    FROM clean_orders o
    JOIN customers c USING(customer_id)
    JOIN payments p USING(order_id)
    GROUP BY c.customer_unique_id
),
rfm_scores AS (
    SELECT *,
        -- Recency: days since last purchase (lower = better)
        CURRENT_DATE - last_order_date::DATE AS recency_days,

        -- Score each dimension 1-4
        NTILE(4) OVER (ORDER BY last_order_date DESC)  AS r_score,
        NTILE(4) OVER (ORDER BY frequency ASC)         AS f_score,
        NTILE(4) OVER (ORDER BY monetary ASC)          AS m_score
    FROM rfm_base
)
SELECT *,
    CASE
        WHEN r_score = 4 AND f_score >= 3 THEN 'Champion'
        WHEN r_score >= 3 AND f_score >= 2 THEN 'Loyal Customer'
        WHEN r_score >= 3 AND f_score = 1 THEN 'Recent Customer'
        WHEN r_score = 2                   THEN 'At Risk'
        WHEN r_score = 1 AND f_score >= 2  THEN 'Cant Lose Them'
        WHEN r_score = 1                   THEN 'Lost'
        ELSE 'Others'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;
