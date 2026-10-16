Use olist_analytics;


-- Q11. Is there a relationship between delivery performance and review scores?

select rs.review_score , round(avg(datediff(o.order_estimated_delivery_date , o.order_purchase_timestamp)),2) as avg_days
from olist_orders_dataset o 
join olist_order_reviews_dataset rs
on o.order_id=rs.order_id
WHERE o.order_delivered_customer_date IS NOT NULL

group by review_score
order by avg_days;