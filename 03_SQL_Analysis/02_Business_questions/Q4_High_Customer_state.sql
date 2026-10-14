Use olist_analytics;

-- Q4 . which state have the most customers?

SELECT customer_state , count(distinct customer_unique_id) as total_customers
from olist_customers_dataset
group by customer_state
order by total_customers desc;

SELECT Customer_state
FROM (SELECT Customer_state ,count(distinct customer_unique_id) as total_customers
from olist_customers_dataset
group by customer_state
order by total_customers desc) as state_summary
limit 1;