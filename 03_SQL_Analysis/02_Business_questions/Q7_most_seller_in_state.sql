Use olist_analytics;

-- Q7 . which state have the most sellers?

select c.customer_state c_sta , count(distinct oi.seller_id) no_of_sellers
from olist_customers_dataset c
join olist_orders_dataset o
on c.customer_id=o.customer_id
join olist_order_items_dataset oi
on o.order_id=oi.order_id
group by c_sta
order by no_of_sellers desc
limit 1;