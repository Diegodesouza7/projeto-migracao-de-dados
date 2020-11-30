create table dimRegion(
idRegion int not null auto_increment,
Region varchar(50),
primary key(idRegion)
)default charset = utf8;

create table dimCountry(
idCountry int not null auto_increment,
Country varchar(50),
idReg int,
primary key(idCountry),
foreign key(idReg) references dimRegion(idRegion)
)default charset = utf8;

create table dimSChannel(
idSChannel int not null auto_increment,
Schannel varchar(50),
primary key(idSChannel)
)default charset = utf8;

create table FatoOrders(
id int primary key auto_increment,
regionId int,
countryId int,
salesChannelId int,
ItemType varchar(20),
OrderDate date,
OrderID int,
ShipDate date,
UnitsSold int,
UnitPrice decimal(10,2),
UnitCost decimal(10,2),
TotalRevenue decimal(10,2),
TotalCost decimal(10,2),
foreign key(regionId) references dimRegion(idRegion),
foreign key(CountryId) references dimcountry(idCountry),
foreign key(SalesChannelId) references dimschannel(idSChannel)
)default charset = utf8;