create table Product(
ID uniqueidentifier primary Key,
CategoryID uniqueidentifier not null,
Name nvarchar(100) not null,
Title nvarchar(150) not null,
OrderLimit int,
TotalVariantsSold int,
Description nvarchar(250)  
)
GO
---------------------------------------------------------------------------------------------------------
-------------------------------------alter commmand-------------------------------------------
-------------------------------------product-------------------------------------------------



alter table Product add constraint FK_Product_CategoryID foreign key (CategoryID) references Category(ID)
GO
alter table Product add constraint default_TotalVariantsSold  default 0 for TotalVariantsSold