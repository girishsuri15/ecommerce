
create Database MarketPlace
GO

use MarketPlace;
GO

alter table [User] alter column PhoneNumber nvarchar(11)
GO

use MarketPlace;
GO

-------------CategoryName---ProductName--Title---OrderLimit---Description---ListingPrice---Discount---QuantitySold---Inventory----PropertyName---ValueName--VariantImage---
---EXEC AddItem 'shoes','adidas','adidas starblue',2,'adidas basketball',1000,100,1,100,'color~size','blue~8US','https://goo.gl/images/fMzCkY'
------------------------------------------------------------------------------------


--------------------------------------------shoe category----------------------------------------------------
EXEC AddItem 'shoes','adidas','adidas ultraboast',5,'adidas basketball',1000,100,1,100,'color~size','blue~8US','https://cdn.pixabay.com/photo/2017/04/09/18/54/shoes-2216498_1280.jpg'
GO

EXEC AddItem 'shoes','adidas','adidas ultraboast',5,'adidas basketball',900,100,1,100,'color~size','red~8US','https://cdn.pixabay.com/photo/2015/04/20/13/24/person-731281_1280.jpg'
GO

EXEC AddItem 'shoes','nike','adidas vilded',6,'adidas running',1000,100,1,100,'color~size','red~10US','https://image.shutterstock.com/image-photo/pair-sport-shoes-on-colorful-450w-1086173984.jpg'
GO

EXEC AddItem 'shoes','puma','adidas hellon',3,'adidas basketball',1000,100,1,100,'color~size','grey~8US','https://cdn.pixabay.com/photo/2014/07/31/23/42/legs-407196_1280.jpg'
GO

EXEC AddItem 'shoes','starimpact','starimpact aero',2,'starimapct basketball',1000,100,1,100,'color~size','black~8US','https://free-images.com/lg/ff5f/shoe_handmade_shoes_dress.jpg'
GO

EXEC AddItem 'shoes','umbro','umbro stardrift',1,'umbro basketball',1000,100,1,100,'color~size','white~5US','https://free-images.com/lg/b48d/shoe_shoes_children_s.jpg'
GO

EXEC AddItem 'shoes','jordan','jordan nayo',2,'jordan basketball',1000,100,1,100,'color~size','organe~6US','https://image.shutterstock.com/image-photo/shoes-450w-525737722.jpg'
GO

EXEC AddItem 'shoes','asics','asics kylen',4,'asics volleyball',1000,100,1,100,'color~size','red~6US','https://cdn.pixabay.com/photo/2016/01/19/18/06/brown-shoes-1150071_1280.jpg'
GO

EXEC AddItem 'shoes','lotto','lotto helkin',2,'lotto hockey',1000,100,1,100,'color~size','blue~7US','https://cdn.pixabay.com/photo/2018/08/04/00/18/hiking-shoes-3583017_1280.jpg'
GO

EXEC AddItem 'shoes','bata','bata boston',2,'bata casusal',1000,100,1,100,'color~size','yellow~9US','https://cdn.pixabay.com/photo/2015/01/16/15/01/fashion-601565_1280.jpg'
GO

EXEC AddItem 'shoes','redchief','redchief Kivaro',2,'redchief treking',1000,100,1,100,'color~size','blue~10US','https://cdn.pixabay.com/photo/2014/06/18/18/42/running-shoe-371625_1280.jpg'
GO

------------------------------------------tshirst----------------------------
EXEC AddItem 'tshirt','adidas','adidas ultraboast',5,'adidas basketball',800,100,0,50,'color~size','blue~M','https://cdn.pixabay.com/photo/2015/09/06/01/03/white-926838__480.jpg'
GO

EXEC AddItem 'tshirt','nike','adidas vilded',6,'adidas running',9000,56,0,80,'color~size','red~L','https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008__480.png'
GO

EXEC AddItem 'tshirt','puma','adidas hellon',3,'adidas basketball',7500,78,0,67,'color~size','grey~M','https://cdn.pixabay.com/photo/2017/06/21/20/51/tshirt-2428521__480.jpg'
GO

EXEC AddItem 'tshirt','starimpact','starimpact aero',2,'starimapct basketball',4500,250,0,5,'color~size','black~L','https://cdn.pixabay.com/photo/2013/10/17/18/20/believe-197091__480.jpg'
GO

EXEC AddItem 'tshirt','umbro','umbro stardrift',1,'umbro basketball',560,80,0,6,'color~size','white~S','https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192__480.png'
GO

EXEC AddItem 'tshirt','jordan','jordan nayo',2,'jordan basketball',6789,56,0,3,'color~size','organe~XL','https://cdn.pixabay.com/photo/2016/11/23/06/57/isolated-t-shirt-1852113__480.png'
GO

