select round(sum(sales)/count(distinct(customer_name)),2) as sales_per_customer
from orders;