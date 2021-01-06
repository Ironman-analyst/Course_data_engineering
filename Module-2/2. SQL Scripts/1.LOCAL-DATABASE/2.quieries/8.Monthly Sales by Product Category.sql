select extract(month from date(order_date)) as month,category, sum(sales)
from orders
group by month,category
order by month, category;
