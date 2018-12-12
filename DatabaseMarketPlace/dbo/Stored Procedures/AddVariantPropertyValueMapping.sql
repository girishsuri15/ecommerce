create procedure AddVariantPropertyValueMapping
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@MapID INT out
as
begin
 declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier

  exec AddProperty @PropertyName, @PropertyID OUTPUT
  exec AddValue @ValueName, @ValueID OUTPUT
  select @PropertyID
  select @ValueID
 IF NOT EXISTS (SELECT 'TRUE' FROM VariantPropertyValue where PropertyID = @PropertyID AND ValueID = @ValueID)
 BEGIN
   insert into VariantPropertyValue(PropertyID,ValueID) values (@PropertyID,@ValueID)
 end;
	SELECT @MapID = ID FROM VariantPropertyValue where PropertyID=@PropertyID AND ValueID = @ValueID
end


--------------------------------Add variant Image------------------------------------