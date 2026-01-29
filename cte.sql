create database test90;
use test90;

CREATE TABLE employee (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(30),
    salary     INT,
    manager_id INT
);

INSERT INTO employee (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Alice',   'HR',      50000, NULL),
(2, 'Bob',     'HR',      45000, 1),
(3, 'Charlie', 'HR',      55000, 1),

(4, 'David',   'IT',      70000, NULL),
(5, 'Eva',     'IT',      65000, 4),
(6, 'Frank',   'IT',      72000, 4),
(7, 'Grace',   'IT',      68000, 4),

(8, 'Henry',   'Sales',   60000, NULL),
(9, 'Irene',   'Sales',   58000, 8),
(10,'Jack',    'Sales',   62000, 8);


select * from employee;

select department, avg(salary) from employee group by department;
-- correlated
select emp_id, emp_name,department,salary from employee as e
where salary>( select avg(salary) from employee where department=e.department);

-- cte
with cte as (
select department as dept, avg(salary) as deptsalary from employee group by department)

select  emp_id, emp_name,department,salary, dept, deptsalary
from employee as e join cte where e.department=cte.dept
and salary>deptsalary;






/*
Recursive CTE ->

*/

-- union -> combine two or more tables
-- -> also give duplicate for one time
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

-- union all -> it gives all values chahe duplicate ho ya nhi
-- -> number of column same hona chahiye
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select first_name, actor_id from sakila.actor where actor_id between 3 and 5;

with recursive cte as (
select 10 as num -- assigning values to this num column (startin point)
union all
select num+1 from cte -- cte call karna
where num<15 -- terminating condition (stop point)
)
select * from cte;

-- employee hierarchy
use regex;
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

select * from employees;

-- employee hierarchy
with recursive cte as (
select employeeid, name, name as hierarchy_path from employees where managerid is null
union all
select e.employeeid, e.name, concat(e.name, '->', cte.hierarchy_path) from employees as e
join cte where e.managerid=cte.employeeid and e.employeeid<5
)
select * from cte;

-- employee level
with recursive cte as (
select employeeid, name, 1 as level from employees where managerid is null
union all
select e.employeeid, e.name, level+1 from employees as e
join cte where e.managerid=cte.employeeid and e.employeeid<5
)
select * from cte;