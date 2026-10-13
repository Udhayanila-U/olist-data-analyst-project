Use olist_analytics;

-- Q1. What is the total revenue?

SELECT sum(price) 
FROM olist_order_items_dataset;
