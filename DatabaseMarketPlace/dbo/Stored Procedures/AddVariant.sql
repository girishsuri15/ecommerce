create procedure AddVariant 
@ProductID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as 
begin
  declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier,
  @SKUCode nvarchar(100),
  @MapperKey int,
  @VariantID uniqueidentifier
  
SET NOCOUNT ON
 DECLARE @PropertyNameCursor varchar(50)
 DECLARE cursor_property CURSOR

STATIC FOR 
SELECT value FROM STRING_SPLIT(@PropertyName, '~')
OPEN cursor_property	
 DECLARE @ValueNameCursor varchar(50)
 DECLARE cursor_value CURSOR
 STATIC FOR 
 SELECT value FROM STRING_SPLIT(@ValueName, '~')
 open cursor_value
IF @@CURSOR_ROWS > 0  
 BEGIN 
 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor;

 WHILE @@Fetch_status = 0
 BEGIN
 PRINT 'PropertyName : '+@PropertyNameCursor
 exec AddProperty @PropertyNameCursor, @PropertyID OUTPUT


 
 PRINT 'PropertyValue : '+@ValueNameCursor
 exec AddValue @ValueNameCursor,@ValueID OUTPUT

 exec AddVariantPropertyValueMapping @PropertyNameCursor,@ValueNameCursor,@MapperKey OUTPUT

 if len(@SKUCode) >0
 begin
  set @SKUCode = @SKUCode + '~' + Convert(nvarchar(100),@MapperKey)
 end
 else
 begin
  set @SKUCode = Convert(nvarchar(100),@MapperKey)
 end

 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor
 END
END
CLOSE cursor_property
DEALLOCATE cursor_property
SET NOCOUNT OFF
CLOSE cursor_value
DEALLOCATE cursor_value
SET NOCOUNT OFF

 if not exists (select 'true' from Variant where SKU = @SKUCode and ProductID =@ProductID)
 begin
    set @VariantID = newID()
	
	insert into Variant(ID,SKU,ProductID,ListingPrice,Discount,QuantitySold,Inventory) values (@VariantID,@SKUCode,@ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory)
	exec AddVariantImage @VariantID,@VariantImage
 end
 else
 begin
	select @VariantID = ID from Variant where SKU = @SKUCode
	update Variant set Inventory = Inventory + 1 where ID = @VariantID and ProductID =@ProductID
 end
end

--------------------------------------ADD Product-----------------------------------------