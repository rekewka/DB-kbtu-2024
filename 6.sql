create database lab6;

create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget int,
    location_id int references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    department_id int references departments
);

INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
('123 Main St', '12345', 'New York', 'NY'),
('456 Maple Ave', '67890', 'Los Angeles', 'CA'),
('789 Oak St', '54321', 'Chicago', 'IL'),
('101 Pine St', '98765', 'Houston', 'TX'),
('202 Cedar Rd', '13579', 'Phoenix', 'AZ');

INSERT INTO departments (department_name, budget, location_id)
VALUES
('Sales', 500000, 1),
('Marketing', 300000, 2),
('Engineering', 1000000, 3),
('HR', 200000, 4),
('Finance', 400000, 5);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
('John', 'Doe', 'johndoe@example.com', '123-456-7890', 60000, 1),
('Jane', 'Smith', 'janesmith@example.com', '123-555-7890', 70000, 2),
('Bob', 'Johnson', 'bobjohnson@example.com', '123-555-1234', 80000, 3),
('Alice', 'Williams', 'alicewilliams@example.com', '123-555-5678', 55000, 4),
('Tom', 'Brown', 'tombrown@example.com', '123-555-9101', 65000, 5);

--1
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
    join departments d on e.department_id = d.department_id;

--2
    select e.first_name, e.last_name, e.department_id, d.department_name from employees e
    left join departments d on e.department_id = d.department_id
    where e.department_id in (80, 40);

--3
select e.first_name, e.last_name, l.state_province from employees e
    join departments d on d.department_id = e.department_id
    join locations l on d.location_id = l.location_id;

--4
select d.department_name, e.first_name, e.last_name from departments d
    right join employees e on d.department_id = e.department_id;

--5
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
    left join departments d on e.department_id = d.department_id;