Create table Employee(
id int,
emp_id varchar(100),
emp_nm varchar(100),
email varchar(100),
hire_date Date,
job_id int,
salary decimal,
department_id int,
manager_id varchar(100),
start_date date,
end_date date,
location varchar(100),
address varchar(100),
city varchar(100),
state varchar(100),
education_id int,
primary key (id)
);

Create table Job(
job_id int,
job_title varchar(100),
primary key (job_id)
);

Create table Education(
education_id int,
education_level varchar(100),
primary key (education_id)
);

Create table Department(
department_id int,
department_name varchar(100),
primary key (department_id)
);

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_job FOREIGN KEY (job_id) REFERENCES job (job_id);

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department (department_id);

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_education FOREIGN KEY (education_id) REFERENCES Education (education_id);