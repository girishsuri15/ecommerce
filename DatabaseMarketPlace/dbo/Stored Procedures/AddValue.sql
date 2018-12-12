create procedure AddValue
@Name nvarchar(50),
@ValueID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Value where Name = @Name)
	begin
		set @ValueID = newID()
		insert into Value(ID,Name) values (@ValueID,@Name)

	end
ELSE
	begin
		select @ValueID = ID from Value where Name = @Name	
	end;
end;

------------------------------------------------- add PROPERTY-----------------------------------------------