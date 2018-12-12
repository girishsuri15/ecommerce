create procedure addCategory
@CategoryName nvarchar(100),
@CategoryID uniqueidentifier OUT
as
begin
declare @ID uniqueidentifier
IF EXISTS(select 'True' from Category where Name = @CategoryName)
   begin
      select @categoryID = ID from Category where Name = @CategoryName
   end;
else
  begin
    set @ID = newID()
       insert into Category(ID,Name) values (@ID,@CategoryName)
       set @categoryID = @ID
  end;
end

-------------------------------- add ITEM-----------------------