create database project;
set sql_safe_updates=0;


use project;

select * from Water;
select * from soft_drinks;
select * from juices;
select * from alcoholic_beverages;

desc water;

create table soft_drinks (Order_ID varchar(50),Customer_ID varchar(50),Customer_Type varchar(50),Product varchar(50),Category varchar(50),Unit_Price int,Quantity int,Discount int,Total_Price int,Region varchar(50),Order_Date varchar(50));
create table juices (Order_ID varchar(50),Customer_ID varchar(50),Customer_Type varchar(50),Product varchar(50),Category varchar(50),Unit_Price int,Quantity int,Discount int,Total_Price int,Region varchar(50),Order_Date varchar(50));
create table alcoholic_beverages (Order_ID varchar(50),Customer_ID varchar(50),Customer_Type varchar(50),Product varchar(50),Category varchar(50),Unit_Price int,Quantity int,Discount int,Total_Price int,Region varchar(50),Order_Date varchar(50));

delimiter $$
create trigger ab
after delete on water
for each row begin
insert into soft_drinks (Order_ID,Customer_ID,Customer_Type,Product,Category,Unit_Price,Quantity,Discount,Total_Price,Region,Order_Date) values (old.Order_ID,old.Customer_ID,old.Customer_Type,old.Product,old.Category,old.Unit_Price,old.Quantity,old.Discount,old.Total_Price,old.Region,old.Order_Date);
end $$
delimiter ;

delete from water where Category="Soft Drinks";


delimiter $$
create trigger bb
after delete on water
for each row begin
insert into juices (Order_ID,Customer_ID,Customer_Type,Product,Category,Unit_Price,Quantity,Discount,Total_Price,Region,Order_Date) values (old.Order_ID,old.Customer_ID,old.Customer_Type,old.Product,old.Category,old.Unit_Price,old.Quantity,old.Discount,old.Total_Price,old.Region,old.Order_Date);
end $$
delimiter ;

delete from water where Category="Juices";


delimiter $$
create trigger cc
after delete on water
for each row begin
insert into alcoholic_beverages (Order_ID,Customer_ID,Customer_Type,Product,Category,Unit_Price,Quantity,Discount,Total_Price,Region,Order_Date) values (old.Order_ID,old.Customer_ID,old.Customer_Type,old.Product,old.Category,old.Unit_Price,old.Quantity,old.Discount,old.Total_Price,old.Region,old.Order_Date);
end $$
delimiter ;

delete from water where Category="Alcoholic Beverages";