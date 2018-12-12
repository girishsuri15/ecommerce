create table OrderPlacedVariants(
ID uniqueidentifier primary key,
OrderPlacedID uniqueidentifier not null,
VariantID uniqueidentifier not null,
 SellingPrice float not null,
 Quantity int not null,
)
GO
-----------------------------PlacedOrderVariants---------------------------------------------------

Alter Table OrderPlacedVariants
Add Constraint FK_OrderPlacedVariants_VariantID
Foreign Key (VariantID) References Variant(ID)
GO
Alter Table OrderPlacedVariants
Add Constraint FK_OrderPlacedVariants_OrderPlacedID
Foreign Key (OrderPlacedID) References OrderPlaced(ID)
GO
alter table OrderPlacedVariants
add constraint default_OrderPlacedVariants_Quantity 
default 1 for Quantity
GO
alter table OrderPlacedVariants
add constraint default_OrderPlacedVariants_SellingPrice 
default 0 for SellingPrice

-------------------------------------------------------------------------
-----------------------------------procedure ----------------------------------------------
-----------------------------------------------------------------------------------
------------------------------------------------- add VALUE-----------------------------------------------