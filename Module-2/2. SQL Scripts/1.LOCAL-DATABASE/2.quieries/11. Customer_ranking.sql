select customer_name, count(order_id) as quantity, round(sum(profit),2) as amount
from orders o 
group by customer_name
order by sum(profit) desc
limit 10;