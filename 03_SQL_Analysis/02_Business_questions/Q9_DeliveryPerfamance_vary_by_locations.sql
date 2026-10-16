use olist_analytics;

-- Q9.how does delivery performance vary by loctaion?
select c.customer_state location , round(avg(datediff(o.order_estimated_delivery_date,o.order_purchase_timestamp)) ,2) delivery_performance
from olist_customers_dataset c
join olist_orders_dataset o
on c.customer_id=o.customer_id
where order_purchase_timestamp is not null and order_estimated_delivery_date is not null
group by location
order by delivery_performance;