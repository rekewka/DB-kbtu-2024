create database lab4;

create table warehouses(
    code_integer INT,
    location varchar(255),
    capacity INT
);

create table boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse int
);

insert into warehouses(code_integer, location, capacity)
values (1, 'Chicago', 3);
insert into warehouses(code_integer, location, capacity)
values (2, 'Chicago', 4);
insert into warehouses(code_integer, location, capacity)
values (3, 'New York', 7);
insert into warehouses(code_integer, location, capacity)
values (4, 'Los Angeles', 2);
insert into warehouses(code_integer, location, capacity)
values (5, 'San Francisco', 8);

insert into boxes(code, contents, value, warehouse)
values ( 'OMN7', 'Rocks', 180, 3);
insert into boxes(code, contents, value, warehouse)
values ( '4H8P', 'Rocks', 250, 1);
insert into boxes(code, contents, value, warehouse)
values ( '4RT3', 'Scissors', 190, 4);
insert into boxes(code, contents, value, warehouse)
values ( '7G3H', 'Rocks', 200, 1);
insert into boxes(code, contents, value, warehouse)
values ( '8JN6', 'Papers', 75, 1);
insert into boxes(code, contents, value, warehouse)
values ( '8Y6U', 'Papers', 50, 3);
insert into boxes(code, contents, value, warehouse)
values ( '9J6F', 'Papers', 175, 2);
insert into boxes(code, contents, value, warehouse)
values ( 'LL08', 'Rocks', 140, 4);
insert into boxes(code, contents, value, warehouse)
values ( 'P0H6', 'Scissors', 125, 1);
insert into boxes(code, contents, value, warehouse)
values ( 'P2T6', 'Rocks', 150, 2);
insert into boxes(code, contents, value, warehouse)
values ( 'TU55', 'Papers', 90, 5);

select distinct boxes.contents from boxes

select warehouse, count(*) as number_of_boxes
from boxes
group by warehouse
having count(*) > 2;

insert into warehouses(code_integer, location, capacity)
VALUES (6, 'New York', 3)

insert into boxes(code, contents, value, warehouse)
Values ('H5RT', 'Papers', 200, 2)

update boxes
set value = value - (value * 0.15) where value = (select value from boxes
order by value desc limit 1 offset 2)

delete from boxes
where value < 150

delete from boxes
where warehouse in (select code_integer from warehouses
where location = 'New York')
returning *;

update boxes
set value = value + 85 where value in (select value from boxes order by value limit 3)

select value from boxes
order by value