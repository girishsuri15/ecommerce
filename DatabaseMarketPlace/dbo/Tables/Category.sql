create table Category(
ID uniqueidentifier primary Key,
Name varchar(50) not null,
ProductsSold int not null
)
GO
alter table Category add constraint default_ProductsSold  default 0 for ProductsSold