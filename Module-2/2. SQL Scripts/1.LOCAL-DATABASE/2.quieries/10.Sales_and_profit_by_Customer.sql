select distinct(customer_name) as customer, sum(sales) as sales, sum(profit) as profit
from 
orders
group by customer
order by profit desc;