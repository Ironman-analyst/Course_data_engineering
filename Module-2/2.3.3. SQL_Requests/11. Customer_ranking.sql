select customer_name, count(order_id) as quantity, round(sum(profit),2) as amount
from orders o 
group by customer_name
order by sum(profit) desc
--What do you mean about customer_ranking? Ranking by profit? Here are TOP 10 by profit.
limit 10;