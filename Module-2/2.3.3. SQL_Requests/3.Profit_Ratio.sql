select round(SUM(profit)/sum(sales)*100,2) as profit_ratio
from orders;