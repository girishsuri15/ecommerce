create table Address(
  ID uniqueidentifier primary Key,
  AddressLine1 nvarchar(100) not null,
  AddressLine2 nvarchar(100),
  Pin int not null,
  City nvarchar(50) not null,
  State nvarchar(50) not null,
  Country nvarchar(50) not null
)