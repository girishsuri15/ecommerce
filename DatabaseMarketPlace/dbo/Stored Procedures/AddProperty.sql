create procedure AddProperty
@Name nvarchar(50),
@PropertyID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Property where Name = @Name)
	begin
		set @PropertyID = newID()
		insert into Property(ID,Name) values (@PropertyID,@Name)
	end
ELSE
	begin
		select @PropertyID = ID from Property where Name = @Name
	end
end;

------------------------------------------------- add PROPERTY varient------------------------------------