EXEC AddItem 'tshirt','asics','asics kylen',4,'asics volleyball',7699,89,0,9,'color~size','red~M','https://cdn.pixabay.com/photo/2013/07/13/14/07/apparel-162180__480.png'
GO

EXEC AddItem 'tshirt','lotto','lotto helkin',2,'lotto hockey',5699,88,0,1,'color~size','blue~L','https://cdn.pixabay.com/photo/2016/10/26/19/12/bad-story-1772283__480.jpg'
GO

EXEC AddItem 'tshirt','bata','bata boston',2,'bata casusal',777,56,0,4,'color~size','yellow~XLL','https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355__480.jpg'
GO

EXEC AddItem 'tshirt','redchief','redchief Kivaro',2,'redchief treking',567,5,0,100,'color~size','blue~l','https://cdn.pixabay.com/photo/2018/08/08/16/37/pole-3592608__480.jpg'
GO

-----------------------------------------shorts----------------------------
EXEC AddItem 'shorts','adidas','adidas ultraboast',5,'adidas basketball',800,100,0,50,'color','blue','https://image.shutterstock.com/image-photo/attractive-cheerful-stunning-perfect-harsh-260nw-1044857047.jpg'
GO

EXEC AddItem 'shorts','nike','adidas vilded',6,'adidas running',9000,56,0,80,'color','red','https://cdn.pixabay.com/photo/2015/03/26/10/37/young-691660__480.jpg'
GO

EXEC AddItem 'shorts','puma','adidas hellon',3,'adidas basketball',7500,78,0,67,'color','grey','https://cdn.pixabay.com/photo/2016/08/22/10/04/traveler-1611614__480.jpg'
GO

EXEC AddItem 'shorts','starimpact','starimpact aero',2,'starimapct basketball',4500,250,0,5,'color','black','https://image.shutterstock.com/image-photo/laughing-beach-guy-shorts-shirt-260nw-552826066.jpg'
GO

EXEC AddItem 'shorts','umbro','umbro stardrift',1,'umbro basketball',560,80,0,6,'color','white','https://cdn.pixabay.com/photo/2016/08/20/07/42/hiker-1607017__480.jpg'
GO

EXEC AddItem 'shorts','jordan','jordan nayo',2,'jordan basketball',6789,56,0,3,'color','organe','https://cdn.pixabay.com/photo/2015/01/16/15/01/person-601564__480.jpg'
GO

EXEC AddItem 'shorts','asics','asics kylen',4,'asics volleyball',7699,89,0,9,'color','red','https://cdn.pixabay.com/photo/2017/08/07/18/59/girl-2606776__480.jpg'
GO

EXEC AddItem 'shorts','lotto','lotto helkin',2,'lotto hockey',5699,88,0,1,'color','blue','https://cdn.pixabay.com/photo/2016/08/19/16/13/scooter-1605608__480.jpg'
GO

EXEC AddItem 'shorts','bata','bata boston',2,'bata casusal',777,56,0,4,'color','yellowL','https://cdn.pixabay.com/photo/2017/08/07/15/12/shorts-2604804__480.jpg'
GO

EXEC AddItem 'shorts','redchief','redchief Kivaro',2,'redchief treking',567,5,0,100,'color','blue','https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144__480.jpg'
GO

-----------------------------mobile---------------------------------------------------------
EXEC AddItem 'Mobiles','Apple','Apple Mobiles',5,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1000,10,750,1000,'color~size','gold~5inch','https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg'
GO

EXEC AddItem 'Mobiles','Samsung','Samsung Mobiles',6,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2000,10,150,1000,'color~size','white~5inch','https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg'
GO

EXEC AddItem 'Mobiles','Oppo','Oppo Mobiles',3,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2300,10,250,1000,'color~size','grey~5inch','https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg'
GO

EXEC AddItem 'Mobiles','Xiomi','Xiomi Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1500,0,80,1000,'color~size','gold~5inch','https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg'
GO

EXEC AddItem 'Mobiles','One plus','One plus Mobiles',1,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',700,0,70,1000,'color~size','white~5inch','https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg'
GO

EXEC AddItem 'Mobiles','Sony','Sony Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',900,20,50,1000,'black~size','grey~5inch','https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg'
GO

EXEC AddItem 'Mobiles','Nokia','Nokia Mobiles',4,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1300,25,10,1000,'color~size','gold~5inch','https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg'
GO

EXEC AddItem 'Mobiles','Motorola','Motorola Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1700,30,101,1000,'color~size','white~5inch','https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg'
GO

