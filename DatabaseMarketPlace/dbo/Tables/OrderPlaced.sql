create table OrderPlaced(
ID uniqueidentifier primary key,
OrderID uniqueidentifier not null,
UserID uniqueidentifier not null
)
GO
-----------------------------PlacedOrder---------------------------------------------------

Alter Table OrderPlaced
Add Constraint FK_OrderPlaced_OrderID
Foreign Key (OrderID) References [Order](ID)
GO
Alter Table OrderPlaced
Add Constraint FK_OrderPlaced_UserID
Foreign Key (UserID) References [User](ID)