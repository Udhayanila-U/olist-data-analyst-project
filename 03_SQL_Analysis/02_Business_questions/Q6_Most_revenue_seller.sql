Use olist_analytics;

-- Q6 . Which seller generate the most revenue?

select s.seller_id , round(sum(oi.price) , 2) as revenue
from olist_sellers_dataset s
join olist_order_items_dataset oi
on s.seller_id=oi.seller_id
group by seller_id
order by revenue desc ;

select seller_id 
from (select s.seller_id , round(sum(oi.price) , 2) as revenue
from olist_sellers_dataset s
join olist_order_items_dataset oi
on s.seller_id=oi.seller_id
group by seller_id
order by revenue desc ) as revenue_list
limit 1;
