use olist_analytics;

-- Q10.What is the distribution of customer review scores?

select review_score , count(*) total_review
from olist_order_reviews_dataset
WHERE review_score IS NOT NULL
group by review_score
order by review_score;