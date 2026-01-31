
/*
VIEW =>
this is a virtual table
       
these are not store the data physically but will access the existing table
        advantages
make complex query easy
            helps in security
           
types

*/

use regex1;
create table newactor as
select actor_id, first_name from sakila.actor where actor_id between 1 and 3;

select * from newactor;

create view actor_v as -- create view here for the query
select *, substr(first_name,2) from newactor;

select * from actor_v;

select * from newactor; -- 3 rows 2 columns
insert into newactor values(4,'Riya'); -- 4 rows
select * from newactor;

select * from actor_v;


-- simple view -> any dml change will be visible on the originall table where view is created
create view actor_v2 as   -- created view here for the query
select * from newactor where actor_id in (1,2);

select * from newactor;

insert into newactor values(5,'sakshi');

select * from actor_v2;

/*
1️.Simple VIEW =>
Single table
No aggregation
Updatable

-- 2️.Complex VIEW =>
Multiple tables
JOIN, GROUP BY
Not updatable
        -> if view contains aggregate function, distinct, group by, having, union, union all, subquery, joins
*/

create table new_payments as
select payment_id, amount from sakila.payment where payment_id between 1 and 7;

select * from new_payments;

create view payment_v as
select count(*) from new_payments;

select * from payment_v;
insert into payment_v values(10); -- give error bcz complex view can not insert anything inside this