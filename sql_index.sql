-- indexes : indexes is like a data structure,objects  which is use to access your data in a faster way.
 -- types of indexes
 -- 1 . clustur index
 -- 2. non clustur index
 
 use sakila;
 create table test100 as select actor_id, first_name from actor where actor_id between 1 and 10;
 drop table test100;
 insert into test100 values (14,'abc'),(13,'def'),(11,'aman'),(12,'rahul');
 
 -- non clustur ---
 create index indx1 on test100(actor_id);
 show index from test100;
 select * from test100;
 
 explain select * from test100 where actor_id = 5;
 insert into test100 values(12,'abs');
 insert into test100 values(15,'abc');
 
 show index from test100;
 
 explain select * from test100 where actor_id = 12;
 select * from test100
 
 -- index on 2 column
 create index indx_composite on test100(actor_id,first_name);
 show index from test100;
 
 explain select* from test100 where first_name = 'abc';
 -- ----------------
 
 select * from test100;
 insert into test100 values(16,'john'),(17,'bet');
 insert into test100 values(20,'john'),(21,'chris'),(22, 'matthe');

explain select * from test100 where actor_id = 21;

show index from test100;

drop index indx1 on test100;
create index index_3_char on test100(first_name(3));
explain select * from test100 where first_name = 'JOHNNY'; 
explain select * from test100 where first_name like 'Joh%'; 


 
 
 
 -- -------------------------------
 -- clustur index--
 -- alter statement 
  alter table test100 add primary key(actor_id); -- add key in table
  
  desc test100; 
  
  explain select * from test100 where actor_id = 5;
  
  -- There is only one clustur column in a table.
  
  
  
  
  
  
  
 
 
 
 