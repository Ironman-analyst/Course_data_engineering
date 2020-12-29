select region, sum(sales) as sales
from 
orders
group by region
order by sales desc;