create procedure AddProduct
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@CategoryID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)

as
begin
       declare @ProductID uniqueidentifier
       IF Exists(select 'True' from Product where Name = @ProductName and CategoryID = @CategoryID)
              begin
                     select @ProductID = ID from Product where name = @ProductName and CategoryID = @CategoryID
              end;
       else
       begin
              set @ProductID = NEWID()
              INSERT INTO Product(ID,CategoryID,Name,Title,OrderLimit,Description) values(@ProductID,@CategoryID,@ProductName,@Title,@OrderLimit,@Description);
       end;
	   exec AddVariant @ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage 
end;

--------------------------------------- add CATEGORY------------------