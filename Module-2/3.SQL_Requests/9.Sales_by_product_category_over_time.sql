select category, sum(sales) as amount
from orders
group by category
order by amount desc;

