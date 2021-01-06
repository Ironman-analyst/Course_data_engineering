select round(SUM(profit)/count(order_id)*100,2) as profit_ratio
from orders;


