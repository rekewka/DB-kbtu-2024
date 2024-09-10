CREATE DATABASE lab1;

create table users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users
ADD isadmin INT DEFAULT 0;

ALTER TABLE users
alter column isadmin drop default

ALTER TABLE users
ALTER COLUMN isadmin
TYPE boolean using isadmin::boolean;

ALTER TABLE users
ALTER column isadmin set default false
ALTER TABLE users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);

create table tasks(
    id SERIAL,
    name varchar(50),
    user_id int
);

drop table tasks
drop database lab1
