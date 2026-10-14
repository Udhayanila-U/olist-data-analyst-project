Use olist_analytics;


-- Q5 . which product category generate the highest revenue?

SELECT p.product_category_name as pcat , round(sum(oi.price),2) as revenue
FROM olist_products_dataset p
join olist_order_items_dataset oi
on p.product_id = oi.product_id
group by pcat
order by revenue desc;

SELECT  pcat
FROM( 
SELECT p.product_category_name as pcat , round(sum(oi.price),2) as revenue
FROM olist_products_dataset p
join olist_order_items_dataset oi
on p.product_id = oi.product_id
group by pcat
order by revenue desc) as high_revenue_list
limit 1;