
--Q1:
select e.*, j.job_title, d.department_name 
from employee e 
inner join job j on e.job_id = j.job_id 
inner join department d on d.department_id = e.department_id 

--Q2 :
INSERT INTO Job (job_id, job_title) values (11, 'Web Programmer');

--Q3:
update job 
set job_title = 'web developer'
where job_title = 'Web Programmer';

--Q4:
delete from job
where job_title = 'web developer';

--Q5:
select department_id, count(*)
from employee e 
group by department_id;

--Q6:
select e.emp_nm, j.job_title, d.department_name, e2.emp_nm as manager_name, e.start_date, e.end_date from employee e
inner join job j on j.job_id = e.job_id 
inner join department d  on d.department_id = e.department_id 
inner join employee e2 on e.manager_id = e2.emp_id 
where e.emp_nm = 'Toni Lembeck';