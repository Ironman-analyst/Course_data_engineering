CREATE schema zx;

drop table if exists zx.people_model;


-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** People

CREATE TABLE zx.people_model
(
 people_id varchar(10) not null,
 region varchar(50) NOT NULL,
 person varchar(50) NOT null,
CONSTRAINT PK_people_model PRIMARY KEY ( people_id ) 
);

select * from zx.people_model;


insert into zx.people_model
select 
	  100+row_number() over() as people_id
	  ,region
	  ,person
from public.people;


select * from zx.people_model;



