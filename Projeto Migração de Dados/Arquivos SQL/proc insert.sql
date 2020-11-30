DELIMITER $$
CREATE PROCEDURE select_all()
BEGIN

# INSERT DE DADOS NA TABELA DIMREGION

insert into dimRegion (region)
SELECT distinct region from orders
where orders.OrderID not in(select orders.OrderID from orders
inner join fatoorders on orders.OrderID = fatoorders.OrderID);


# INSERT DE DADOS NA TABELA DIMCOUNTRY COM CHAVE ESTRANGEIRA

insert into dimcountry (country, idreg)
select distinct orders.country, dimregion.idRegion from orders
inner join dimregion on dimregion.Region = orders.Region
where orders.OrderID not in(select orders.OrderID from orders
inner join fatoorders on orders.OrderID = fatoorders.OrderID);


# INSERT DE DADOS NA TABELA DIMSCHANNEL

insert into dimschannel(Schannel)
select distinct SalesChannel from orders
where orders.OrderID not in(select orders.OrderID from orders
inner join fatoorders on orders.OrderID = fatoorders.OrderID);


# iNSERT NA TABELA FATO COM CHAVES ESTRANGEIRAS
insert into fatoorders (regionId, countryId, salesChannelId, ItemType, OrderDate, OrderID, ShipDate,
UnitsSold, UnitPrice, UnitCost, TotalRevenue, TotalCost)
select dimRegion.idRegion, dimCountry.idCountry, dimSChannel.idSChannel, ItemType,
str_to_date(OrderDate, '%c/%e/%Y'), OrderID, str_to_date(ShipDate, '%c/%e/%Y'),
cast(UnitsSold as decimal(10,2)), cast(UnitPrice as decimal(10,2)), cast(UnitCost as decimal(10,2)),
cast(TotalRevenue as decimal(10,2)), cast(TotalCost as decimal(10,2)) 
from orders
inner join dimRegion on dimRegion.region = orders.region
inner join dimCountry on dimCountry.country = orders.country
inner join dimSChannel on dimSChannel.schannel = orders.SalesChannel

where orders.OrderID not in(select orders.OrderID from orders
inner join fatoorders on orders.OrderID = fatoorders.OrderID);
 

END $$
DELIMITER ;

 

call select_all();

select * from fatoorders;
select * from dimcountry;
select * from dimregion;
select * from dimschannel;