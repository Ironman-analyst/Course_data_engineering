drop table if exists zx.segment_model;


-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** Segment

CREATE TABLE zx.segment_model
(
 segment_id   varchar(10) NOT NULL,
 segment_name varchar(50) NOT NULL,
 CONSTRAINT PK_segment_model PRIMARY KEY ( segment_id )
);

insert into zx.segment_model
select 
	  100+row_number() over() as segment_id
	 ,segment 
from (select distinct segment from public.orders) query_in;

select * from zx.segment_model;




