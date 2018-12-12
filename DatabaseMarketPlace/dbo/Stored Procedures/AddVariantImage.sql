create PROCEDURE AddVariantImage
@VariantID uniqueidentifier,
@ImageURL nvarchar(200) = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'
as
begin
	IF (@ImageURL IS NOT NULL) OR (LEN(@ImageURL) > 0)
	begin
		insert into VariantImage(ID,VariantID,ImageURL) values (newID(),@VariantID,@ImageURL)
	end
	ELSE
	BEGIN
		INSERT INTO VariantImage(VariantID) values (@VariantID)
	END
end;



--------------------------------------------------add ADD_VARIANT---------------------------------------------------