EXEC AddItem 'Mobiles','Huawei','Huawei Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2100,100,150,1000,'color~size','grey~5inch','https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg'
GO

EXEC AddItem 'Mobiles','HTC','HTC Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2100,50,100,1000,'color~size','gold~5inch','https://image.shutterstock.com/image-vector/different-ui-ux-gui-screens-450w-362295254.jpg'
GO

EXEC AddItem 'Mobiles','Apple','Apple Mobiles',5,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1000,10,750,1000,'color~size','blue~6inch','https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg'
GO

EXEC AddItem 'Mobiles','Samsung','Samsung Mobiles',6,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2000,10,15,1000,'color~size','red~6inch','https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg'
GO

EXEC AddItem 'Mobiles','Oppo','Oppo Mobiles',3,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2300,10,250,1000,'color~size','blue~6inch','https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg'
GO

EXEC AddItem 'Mobiles','Xiomi','Xiomi Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1500,0,80,1000,'color~size','red~6inch','https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg'
GO

EXEC AddItem 'Mobiles','One plus','One plus Mobiles',1,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',700,0,7,1000,'color~size','blue~6inch','https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg'
GO

EXEC AddItem 'Mobiles','Sony','Sony Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',900,20,5,1000,'black~size','red~6inch','https://image.shutterstock.com/image-vector/design-mobile-application-ui-ux-450w-1069313000.jpg'
GO

EXEC AddItem 'Mobiles','Nokia','Nokia Mobiles',4,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1300,25,100,1000,'color~size','blue~6inch','https://image.shutterstock.com/image-vector/mobile-phone-vector-450w-119386792.jpg'
GO

EXEC AddItem 'Mobiles','Motorola','Motorola Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',1700,30,10,1000,'color~size','red~6inch','https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg'
GO

EXEC AddItem 'Mobiles','Huawei','Huawei Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2100,100,15,1000,'color~size','blue~6inch','https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg'
GO

EXEC AddItem 'Mobiles','HTC','HTC Mobiles',2,'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications network through radio wave or satellite transmissions.',2100,50,10,1000,'color~size','red~6inch','https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg'
GO

----------------------------------watches----------------------------------------------------
EXEC AddItem 'Watches','Blancpain','Watches Blancpain',5,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',1500,10,25,1000,'color','black','https://image.shutterstock.com/image-photo/closeup-toned-shot-male-watches-450w-267798710.jpg'
GO

EXEC AddItem 'Watches','Chopard','Watches Chopard',6,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2500,10,100,1000,'color','black','https://image.shutterstock.com/image-illustration/handwatch-icon-set-color-outline-450w-1165529206.jpg'
GO

EXEC AddItem 'Watches','Rolex','Watches Rolex',3,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2350,10,25,1000,'color','black','https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1181529889.jpg'
GO

EXEC AddItem 'Watches','Hublot','Watches Hublot',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',1550,50,100,1000,'color','black','https://image.shutterstock.com/image-photo/ratchaburithailand-5-apr-2018-man-450w-1062177503.jpg'
GO

EXEC AddItem 'Watches','Fastrack','Watches Fastrack',1,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',7500,50,270,1000,'color','black','https://image.shutterstock.com/image-photo/black-fitness-watch-activity-tracker-450w-1013750869.jpg'
GO

EXEC AddItem 'Watches','Sonata','Watches Sonata',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5900,20,507,1000,'black','blue','https://image.shutterstock.com/image-photo/luxury-watches-450w-518569825.jpg'
GO

EXEC AddItem 'Watches','Timex','Watches Timex',4,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5300,25,107,1000,'color','black','https://image.shutterstock.com/image-photo/elegant-outfit-closeup-brown-wrist-450w-370222298.jpg'
GO

EXEC AddItem 'Watches','TITAN','Watches TITAN',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5700,30,101,1000,'color','black','https://image.shutterstock.com/image-photo/closeup-designer-watch-on-businessman-450w-383220994.jpg'
GO

EXEC AddItem 'Watches','Gucci','Watches Gucci',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2500,10,15,1000,'color','black','https://image.shutterstock.com/image-photo/businessman-checking-time-watch-450w-381472021.jpg'
GO

EXEC AddItem 'Watches','Omega','Watches Omega',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2500,50,10,1000,'color','black','https://image.shutterstock.com/image-photo/old-sport-model-vintage-rolex-450w-1191114829.jpg'
GO

EXEC AddItem 'Watches','Blancpain','Watches Blancpain',5,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',1700,10,25,1000,'color','blue','https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215112.jpg'
GO

EXEC AddItem 'Watches','Chopard','Watches Chopard',6,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2700,10,100,1000,'color','blue','https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215058.jpg'
GO

