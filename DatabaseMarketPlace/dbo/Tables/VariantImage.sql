create table VariantImage(
ID uniqueidentifier primary Key,
VariantID uniqueidentifier not null,
ImageURL varchar(200) not null,
)
GO
alter table VariantImage add constraint FK_VariantImage foreign key (VariantID) references Variant(ID)
GO
alter table VariantImage add constraint default_ImageURL default 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'
for ImageURL