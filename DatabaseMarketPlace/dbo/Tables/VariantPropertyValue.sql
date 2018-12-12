create table VariantPropertyValue(
 ID int primary key identity(1,1),
 PropertyID uniqueidentifier not null,
 ValueID uniqueidentifier not null
)
GO
alter table VariantPropertyValue add constraint FK_VariantPropertyValue_PropertyID foreign key (PropertyID) references Property(ID)
GO
alter table VariantPropertyValue add constraint FK_VariantPropertyValue_ValueID foreign key (ValueID) references Value(ID)