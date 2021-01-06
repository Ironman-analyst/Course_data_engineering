select extract(month from date(order_date)) as month,segment, sum(sales)
from orders
group by segment,month
order by month, segment;
