create table UserAddressMapping(
ID uniqueidentifier primary key,
UserID uniqueidentifier,
AddressID uniqueidentifier
)
GO
----------------- new mapper tables -------------------
----------------------user address

alter table UserAddressMapping add constraint FK_UserAddressMapping_User foreign key(UserID) references [User](ID)
GO
alter table UserAddressMapping add constraint FK_UserAddressMapping_Address foreign key(AddressID) references Address(ID)