EXEC AddItem 'Watches','Rolex','Watches Rolex',3,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2750,10,25,1000,'color','gold','https://image.shutterstock.com/image-photo/wireless-smart-watch-isolated-on-450w-788791027.jpg'
GO

EXEC AddItem 'Watches','Hublot','Watches Hublot',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',1750,50,100,1000,'color','blue','https://image.shutterstock.com/image-photo/luxury-watches-450w-518569816.jpg'
GO

EXEC AddItem 'Watches','Fastrack','Watches Fastrack',1,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',7700,50,270,1000,'color','gold','https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1015451965.jpg'
GO

EXEC AddItem 'Watches','Sonata','Watches Sonata',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5700,20,507,1000,'black','blue','https://image.shutterstock.com/image-photo/bangkokthailand-9-apr-2018-woman-450w-1064714651.jpg'
GO

EXEC AddItem 'Watches','Timex','Watches Timex',4,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5700,25,107,1000,'color','gold','https://image.shutterstock.com/image-photo/antique-gold-pocket-watch-lies-450w-1152253118.jpg'
GO

EXEC AddItem 'Watches','TITAN','Watches TITAN',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',5770,30,101,1000,'color','blue','https://image.shutterstock.com/image-photo/mens-wrist-watch-450w-655935412.jpg'
GO

EXEC AddItem 'Watches','Gucci','Watches Gucci',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2700,10,15,1000,'color','gold','https://image.shutterstock.com/image-photo/woman-watch-gold-white-color-450w-575248648.jpg'
GO

EXEC AddItem 'Watches','Omega','Watches Omega',2,'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities. A wristwatch is designed to be worn around the wrist, attached by a watch strap or other type of bracelet.',2700,50,10,1000,'color','blue','https://image.shutterstock.com/image-photo/wrist-watch-isolated-on-white-450w-343320308.jpg'
GO

------------------------------------------camera---------------------------------------------
EXEC AddItem 'Cameras','Canon','Cameras Canon',5,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',1200,10,25,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/dslr-camera-isolated-on-black-450w-1181503345.jpg'
GO

EXEC AddItem 'Cameras','Nikon','Cameras Nikon',6,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',2200,10,100,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/portrait-photographer-covering-her-face-450w-763047211.jpg'
GO

EXEC AddItem 'Cameras','Sony','Cameras Sony',3,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',2320,10,25,1000,'color~size','black~15inch','https://thumb1.shutterstock.com/display_pic_with_logo/526873/313473329/stock-photo-digital-photography-workstation-modern-digital-dslr-camera-laptop-computer-and-display-313473329.jpg'
GO

EXEC AddItem 'Cameras','Fuji','Cameras Fuji',2,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',1520,0,100,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/young-asian-cute-artist-woman-450w-1170637762.jpg'
GO

EXEC AddItem 'Cameras','Panasonic','Cameras Panasonic',1,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',7200,0,200,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/abstract-dslr-camera-on-railway-450w-1165395928.jpg'
GO

EXEC AddItem 'Cameras','Made Products','Cameras Products',2,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',9200,20,50,1000,'black~size','blue~15inch','https://image.shutterstock.com/image-photo/burgas-bulgaria-may-4-2018-450w-1138310630.jpg'
GO

EXEC AddItem 'Cameras','Pentax','Cameras Pentax',4,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',21300,25,10,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/groningen-netherlands-august-19-2018-450w-1171028293.jpg'
GO

EXEC AddItem 'Cameras','BVI','Cameras BVI',2,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',21700,30,101,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/digital-video-camera-gimbal-stabilization-450w-1086230840.jpg'
GO

EXEC AddItem 'Cameras','Getek','Cameras Getek',2,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',22100,100,150,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/woman-using-dslr-mountain-suburb-450w-1184689315.jpg'
GO

EXEC AddItem 'Cameras','HeroFiber','Cameras HeroFiber',2,'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digital system or on photographic film. A camera consists of a lens which focuses light from the scene, and a camera body which holds the image capture mechanism.',22100,50,100,1000,'color~size','black~15inch','https://image.shutterstock.com/image-photo/professional-digital-equipment-recording-video-450w-692685511.jpg'
GO

------------------------------Rolecreation----------------------------------------------------------
insert into [Role] (id,Name)Values(newID(),'Admin');
GO

insert into [Role] (id,Name)Values(newID(),'Customer');
GO

-----------------------------------status--------------------------------------------------
insert into Status(description) values ('Cancelled')
GO

insert into Status(description) values ('Delivered')
GO

insert into Status(description) values ('Progessing')
GO

------------------------------------ add VARIANT_IMAGE-----------------------------------
--------------------------------------------------------------------------------------------


GO
