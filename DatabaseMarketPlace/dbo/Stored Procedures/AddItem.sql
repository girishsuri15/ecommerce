create procedure AddItem
@CategoryName nvarchar(50),
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as
begin
	declare @CategoryID uniqueidentifier
	exec addCategory @CategoryName,@CategoryID OUTPUT

	exec AddProduct @ProductName,@Title,@OrderLimit,@Description,@CategoryID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage

end;