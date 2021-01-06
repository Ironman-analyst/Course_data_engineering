drop table if exists zx.orders_model;


-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** Orders

CREATE TABLE zx.Orders_model
(
 row_id       integer NOT null,
 people_id    varchar(10) NOT NULL,
 order_id     varchar(50) NOT NULL,
 segment_id   varchar(10) NOT NULL,
 ship_mode    varchar(50) NOT NULL,
 customer_id  varchar(50) NOT NULL,
 country      varchar(50) NOT NULL,
 city         varchar(50) NOT NULL,
 state        varchar(50) NOT NULL,
 postal_code  varchar(50)         , --varchar, because can start from 0
 product_id   varchar(50) NOT NULL,
 category     varchar(50) NOT NULL,
 subcategory  varchar(50) NOT NULL,
 product_name varchar(200) NOT NULL,
 sales        numeric(9,4) NOT NULL,
 quantity     integer NOT NULL,
 discount     numeric(4,2) NOT NULL,
 profit       numeric(21,16) NOT NULL,
 CONSTRAINT PK_orders_model PRIMARY KEY ( row_id ),
 CONSTRAINT FK_117 FOREIGN KEY ( people_id ) REFERENCES zx.People_model ( people_id ),
 CONSTRAINT FK_64 FOREIGN KEY ( segment_id ) REFERENCES zx.Segment_model ( segment_id )
 );

CREATE INDEX fkIdx_118 ON zx.Orders_model
(
 people_id
);

CREATE INDEX fkIdx_65 ON zx.Orders_model
(
 segment_id
);

-- Insertion data to table 'orders_model'

insert into zx.orders_model 
select 
	  100+row_number() over() as row_id
	  ,pm.people_id
	  ,order_id 
	  ,sm.segment_id
	  ,ship_mode 
	  ,customer_id 
	  ,country 
	  ,city 
	  ,state 
	  ,postal_code 
	  ,product_id 
	  ,category 
	  ,subcategory 
	  ,product_name 
	  ,sales 
	  ,quantity 
	  ,discount 
	  ,profit
from  public.orders po
inner join zx.people_model pm on po.region = pm.region 
inner join zx.segment_model sm on po.segment = sm.segment_name;

-- Addition column "returned"
 
alter table zx.orders_model add returned VARCHAR(5);


-- Update column "returned"

update zx.orders_model 
set returned = 'Yes'
where order_id = any(select order_id from zx.returns_model);

update zx.orders_model 
set returned = 'No'
where order_id != ALL(select order_id from zx.returns_model);


-- Checking combined table

select * 
from zx.orders_model om 
inner join zx.people_model pm
using (people_id)
inner join zx.segment_model sm
using (segment_id)
order by returned DESC;

