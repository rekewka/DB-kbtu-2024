create database lab2


create table countries(
    country_id serial primary key ,
    country_name varchar(50),
    region_id int,
    population int
)

insert into countries(country_name, region_id, population)
VALUES ('kazakhstan', 1, 1000)

INSERT INTO countries (country_id, country_name)
VALUES (2, 'Russia')

insert into countries(region_id)
values (null)

insert into countries(country_name, region_id, population)
VALUES
    ('Germany', 1, 1000),
    ('Greece', 1, 1000),
    ('UK', 1, 1000)

alter table countries
alter column country_name
set default 'Kazakhstan';

insert into countries( region_id, population)
values (5, 10000)

insert into countries default values

create table countries_new (like countries including all)

insert into countries_new (select * from countries)

update countries_new
set region_id = 1
WHERE region_id is null

select country_name,
        population * 1.10 as "New population"
from countries_new;

delete from countries
where population < 100000

delete from countries_new
using countries
where countries_new.country_id = countries.country_id
returning *;

delete from countries
returning *