create table [User] (
 ID uniqueidentifier primary Key,
 Name nvarchar(100) not null,
 HashPassword nvarchar(100) not null,
 Email nvarchar(100) not null,
 PhoneNumber nvarchar not null,
 RoleID uniqueidentifier not null
)
GO
alter table [User] add constraint FK_User foreign key (RoleID) references Role(ID)
GO
alter table [User] add constraint Unique_Email unique(Email)