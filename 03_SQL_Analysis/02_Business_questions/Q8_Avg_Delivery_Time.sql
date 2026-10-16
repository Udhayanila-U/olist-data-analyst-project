Use olist_analytics;

-- Q8 . what is average delivery time?
select round(avg(timestampdiff(hour , order_purchase_timestamp,order_estimated_delivery_date)),2) avg_time
from olist_orders_dataset
where order_purchase_timestamp is not null and order_estimated_delivery_date is not null;

