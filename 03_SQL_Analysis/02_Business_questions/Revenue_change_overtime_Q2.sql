Use olist_analytics;

-- Q2.How does revenue change over time?

SELECT date_format(o.order_purchase_timestamp,'%y-%m') month ,
ROUND(SUM(oi.price),2) as REVENUE
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
WHERE o.order_purchase_timestamp IS NOT NULL
GROUP BY date_format(o.order_purchase_timestamp,'%y-%m')
ORDER BY month;


-- WITH LIMIT
 
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(oi.price) ,2) AS revenue
FROM olist_orders_dataset AS o
JOIN olist_order_items_dataset AS oi
    ON o.order_id = oi.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01'
  AND o.order_purchase_timestamp < '2017-02-01'
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY month;