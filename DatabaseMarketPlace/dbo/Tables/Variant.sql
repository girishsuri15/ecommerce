create Table Variant(
ID uniqueidentifier primary Key,
SKU nvarchar(100),
ProductID uniqueidentifier not null,
ListingPrice float not null,
Discount float not null,
QuantitySold int not null,
Inventory int not null,
)
GO
alter table Variant add constraint FK_Variant foreign key (ProductID) references Product(ID)
GO
alter table Variant add constraint default_ListingPrice default 0 for ListingPrice
GO
alter table Variant add constraint default_Discount  default 0 for Discount
GO
alter table Variant add constraint default_QuantitySold  default 0 for QuantitySold
GO
alter table Variant add constraint default_Inventory default 0 for Inventory