create database orders
default character set utf8
default collate utf8_general_ci;

create table orders(
	Region varchar(50),
	Country varchar(50),
	ItemType varchar(20),
	SalesChannel varchar(30),
	OrderPriority varchar(30),
	OrderDate varchar(30),
	OrderID varchar(30),
	ShipDate varchar(30),
	UnitsSold varchar(30),
	UnitPrice varchar(30),
	UnitCost varchar(30),
	TotalRevenue varchar(30),
	TotalCost varchar(30)
)default charset = utf8;




select * from orders;