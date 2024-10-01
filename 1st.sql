CREATE DATABASE lab1;

create table users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users
ADD isadmin INT DEFAULT 0;


create table tasks(
    id SERIAL,
    name varchar(50),
    user_id int
);

alter table tasks
alter column name
set default  '5';

drop table tasks
drop database lab1


