drop table if exists zx.returns_model;


-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** Returns

CREATE TABLE zx.returns_model
(
 order_id varchar(50) NOT NULL,
 CONSTRAINT PK_returns_model PRIMARY KEY ( order_id )
);


insert into zx.returns_model

select distinct order_id 
from public.returns;

select * from zx.returns_model rm;
