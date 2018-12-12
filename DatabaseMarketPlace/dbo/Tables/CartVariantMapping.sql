create table CartVariantMapping(
ID uniqueidentifier primary key,
CartID uniqueidentifier not null,
VariantID uniqueidentifier not null,
 SellingPrice float not null,
 Quantity int not null,
)
GO
-------------------cart variant mapping----
alter table CartVariantMapping add constraint FK_CartVariantMapping_Cart foreign key(CartID) references [User](ID)
GO
alter table CartVariantMapping add constraint FK_CartVariantMapping_Variant foreign key(VariantID) references Variant(ID)
GO
alter table CartVariantMapping
add constraint default_CCartVariantMapping_Quantity 
default 1 for Quantity
GO
alter table CartVariantMapping
add constraint default_CartVariantMapping_SellingPrice
default 0 for SellingPrice