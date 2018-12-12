----------------------Order Table(YYYY-MM-DD hh:mm:ss)-----------------------------
CREATE TABLE [Order]
    (
              ID uniqueidentifier primary key,
              OrderDate smalldatetime not null,
              TotalAmount float not null,
              DeliveryAddressID uniqueidentifier not null,
              DeliveryDate smalldatetime not null,
              StatusID int not null,
              isCancelled char(2) not null
    )
GO
--------------------------------user---------------------------------------------------

------------------------------Order -----------------------------------------------------

Alter Table [Order]
Add Constraint FK_statusID
Foreign Key (statusID) References [Status](ID)
GO
Alter Table [Order]
Add Constraint FK_OrderAddressID
Foreign Key (DeliveryAddressID) References [Address](ID)
GO
Alter Table [Order]
Add Constraint default_OrderCancelled
default 'N' for isCancelled
GO
Alter Table [Order]
Add Constraint default_StatusID
default 1 for StatusID
GO
alter table [Order]
add constraint default_TotalAmount default 0 for TotalAmount
GO
alter table [Order] 
add constraint default_OrderDate 
default CONVERT(VARCHAR(19), GETDATE(), 120) for OrderDate