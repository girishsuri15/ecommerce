USE [MarketPlace]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [uniqueidentifier] NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[Pin] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartVariantMapping]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartVariantMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[CartID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ProductsSold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[DeliveryAddressID] [uniqueidentifier] NOT NULL,
	[DeliveryDate] [smalldatetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[isCancelled] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlaced]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlaced](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlacedVariants]    Script Date: 12-12-2018 18:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlacedVariants](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderPlacedID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[OrderLimit] [int] NULL,
	[TotalVariantsSold] [int] NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HashPassword] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[AddressID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Value]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Value](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[ID] [uniqueidentifier] NOT NULL,
	[SKU] [nvarchar](100) NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ListingPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[QuantitySold] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantImage]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantImage](
	[ID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[ImageURL] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantPropertyValue]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantPropertyValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [uniqueidentifier] NOT NULL,
	[ValueID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'00000000-0000-0000-0000-000000000000', N'1112 jbkcjbs ', N'mcsjdvc', 2345, N'dehradun', N'uttarakhand', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'0f6e2661-7cb4-42fe-bbf9-13b509278deb', N'gulbari', N'Rudraprayag', 24171, N'dehradun', N'uttarakhand', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'a429f6bc-3ac0-49d7-8333-29c27bce05b0', N'1112 jbkcjbs hhh', N'kdcksdjbckhhh', 2345, N'dehradun', N'uttarakhand', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'6ba5811f-8032-4019-8d10-925da9b22df1', N'1112 jbkcjbs ', N'kdcksdjbck', 2345, N'dehradun', N'uttarakhand', N'India')
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'ae6c3b4f-9991-427d-9746-5017ab0c0864', N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'da2ff53e-ac47-46bd-9d5f-e29f45c4fb44', 5275, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'78ed0cb4-b36d-43a7-8ca4-8774520d9511', N'62aa44a6-9a0d-4f88-bc8b-5a954e54a93a', N'cadcf3a0-544c-406e-90d8-022639954fbe', 480, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'cd676833-fc75-4115-ad68-a605db0f3104', N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'a6823449-dd72-4290-bafd-d805aa951c08', 5611, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'144d0c36-1b10-436a-98cf-c7b864384f6d', N'f61d355f-e060-4aad-af4e-4c5f2d6c07ce', N'9e48e0aa-dad5-49c9-bf8c-e8547037a0bb', 7610, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'4b6d078e-8acf-489b-bf15-c9167c8e60ea', N'62aa44a6-9a0d-4f88-bc8b-5a954e54a93a', N'85a6f664-47a5-4593-8670-c7c5c96ce955', 721, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'852a22b2-1846-45e9-946d-cd2b8a6ef0c3', N'62aa44a6-9a0d-4f88-bc8b-5a954e54a93a', N'40d05909-388a-4729-b535-3a1557f30c30', 562, 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'tshirt', 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Watches', 3)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'shorts', 0)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Mobiles', 0)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Cameras', 0)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'shoes', 0)
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'5e5e5a1c-1c90-4c3c-9465-4dca58ddce17', CAST(N'2018-12-12T01:42:00' AS SmallDateTime), 2662, N'6ba5811f-8032-4019-8d10-925da9b22df1', CAST(N'2018-12-18T01:42:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'd3b1cd6f-a1ff-474f-9c0f-67bd1f7f00d5', CAST(N'2018-12-12T01:39:00' AS SmallDateTime), 480, N'0f6e2661-7cb4-42fe-bbf9-13b509278deb', CAST(N'2018-12-18T01:39:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'577201e0-a19c-47f4-ae3a-8eb4caf1a5f4', CAST(N'2018-12-12T15:20:00' AS SmallDateTime), 5740, N'a429f6bc-3ac0-49d7-8333-29c27bce05b0', CAST(N'2018-12-18T15:20:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'3d43b3e1-901b-47e7-938d-ae12bb549175', CAST(N'2018-12-11T16:54:00' AS SmallDateTime), 9400, N'0f6e2661-7cb4-42fe-bbf9-13b509278deb', CAST(N'2018-12-17T16:54:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'994973f8-5cb5-4728-8475-b1386aa969e4', CAST(N'2018-12-12T15:16:00' AS SmallDateTime), 20424, N'a429f6bc-3ac0-49d7-8333-29c27bce05b0', CAST(N'2018-12-18T15:16:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'dd492180-2690-4f8c-861d-c6c77de0e12d', CAST(N'2018-12-12T12:54:00' AS SmallDateTime), 3890, N'6ba5811f-8032-4019-8d10-925da9b22df1', CAST(N'2018-12-18T12:54:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'41240d34-f8d6-44ff-b38e-e696d635c10f', CAST(N'2018-12-11T17:36:00' AS SmallDateTime), 7610, N'6ba5811f-8032-4019-8d10-925da9b22df1', CAST(N'2018-12-17T17:36:00' AS SmallDateTime), 3, N'N ')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'abf487a9-cc6c-4092-8e3f-022681ebe1d0', N'd3b1cd6f-a1ff-474f-9c0f-67bd1f7f00d5', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'39e63814-85bb-49e6-9f5b-1fc135842da4', N'41240d34-f8d6-44ff-b38e-e696d635c10f', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'd53f8d7f-b7a3-4982-8ad3-34ea47a31ee2', N'994973f8-5cb5-4728-8475-b1386aa969e4', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'0db249a6-f271-47db-b261-5d163cfb2ffc', N'5e5e5a1c-1c90-4c3c-9465-4dca58ddce17', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'dc92245e-5005-4e83-9494-60cdb04b8973', N'3d43b3e1-901b-47e7-938d-ae12bb549175', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'30d9f5fc-3c7c-48c3-8831-9abf29e78a6b', N'dd492180-2690-4f8c-861d-c6c77de0e12d', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'91bebdd9-a5a7-4386-833c-ca4f6de025ff', N'577201e0-a19c-47f4-ae3a-8eb4caf1a5f4', N'ab8173c3-1c6a-427f-978e-2c2b55488cae')
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'c5470dce-ca65-400e-ac84-0c3d72997dee', N'91bebdd9-a5a7-4386-833c-ca4f6de025ff', N'2b76ea7f-1e43-4975-addc-a26df12f0d8f', 5740, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'ca17afb2-b66c-4770-9f13-2b5c2e5fb97e', N'39e63814-85bb-49e6-9f5b-1fc135842da4', N'9e48e0aa-dad5-49c9-bf8c-e8547037a0bb', 7610, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'249c4573-958e-43e2-8db2-4e2295f84eb8', N'dc92245e-5005-4e83-9494-60cdb04b8973', N'6068d519-3e0d-41ad-8d15-4ebfc1a20998', 900, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'd62a6150-5b01-4848-9382-6734701bb8eb', N'd53f8d7f-b7a3-4982-8ad3-34ea47a31ee2', N'8d7c763f-01b5-4832-9f23-ec47a330fea2', 8944, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'328368ce-6e87-4d76-8a99-85ba379c2363', N'30d9f5fc-3c7c-48c3-8831-9abf29e78a6b', N'fe84d216-3391-4cc0-a94b-b1e8ac607139', 2290, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'1d4792fd-ef83-425d-9bf0-9eb5c2a4e945', N'30d9f5fc-3c7c-48c3-8831-9abf29e78a6b', N'c81b1abd-2607-4fec-922f-915122710938', 700, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'72937c42-deea-4aa7-a469-a17cd9086d27', N'd53f8d7f-b7a3-4982-8ad3-34ea47a31ee2', N'2b76ea7f-1e43-4975-addc-a26df12f0d8f', 5740, 2)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'485fb173-fc8b-45da-82bc-a4b7e67e1221', N'dc92245e-5005-4e83-9494-60cdb04b8973', N'378bad8d-3407-4ef4-9598-521d4df76cb4', 4250, 2)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'e4e93d18-3bec-40ba-a81e-b5306f174168', N'0db249a6-f271-47db-b261-5d163cfb2ffc', N'40d05909-388a-4729-b535-3a1557f30c30', 562, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'2eb77082-f34b-40e8-822e-c71f628d821c', N'0db249a6-f271-47db-b261-5d163cfb2ffc', N'59bc7bbf-cad5-43ec-b2ec-2ef49ea89a26', 700, 3)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'9692e7d8-e311-4eb2-97ca-d4d63eb98619', N'abf487a9-cc6c-4092-8e3f-022681ebe1d0', N'cadcf3a0-544c-406e-90d8-022639954fbe', 480, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'976bdb1d-087b-45df-b519-e37f9c724d2c', N'30d9f5fc-3c7c-48c3-8831-9abf29e78a6b', N'6068d519-3e0d-41ad-8d15-4ebfc1a20998', 900, 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'f275d995-df0c-4ab7-b939-00848fe1be75', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Nikon', N'Cameras Nikon', 6, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'b0b49d27-dea5-4d03-bbda-017796bb5541', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Timex', N'Watches Timex', 4, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'c769a3b1-9415-4ec4-8276-1094005c2261', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'lotto', N'lotto helkin', 2, 0, N'lotto hockey')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4b458fd1-9861-41db-b7c3-1202de1b082e', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'BVI', N'Cameras BVI', 2, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'55a43522-da03-4ecf-b142-18e8935a0492', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'jordan', N'jordan nayo', 2, 0, N'jordan basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'178437f8-1a23-4214-a0dd-1de416187480', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'HTC', N'HTC Mobiles', 2, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'73f80262-e8b1-4e50-b8df-1ef2ec0d06d3', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'One plus', N'One plus Mobiles', 1, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'df91a16c-57f5-489c-b2a4-277bb021963e', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'TITAN', N'Watches TITAN', 2, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'583744aa-ef23-450c-9a77-27ed6309c34e', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Hublot', N'Watches Hublot', 2, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'c7316907-6850-4ecc-84fc-2be890057dfd', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Oppo', N'Oppo Mobiles', 3, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'8995faac-053d-40ba-b4b2-2c50dd1fcb7a', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Fuji', N'Cameras Fuji', 2, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'f6fe4304-25a0-41df-810e-2d24a469c32b', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'nike', N'adidas vilded', 6, 0, N'adidas running')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'b463c498-829c-4a67-b937-30a04edf3d05', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'adidas', N'adidas ultraboast', 5, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'480910cd-2fc7-44d9-8e18-33ad607cbb9b', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Canon', N'Cameras Canon', 5, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'8f93a317-a21a-46e0-8fe0-359a79fd8173', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'asics', N'asics kylen', 4, 0, N'asics volleyball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'82f01abf-55ab-45f6-9cc4-39ed2afb02fe', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Omega', N'Watches Omega', 2, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a0a43777-2834-4c14-829e-3c6b27de5041', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Getek', N'Cameras Getek', 2, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4103b462-29eb-4fc1-b34c-3ec354a32d1e', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'puma', N'adidas hellon', 3, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a7f2a4ab-7ca6-46c1-8127-494303a038c1', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Xiomi', N'Xiomi Mobiles', 2, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'd66fbf41-0bc4-4589-bc00-4cbe4e44421e', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'redchief', N'redchief Kivaro', 2, 0, N'redchief treking')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'f5af531b-ded2-4f3e-9a02-4d419908ee83', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Rolex', N'Watches Rolex', 3, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'eea43880-3f3f-4e1e-9579-5c20170fe5ec', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'starimpact', N'starimpact aero', 2, 0, N'starimapct basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'8f503b3d-7404-4dcb-b0db-5f32ea583ea5', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Nokia', N'Nokia Mobiles', 4, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'd2257601-4170-45a8-a1c6-5f3b59238444', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Motorola', N'Motorola Mobiles', 2, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4b885463-9b2a-4fb5-b4bb-5f96b5474559', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'HeroFiber', N'Cameras HeroFiber', 2, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'6b3994bb-8f73-4cc2-89b6-67ea9877fa48', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Fastrack', N'Watches Fastrack', 1, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'59ad4308-18ad-4950-a64b-67eab7ac5c77', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'bata', N'bata boston', 2, 0, N'bata casusal')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a8df9d85-356f-4a70-9b5b-691a64364f44', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'lotto', N'lotto helkin', 2, 0, N'lotto hockey')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a5f8845a-948f-42bd-94b8-719b31e4c4e3', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'bata', N'bata boston', 2, 0, N'bata casusal')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'856be091-a30c-4262-a227-7a3ba7fa1770', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Chopard', N'Watches Chopard', 6, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'9ae2805f-f187-49bb-832f-7fe7ed70db71', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'redchief', N'redchief Kivaro', 2, 0, N'redchief treking')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'8c6b5ce8-3bb7-4490-bff4-818197e6fdd8', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Pentax', N'Cameras Pentax', 4, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'471624c6-7411-40c6-ae89-879ad5cf657d', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Sony', N'Sony Mobiles', 2, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'282374b8-8660-472a-94b3-8ca12d44410c', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'nike', N'adidas vilded', 6, 0, N'adidas running')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'195992d3-357a-4d3c-aedd-93764f2ed045', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Gucci', N'Watches Gucci', 2, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4f8d547a-bfac-4275-bb58-942fbbe20dc4', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'umbro', N'umbro stardrift', 1, 0, N'umbro basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'32cbeba8-9cd4-450f-83c5-9531949dc7de', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'umbro', N'umbro stardrift', 1, 0, N'umbro basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4863c773-a7ad-4fc4-b4ac-959a7608cbf5', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Made Products', N'Cameras Products', 2, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'5c031670-7890-4e35-a5e7-989f402f8d55', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'redchief', N'redchief Kivaro', 2, 0, N'redchief treking')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'c8fe9be7-5a62-4d6e-8d80-a2210aa76ba5', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'asics', N'asics kylen', 4, 0, N'asics volleyball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'1d8e1b33-4b57-4a96-8a98-a7dc2e041621', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'lotto', N'lotto helkin', 2, 0, N'lotto hockey')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'69aa5040-deef-4e49-9a08-aaa359e3d4cd', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'puma', N'adidas hellon', 3, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'464deb4c-1b67-49dd-a5da-bad62c30745b', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Apple', N'Apple Mobiles', 5, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4b719598-6cce-400b-920d-bea31f61a996', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'adidas', N'adidas ultraboast', 5, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'4cb5db3d-4fbd-45f0-a927-c20ae91d4bd9', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Sonata', N'Watches Sonata', 2, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'0ce10119-952f-48a6-9562-c21979386bd5', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'jordan', N'jordan nayo', 2, 0, N'jordan basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'8c47f8b5-1352-40af-bd57-c3c46f5351e3', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Sony', N'Cameras Sony', 3, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'e2f24026-cef3-4884-acbe-c51c0fed9602', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'adidas', N'adidas ultraboast', 5, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'31933d65-105a-47a8-8682-c81af28f409a', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Huawei', N'Huawei Mobiles', 2, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a4fa21ec-3d92-49de-8d80-d7ef23dca806', N'5f27c36e-389f-4160-b1d2-0d5dc18ed1fe', N'Blancpain', N'Watches Blancpain', 5, 0, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'b951e82d-e8e0-4ca5-96ea-ddaedfe4b00c', N'73c72ac5-7738-4a8f-9667-a2d49b0caab1', N'Samsung', N'Samsung Mobiles', 6, 0, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'40940829-2831-4066-8697-dfe86b4ae24e', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'nike', N'adidas vilded', 6, 0, N'adidas running')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'449af409-71d6-4531-970d-e1075419785a', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'jordan', N'jordan nayo', 2, 0, N'jordan basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'7dbe23c1-c933-4489-ac0e-e68265ef8cb0', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'bata', N'bata boston', 2, 0, N'bata casusal')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'13bd543e-d2fb-4aeb-9ca3-e74e611fb970', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'asics', N'asics kylen', 4, 0, N'asics volleyball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'c9c871bc-28ee-4561-858a-e75205d1f168', N'3e1fe189-708a-43aa-99d4-bb5156bcb10a', N'Panasonic', N'Cameras Panasonic', 1, 0, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'a2c502f2-2663-43df-9d6e-f0879e02e0d8', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'puma', N'adidas hellon', 3, 0, N'adidas basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'de82cfbe-98ef-4079-8d55-f1d16c70c1fe', N'44bd168c-75d1-448d-bd5b-fee457d5f8b1', N'starimpact', N'starimpact aero', 2, 0, N'starimapct basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'f2e5c024-66c8-49d9-9e9a-f3f88666e7c4', N'769b1bdc-3a57-4ebf-8b20-06915078e261', N'umbro', N'umbro stardrift', 1, 0, N'umbro basketball')
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [TotalVariantsSold], [Description]) VALUES (N'1db24272-dedb-4f89-8526-f7153f0a8d2e', N'fee96f8f-d5c2-4d3a-8f02-283824706bf4', N'starimpact', N'starimpact aero', 2, 0, N'starimapct basketball')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'color')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'size')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'71998a53-90ca-4e14-8857-d2523a8593af', N'black')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'bbf6079d-e652-4f52-a831-5cfd0b593683', N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'53ff0ee9-005c-4943-8ae4-618d7e9969db', N'Customer')
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [description]) VALUES (1, N'Cancelled')
INSERT [dbo].[Status] ([ID], [description]) VALUES (2, N'Delivered')
INSERT [dbo].[Status] ([ID], [description]) VALUES (3, N'Progessing')
SET IDENTITY_INSERT [dbo].[Status] OFF
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'girish', N'$2a$10$5W8H8tqKy5dmCbqhcBSPZe69vfKKfD7y1DcBCRiHigIch2P4YJFpK', N'girish@gmail.com', N'7455058868', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'f61d355f-e060-4aad-af4e-4c5f2d6c07ce', N'             jhjdfhgjsadjkfj', N'$2a$10$Yj1mA6S3SLTTlp8dAgUHauSrkvgqoJJ8jqaIqGVx6PqH.9x7laCsi', N'ashish@gmail.com', N'8788128390', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'62aa44a6-9a0d-4f88-bc8b-5a954e54a93a', N'ankit', N'$2a$10$eGMCMc2rcrv9f2/yq5Ivr.o674btt0nKrg/nrlZKD46lcEzGbLlxq', N'ankit@gmail.com', N'7017474721', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'5415abe1-4c16-41b7-bb58-a940f6cc3a2a', N'girishsu', N'$2a$10$znoZDBbWgDQ5AYteyeaj0O/64thT.dD55k7wNAMkH3EUM.GoLoCEq', N'girish.suri@nagarro.com', N'9760441139', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'3caeb5d3-d5f2-4385-9e85-c7047a42daf2', N'admin', N'$2a$10$zNqwsPpKnqczpb2./SmMz.zSYQSGkeOR5oKd5wRlU8rqrAQL/lsG2', N'admin@gmail.com', N'7141890670', N'bbf6079d-e652-4f52-a831-5cfd0b593683')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'69d49fdf-d02a-4173-a311-ca1d6282721a', N'girishsurisingh', N'$2a$10$doyveDf8CoVx9k11u3Qw1uFdpB.CYkE2zwR0BzxI.fj2nhpeSpuXy', N'tyu@gmail.com', N'3456789766', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'5c7d1042-845c-4d61-9902-dd0fc9cc373a', N'girishsuri', N'$2a$10$IRGDkLdWaScWtf4R9YLlMOlnP6vrW9rAnO8To/8y5xC6///AF4jQW', N'girish15@gmail.com', N'8937876064', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'e2ff33b2-2769-440c-a6f1-dd5fde1ef958', N'girishsuri', N'$2a$10$KvkvCcz7yOkJE7nZIAXsW.dI8C9IWTDuJuRhWa7KjuR6MEwXP82eK', N'girishsuri@gmail.com', N'7455058868', N'53ff0ee9-005c-4943-8ae4-618d7e9969db')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'8f73c7b9-aad0-4f4c-aab3-15c68cbbed6f', N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'a429f6bc-3ac0-49d7-8333-29c27bce05b0')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'5340b860-7490-4ae0-a276-211f76ca64ce', N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'6ba5811f-8032-4019-8d10-925da9b22df1')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'0bd1bc61-5771-47f3-80c9-8f9e7f0cf4fe', N'ab8173c3-1c6a-427f-978e-2c2b55488cae', N'0f6e2661-7cb4-42fe-bbf9-13b509278deb')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'd5ed2a53-566b-4e0b-b35f-0606df105a2a', N'S')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'7d630da6-a090-46e6-a56c-07401f7d2011', N'red')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'119562ee-0a08-4766-b9a9-17747b601964', N'yellowL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'4dad7971-fe30-41dc-8704-25327abf7cc0', N'15inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'7a04eeb4-5a72-4db1-a806-2c944de95061', N'black')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'98bfeaf1-08f0-40ba-927e-2d91dacf08cb', N'5US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'f88594f7-382c-4f97-b5d4-3dcb90473a50', N'M')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'3870817e-601c-427f-bf59-3ffcdd2be85a', N'9US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'312e5e95-98f5-4d59-9078-70ae55053925', N'gold')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'3ec17295-641d-4a7e-b3ac-762e45bae673', N'organe')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'a8d95acf-2f3e-4135-9072-7bc5ba77021d', N'grey')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'f2226bc3-2eee-4d57-a215-8246e3e8f7fc', N'6inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'951e1412-3f43-40e2-ae69-8428ed918d2d', N'5inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'3b1a2e98-1354-42f6-b0d5-9e3dd4bdaacb', N'10US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'ab7da0e2-76c0-401c-ba3c-abb5f9c11e33', N'yellow')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'f006cf59-163b-408e-a66b-b4880d995281', N'L')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'44c61d2a-ea19-4a9b-b8a3-cc9ad1094674', N'XL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'228492df-b8f0-4ebe-9b7a-d153c398c26b', N'white')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'5864d94c-153d-4c69-b88f-d964d6520f8d', N'6US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'73bd615c-3c5b-4207-b3b7-dcf6a65d0c6e', N'7US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'a22f53ab-e822-4468-a97a-dd775a728855', N'XLL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'2cb2e0cd-7065-4994-934a-e178e9a49090', N'8US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'e9e521da-09f4-436c-b897-f2d1b3da9eee', N'blue')
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'df276224-d363-4e5e-a734-016900f2ad90', N'5~21', N'31933d65-105a-47a8-8682-c81af28f409a', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cadcf3a0-544c-406e-90d8-022639954fbe', N'7', N'32cbeba8-9cd4-450f-83c5-9531949dc7de', 560, 80, 0, 6)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'46dda5aa-1469-4b6d-903e-04517e678462', N'1', N'a8df9d85-356f-4a70-9b5b-691a64364f44', 5699, 88, 0, 1)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e9034c6c-c966-4bef-9d16-0a8ec7703445', N'7~21', N'b951e82d-e8e0-4ca5-96ea-ddaedfe4b00c', 2000, 10, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'921d5556-9d6d-4dc0-85f7-0c399f42ae80', N'20~21', N'464deb4c-1b67-49dd-a5da-bad62c30745b', 1000, 10, 750, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'02fabb21-5576-4376-ba84-0ca9de18ac5e', N'25~26', N'4863c773-a7ad-4fc4-b4ac-959a7608cbf5', 9200, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f49f73ae-c3a1-4637-9855-1060b3a3d0f0', N'20', N'195992d3-357a-4d3c-aedd-93764f2ed045', 2700, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ea69097f-6ce6-44c0-9eb3-17e086e216e4', N'6~26', N'4b458fd1-9861-41db-b7c3-1202de1b082e', 21700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ef45d35f-5fd4-44c5-81cf-2779aff38ff9', N'9', N'0ce10119-952f-48a6-9562-c21979386bd5', 6789, 56, 0, 3)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'59bc7bbf-cad5-43ec-b2ec-2ef49ea89a26', N'1', N'e2f24026-cef3-4884-acbe-c51c0fed9602', 800, 100, 0, 50)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a44c8fca-752e-45e1-ab12-33b2c6779c6a', N'1~11', N'1d8e1b33-4b57-4a96-8a98-a7dc2e041621', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6f07deb8-09c5-4ff6-9c8b-361ce635e677', N'6~26', N'a0a43777-2834-4c14-829e-3c6b27de5041', 22100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'23579c0b-e9ae-44a4-be12-383d10d7e1a5', N'7~8', N'4f8d547a-bfac-4275-bb58-942fbbe20dc4', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4c7e4a63-13d0-4621-a2b0-395d8ffc4698', N'20~21', N'8f503b3d-7404-4dcb-b0db-5f32ea583ea5', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'40d05909-388a-4729-b535-3a1557f30c30', N'1', N'5c031670-7890-4e35-a5e7-989f402f8d55', 567, 5, 0, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6068d519-3e0d-41ad-8d15-4ebfc1a20998', N'12~13', N'59ad4308-18ad-4950-a64b-67eab7ac5c77', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0e4b4cc1-db15-46d7-a641-516c818057f3', N'1~2', N'b463c498-829c-4a67-b937-30a04edf3d05', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'378bad8d-3407-4ef4-9598-521d4df76cb4', N'6~15', N'eea43880-3f3f-4e1e-9579-5c20170fe5ec', 4500, 250, 0, 5)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2daae4d4-cd4c-44b2-bfeb-59abcd60024c', N'5~14', N'a2c502f2-2663-43df-9d6e-f0879e02e0d8', 7500, 78, 0, 67)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'93f8b67c-74d3-4122-a213-5c626628eb73', N'3~23', N'd2257601-4170-45a8-a1c6-5f3b59238444', 1700, 30, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3ca84ad5-88b8-40e0-a024-5eb999226b69', N'1~23', N'73f80262-e8b1-4e50-b8df-1ef2ec0d06d3', 700, 0, 7, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f867ea9d-4f1e-4aaa-9297-5f9de5bf6468', N'9~17', N'449af409-71d6-4531-970d-e1075419785a', 6789, 56, 0, 3)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c395dfd7-348b-48ed-a40d-645d47aff7e5', N'6~26', N'480910cd-2fc7-44d9-8e18-33ad607cbb9b', 1200, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0ec72a55-8ded-4002-972a-673defbf8829', N'20', N'6b3994bb-8f73-4cc2-89b6-67ea9877fa48', 7700, 50, 270, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f9d2cf2b-2077-4ae5-b5ed-6a149c861dc5', N'1', N'a4fa21ec-3d92-49de-8d80-d7ef23dca806', 1700, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b57115e1-0aa6-41c9-8b78-6c8e2b3d0e70', N'3~23', N'178437f8-1a23-4214-a0dd-1de416187480', 2100, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0c036fd6-beb1-42d7-9040-750efeceb3b7', N'5', N'69aa5040-deef-4e49-9a08-aaa359e3d4cd', 7500, 78, 0, 67)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'325b79ab-0a30-456b-b1e3-77c7a3f8da48', N'9~10', N'55a43522-da03-4ecf-b142-18e8935a0492', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'06a9ca8d-11c5-4015-8a5e-7d8d0de08008', N'6~26', N'c9c871bc-28ee-4561-858a-e75205d1f168', 7200, 0, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'be21750f-a439-4fe7-ad3d-7e7e155a1f49', N'20~21', N'178437f8-1a23-4214-a0dd-1de416187480', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'94b22817-13d0-43cf-9bd8-814877f7b373', N'3~4', N'f6fe4304-25a0-41df-810e-2d24a469c32b', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8b5da6f9-5395-4137-be19-8ac64d364dcc', N'6', N'82f01abf-55ab-45f6-9cc4-39ed2afb02fe', 2500, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cf7c7b04-a90f-4245-84bb-8bc48e2ebb90', N'5~2', N'4103b462-29eb-4fc1-b34c-3ec354a32d1e', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'56743ad9-93de-41c9-83a0-8be6bd55d3f5', N'6~26', N'8995faac-053d-40ba-b4b2-2c50dd1fcb7a', 1520, 0, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2ecced1d-1156-41f5-8d5a-8db79379b78c', N'6', N'6b3994bb-8f73-4cc2-89b6-67ea9877fa48', 7500, 50, 270, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8dac3faa-be6d-4763-9b48-8dbe7456f8dc', N'5~21', N'c7316907-6850-4ecc-84fc-2be890057dfd', 2300, 10, 250, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c81b1abd-2607-4fec-922f-915122710938', N'1~14', N'4b719598-6cce-400b-920d-bea31f61a996', 800, 100, 0, 50)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'04109bbb-59aa-4885-bfed-925948b482db', N'6~26', N'8c47f8b5-1352-40af-bd57-c3c46f5351e3', 2320, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6f934217-5993-4663-87a1-929262c17c42', N'6', N'195992d3-357a-4d3c-aedd-93764f2ed045', 2500, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'18f60983-a1ab-49d1-9f20-964e4bff20fa', N'6~2', N'de82cfbe-98ef-4079-8d55-f1d16c70c1fe', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9020a17d-235d-4dc4-b83d-9e421e22fb72', N'20~21', N'a7f2a4ab-7ca6-46c1-8127-494303a038c1', 1500, 0, 80, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd9e2ac05-6b1a-44a0-9a68-a0b3a02cfc86', N'6~26', N'4b885463-9b2a-4fb5-b4bb-5f96b5474559', 22100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2b76ea7f-1e43-4975-addc-a26df12f0d8f', N'1', N'df91a16c-57f5-489c-b2a4-277bb021963e', 5770, 30, 104, 997)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'03e12c8b-a0c9-41df-b495-a3291f78ad11', N'25', N'4cb5db3d-4fbd-45f0-a927-c20ae91d4bd9', 5900, 20, 507, 1001)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'fc88f1a7-c2ca-42e8-a9cc-a344c01528fd', N'3~2', N'b463c498-829c-4a67-b937-30a04edf3d05', 900, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e4218f2e-0f35-4c8f-8f32-a57c527b56a1', N'12~18', N'a5f8845a-948f-42bd-94b8-719b31e4c4e3', 777, 56, 0, 4)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a761d94c-8729-489b-82d4-a696beaaf9f6', N'7~21', N'd2257601-4170-45a8-a1c6-5f3b59238444', 1700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'15c08ceb-8f58-44b3-ba04-a7379593667e', N'22~21', N'471624c6-7411-40c6-ae89-879ad5cf657d', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'94af04d3-a2ce-4092-b186-a94ed56663e1', N'24~23', N'471624c6-7411-40c6-ae89-879ad5cf657d', 900, 20, 5, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'fe84d216-3391-4cc0-a94b-b1e8ac607139', N'1~23', N'c7316907-6850-4ecc-84fc-2be890057dfd', 2300, 10, 250, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'072a3b9e-37e1-4b14-a2a2-b69be9cb577f', N'6', N'f5af531b-ded2-4f3e-9a02-4d419908ee83', 2350, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7384faba-54ea-456b-b78b-b6ed6de1b226', N'3~10', N'c8fe9be7-5a62-4d6e-8d80-a2210aa76ba5', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'fc02587f-9b96-4af6-b216-b882d4d24b18', N'1', N'82f01abf-55ab-45f6-9cc4-39ed2afb02fe', 2700, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e42e276d-8af4-41f6-aa82-bc4aa76958b7', N'20', N'f5af531b-ded2-4f3e-9a02-4d419908ee83', 2750, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7705a2b9-d2ef-4c67-9ad0-bca35c7a2348', N'3', N'13bd543e-d2fb-4aeb-9ca3-e74e611fb970', 7699, 89, 0, 9)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a0c16f82-7e4f-49cb-828f-bef04f57d7f3', N'6', N'856be091-a30c-4262-a227-7a3ba7fa1770', 2500, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5b0bb3a9-e260-4278-92d2-c2707c3e4c31', N'6~26', N'8c6b5ce8-3bb7-4490-bff4-818197e6fdd8', 21300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ea07c717-5264-4831-b2c3-c3c52deafdc4', N'1~23', N'464deb4c-1b67-49dd-a5da-bad62c30745b', 1000, 10, 750, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4c7db0ca-8750-4725-a301-c685f3d77eaa', N'6', N'a4fa21ec-3d92-49de-8d80-d7ef23dca806', 1500, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a681b912-207a-40cd-aa0e-c7bcd95517a3', N'6~26', N'f275d995-df0c-4ab7-b939-00848fe1be75', 2200, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'85a6f664-47a5-4593-8670-c7c5c96ce955', N'19', N'7dbe23c1-c933-4489-ac0e-e68265ef8cb0', 777, 56, 0, 4)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'81bbc7d9-a9b2-4859-b116-d279ebb2d51d', N'1', N'856be091-a30c-4262-a227-7a3ba7fa1770', 2700, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'15e47612-f357-4c75-8a67-d4d70524b175', N'6', N'583744aa-ef23-450c-9a77-27ed6309c34e', 1550, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'bb2bf6e7-30ec-4a1d-b439-d54670e3719f', N'7~16', N'f2e5c024-66c8-49d9-9e9a-f3f88666e7c4', 560, 80, 0, 6)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7a1ea532-33f9-4c0d-b70b-d7c79e3d4b34', N'6', N'df91a16c-57f5-489c-b2a4-277bb021963e', 5700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a6823449-dd72-4290-bafd-d805aa951c08', N'1~15', N'c769a3b1-9415-4ec4-8276-1094005c2261', 5699, 88, 0, 1)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6d0f4407-ee9d-4037-83fc-dba45f850c2a', N'3~23', N'a7f2a4ab-7ca6-46c1-8127-494303a038c1', 1500, 0, 80, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'591e8e97-1713-4405-b092-e24d5240fc1a', N'1', N'583744aa-ef23-450c-9a77-27ed6309c34e', 1750, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'da2ff53e-ac47-46bd-9d5f-e29f45c4fb44', N'6', N'b0b49d27-dea5-4d03-bbda-017796bb5541', 5300, 25, 107, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'43d68f81-b85e-4c36-b16b-e4b363add84c', N'3~23', N'b951e82d-e8e0-4ca5-96ea-ddaedfe4b00c', 2000, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4986319d-c8ed-4b24-bc14-e4e5c76867d4', N'1~4', N'd66fbf41-0bc4-4589-bc00-4cbe4e44421e', 1000, 100, 1, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9e48e0aa-dad5-49c9-bf8c-e8547037a0bb', N'3~14', N'8f93a317-a21a-46e0-8fe0-359a79fd8173', 7699, 89, 0, 9)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'676150d7-15dc-4950-8f00-eb726be35613', N'6', N'1db24272-dedb-4f89-8526-f7153f0a8d2e', 4500, 250, 0, 5)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8d7c763f-01b5-4832-9f23-ec47a330fea2', N'3~15', N'282374b8-8660-472a-94b3-8ca12d44410c', 9000, 56, 1, 79)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'59fa4717-bdef-4bf5-be27-f0226366e5b2', N'1~23', N'8f503b3d-7404-4dcb-b0db-5f32ea583ea5', 1300, 25, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c0f9686a-b90a-4195-973b-f52c8c149f25', N'1~23', N'31933d65-105a-47a8-8682-c81af28f409a', 2100, 100, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e5dc8145-4560-49f0-a75a-f5e9e4390f58', N'3', N'40940829-2831-4066-8697-dfe86b4ae24e', 9000, 56, 0, 80)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd3977193-43c5-46ec-a325-f9d8978dd871', N'1~15', N'9ae2805f-f187-49bb-832f-7fe7ed70db71', 567, 5, 0, 100)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2f9bb4f3-9f4f-4079-9ca1-fd2d587f5480', N'20', N'b0b49d27-dea5-4d03-bbda-017796bb5541', 5700, 25, 107, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'539f6fe3-4b15-4c53-ad18-feeb294077a3', N'7~21', N'73f80262-e8b1-4e50-b8df-1ef2ec0d06d3', 700, 0, 70, 1000)
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'82363150-7803-4eac-8c0c-060ff2dbafd0', N'46dda5aa-1469-4b6d-903e-04517e678462', N'https://cdn.pixabay.com/photo/2016/08/19/16/13/scooter-1605608__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'19cb209e-7e03-4bc1-9aa2-0caea6c51cd8', N'a681b912-207a-40cd-aa0e-c7bcd95517a3', N'https://image.shutterstock.com/image-photo/portrait-photographer-covering-her-face-450w-763047211.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'7bb3412d-5956-4cdf-a835-1184b3fbd29a', N'e9034c6c-c966-4bef-9d16-0a8ec7703445', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'450bebf8-5bbc-4906-8a6a-155fbd554252', N'81bbc7d9-a9b2-4859-b116-d279ebb2d51d', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215058.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'22e85d7e-7f2d-4d0b-9b35-17d196ea0402', N'378bad8d-3407-4ef4-9598-521d4df76cb4', N'https://cdn.pixabay.com/photo/2013/10/17/18/20/believe-197091__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'83e97152-8afb-4af7-b1e9-1b73b0e43eba', N'8b5da6f9-5395-4137-be19-8ac64d364dcc', N'https://image.shutterstock.com/image-photo/old-sport-model-vintage-rolex-450w-1191114829.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'662d27f8-04e8-4098-9450-1cd889f527f4', N'43d68f81-b85e-4c36-b16b-e4b363add84c', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'288ec01f-66ea-42c3-814e-1f5897bde129', N'6d0f4407-ee9d-4037-83fc-dba45f850c2a', N'https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'35dac876-0c2f-4aa9-991b-21a423732ba4', N'59bc7bbf-cad5-43ec-b2ec-2ef49ea89a26', N'https://image.shutterstock.com/image-photo/attractive-cheerful-stunning-perfect-harsh-260nw-1044857047.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'777b9894-63b3-4eb3-90c3-2b1011d42359', N'2ecced1d-1156-41f5-8d5a-8db79379b78c', N'https://image.shutterstock.com/image-photo/black-fitness-watch-activity-tracker-450w-1013750869.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2823c28c-47fe-440b-913d-2bfaa40cda65', N'cadcf3a0-544c-406e-90d8-022639954fbe', N'https://cdn.pixabay.com/photo/2016/08/20/07/42/hiker-1607017__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'55dd0145-cf09-4db4-bb1a-2ca7f6f8b9b2', N'4c7db0ca-8750-4725-a301-c685f3d77eaa', N'https://image.shutterstock.com/image-photo/closeup-toned-shot-male-watches-450w-267798710.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b0f35b7d-a75f-4067-b562-32ea0a554bbc', N'da2ff53e-ac47-46bd-9d5f-e29f45c4fb44', N'https://image.shutterstock.com/image-photo/elegant-outfit-closeup-brown-wrist-450w-370222298.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'dff99aa8-bd11-4362-8a38-34b57c5ccc34', N'9020a17d-235d-4dc4-b83d-9e421e22fb72', N'https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'aeb85ecd-a20f-4434-ba0a-39b0764ed17a', N'04109bbb-59aa-4885-bfed-925948b482db', N'https://thumb1.shutterstock.com/display_pic_with_logo/526873/313473329/stock-photo-digital-photography-workstation-modern-digital-dslr-camera-laptop-computer-and-display-313473329.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'92d71872-19ed-4f40-8e1a-3d12dfe7664e', N'2f9bb4f3-9f4f-4079-9ca1-fd2d587f5480', N'https://image.shutterstock.com/image-photo/antique-gold-pocket-watch-lies-450w-1152253118.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'12da6f07-9553-475b-9b34-41d29d9a33db', N'02fabb21-5576-4376-ba84-0ca9de18ac5e', N'https://image.shutterstock.com/image-photo/burgas-bulgaria-may-4-2018-450w-1138310630.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'879f7f3e-d284-4968-a74e-45a140d0055e', N'0e4b4cc1-db15-46d7-a641-516c818057f3', N'https://cdn.pixabay.com/photo/2017/04/09/18/54/shoes-2216498_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fef4294e-3206-4c72-8d70-45a3f9c766e6', N'fc88f1a7-c2ca-42e8-a9cc-a344c01528fd', N'https://cdn.pixabay.com/photo/2015/04/20/13/24/person-731281_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'59bda106-db50-42ab-8a75-45aa5b0da7d9', N'15e47612-f357-4c75-8a67-d4d70524b175', N'https://image.shutterstock.com/image-photo/ratchaburithailand-5-apr-2018-man-450w-1062177503.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fe103263-d38b-40b0-bbc6-46c44f1db26f', N'676150d7-15dc-4950-8f00-eb726be35613', N'https://image.shutterstock.com/image-photo/laughing-beach-guy-shorts-shirt-260nw-552826066.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f9c3905d-fdbd-45a5-aa8e-485f1842bf44', N'6068d519-3e0d-41ad-8d15-4ebfc1a20998', N'https://cdn.pixabay.com/photo/2015/01/16/15/01/fashion-601565_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'385a40e6-aa75-44ff-90e3-49acaa989c7d', N'be21750f-a439-4fe7-ad3d-7e7e155a1f49', N'https://image.shutterstock.com/image-vector/different-ui-ux-gui-screens-450w-362295254.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'786cdfd2-fdcb-4514-9d25-4a6fa7d320c4', N'a761d94c-8729-489b-82d4-a696beaaf9f6', N'https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2e068c16-1cea-4f12-aa5b-4bc88861b472', N'c81b1abd-2607-4fec-922f-915122710938', N'https://cdn.pixabay.com/photo/2015/09/06/01/03/white-926838__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'53123def-b083-415d-a0dd-4dae96e339ff', N'5b0bb3a9-e260-4278-92d2-c2707c3e4c31', N'https://image.shutterstock.com/image-photo/groningen-netherlands-august-19-2018-450w-1171028293.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f54b87d0-947a-453c-90d0-5250c8759259', N'f9d2cf2b-2077-4ae5-b5ed-6a149c861dc5', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215112.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c1d4e848-f7b7-4f64-9431-5e161d997ef0', N'8d7c763f-01b5-4832-9f23-ec47a330fea2', N'https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008__480.png')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'35360568-1bf7-4a9a-9de2-5e673d7259ea', N'ef45d35f-5fd4-44c5-81cf-2779aff38ff9', N'https://cdn.pixabay.com/photo/2015/01/16/15/01/person-601564__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'492eeaa2-7881-4a25-aac8-61679810b8b0', N'a0c16f82-7e4f-49cb-828f-bef04f57d7f3', N'https://image.shutterstock.com/image-illustration/handwatch-icon-set-color-outline-450w-1165529206.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2518ee8a-09a2-4e23-8972-6485357140c9', N'2b76ea7f-1e43-4975-addc-a26df12f0d8f', N'https://image.shutterstock.com/image-photo/mens-wrist-watch-450w-655935412.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f031107c-0965-4ca4-884a-6866cb171f61', N'85a6f664-47a5-4593-8670-c7c5c96ce955', N'https://cdn.pixabay.com/photo/2017/08/07/15/12/shorts-2604804__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'77aaf6bc-c3e5-4bfe-8bea-6e98b189f28c', N'94af04d3-a2ce-4092-b186-a94ed56663e1', N'https://image.shutterstock.com/image-vector/design-mobile-application-ui-ux-450w-1069313000.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fed4d3df-1f0c-4997-acd5-7045efd0af92', N'6f07deb8-09c5-4ff6-9c8b-361ce635e677', N'https://image.shutterstock.com/image-photo/woman-using-dslr-mountain-suburb-450w-1184689315.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9afbee09-4334-4b38-a77d-722929ea5211', N'd3977193-43c5-46ec-a325-f9d8978dd871', N'https://cdn.pixabay.com/photo/2018/08/08/16/37/pole-3592608__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4b012a54-c6b1-4d92-b829-738fcc8385a7', N'e4218f2e-0f35-4c8f-8f32-a57c527b56a1', N'https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0bc65bec-0650-407b-b480-7e4d6b97e679', N'bb2bf6e7-30ec-4a1d-b439-d54670e3719f', N'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192__480.png')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'056d5348-b5ea-4792-b3c0-8468b8b94787', N'c0f9686a-b90a-4195-973b-f52c8c149f25', N'https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'92771a13-5126-4a2b-9fe5-89158fd24a66', N'7384faba-54ea-456b-b78b-b6ed6de1b226', N'https://cdn.pixabay.com/photo/2016/01/19/18/06/brown-shoes-1150071_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f3cccd2b-73e3-4aac-a583-89b7b6249381', N'23579c0b-e9ae-44a4-be12-383d10d7e1a5', N'https://free-images.com/lg/b48d/shoe_shoes_children_s.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'443c8790-d701-4e5f-8fbc-8c5e1bc24abd', N'591e8e97-1713-4405-b092-e24d5240fc1a', N'https://image.shutterstock.com/image-photo/luxury-watches-450w-518569816.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b1aa17b3-180e-447b-8d7e-935d931ff38c', N'df276224-d363-4e5e-a734-016900f2ad90', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c20fe36c-b81b-48a9-a738-94bafb13ac51', N'94b22817-13d0-43cf-9bd8-814877f7b373', N'https://image.shutterstock.com/image-photo/pair-sport-shoes-on-colorful-450w-1086173984.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'74aebad4-c948-4002-b78e-95ef94f8062c', N'd9e2ac05-6b1a-44a0-9a68-a0b3a02cfc86', N'https://image.shutterstock.com/image-photo/professional-digital-equipment-recording-video-450w-692685511.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a3b1a4f8-5fd9-47f8-a5cc-97bd95076319', N'9e48e0aa-dad5-49c9-bf8c-e8547037a0bb', N'https://cdn.pixabay.com/photo/2013/07/13/14/07/apparel-162180__480.png')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9765f648-6bcd-4e90-a207-980062c238a7', N'03e12c8b-a0c9-41df-b495-a3291f78ad11', N'https://image.shutterstock.com/image-photo/luxury-watches-450w-518569825.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ab9572ac-cb21-4d7f-9d12-9b70ca6f21c6', N'59fa4717-bdef-4bf5-be27-f0226366e5b2', N'https://image.shutterstock.com/image-vector/mobile-phone-vector-450w-119386792.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'26512f75-9ae0-43d2-a027-9f07f912f378', N'40d05909-388a-4729-b535-3a1557f30c30', N'https://cdn.pixabay.com/photo/2016/11/19/06/35/dress-up-1838144__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5a075a6e-1b39-4545-bf35-9fb9f74fa1b9', N'8dac3faa-be6d-4763-9b48-8dbe7456f8dc', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e50f4429-666f-4938-8a36-a0d106483bd8', N'072a3b9e-37e1-4b14-a2a2-b69be9cb577f', N'https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1181529889.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f0c4b607-feb4-47b3-a752-a77bfab1b4b1', N'a6823449-dd72-4290-bafd-d805aa951c08', N'https://cdn.pixabay.com/photo/2016/10/26/19/12/bad-story-1772283__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5a509200-c9cb-4a71-a122-ac25cdbce119', N'c395dfd7-348b-48ed-a40d-645d47aff7e5', N'https://image.shutterstock.com/image-photo/dslr-camera-isolated-on-black-450w-1181503345.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'878ff752-3b6d-419b-a711-adf21b97d2f5', N'e42e276d-8af4-41f6-aa82-bc4aa76958b7', N'https://image.shutterstock.com/image-photo/wireless-smart-watch-isolated-on-450w-788791027.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5c5cc1ee-0200-4cc8-8a3d-b0212866c6db', N'921d5556-9d6d-4dc0-85f7-0c399f42ae80', N'https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'606305d5-ebc3-487c-bbd5-b06c8c752cd0', N'6f934217-5993-4663-87a1-929262c17c42', N'https://image.shutterstock.com/image-photo/businessman-checking-time-watch-450w-381472021.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'75c36323-0716-4ddb-bd3a-b2fc65fe49f4', N'e5dc8145-4560-49f0-a75a-f5e9e4390f58', N'https://cdn.pixabay.com/photo/2015/03/26/10/37/young-691660__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'605eb069-cdef-4d46-ad24-c20e6e690cbc', N'fe84d216-3391-4cc0-a94b-b1e8ac607139', N'https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a0b7ee86-0c9d-4370-8822-c2cf0dcc1039', N'fc02587f-9b96-4af6-b216-b882d4d24b18', N'https://image.shutterstock.com/image-photo/wrist-watch-isolated-on-white-450w-343320308.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f13fe43c-5725-498f-ad48-c30115b24c91', N'ea07c717-5264-4831-b2c3-c3c52deafdc4', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'73f065a8-11a1-4e74-a34a-c9958626be00', N'56743ad9-93de-41c9-83a0-8be6bd55d3f5', N'https://image.shutterstock.com/image-photo/young-asian-cute-artist-woman-450w-1170637762.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3729c7e6-2e0e-489d-8f62-ca66a1d5dae5', N'0c036fd6-beb1-42d7-9040-750efeceb3b7', N'https://cdn.pixabay.com/photo/2016/08/22/10/04/traveler-1611614__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'afa59b73-2215-493b-a1be-cacbee7891ac', N'a44c8fca-752e-45e1-ab12-33b2c6779c6a', N'https://cdn.pixabay.com/photo/2018/08/04/00/18/hiking-shoes-3583017_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'14ed3ab8-cabd-4cde-83ab-ccc29eb5a2fc', N'4c7e4a63-13d0-4621-a2b0-395d8ffc4698', N'https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b5aefeca-61dd-4d53-a48c-cd488a66bca4', N'2daae4d4-cd4c-44b2-bfeb-59abcd60024c', N'https://cdn.pixabay.com/photo/2017/06/21/20/51/tshirt-2428521__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'96b4ce91-7fa2-4da8-a84b-d535eaa49411', N'7a1ea532-33f9-4c0d-b70b-d7c79e3d4b34', N'https://image.shutterstock.com/image-photo/closeup-designer-watch-on-businessman-450w-383220994.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2b093eca-6405-46bc-bc2f-d7b5d881852b', N'539f6fe3-4b15-4c53-ad18-feeb294077a3', N'https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'078d37eb-bad3-4b13-82da-d898473ac057', N'b57115e1-0aa6-41c9-8b78-6c8e2b3d0e70', N'https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'98b74a19-94ec-4105-85c4-dfb7b49583c2', N'325b79ab-0a30-456b-b1e3-77c7a3f8da48', N'https://image.shutterstock.com/image-photo/shoes-450w-525737722.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'12473afb-6c46-4015-b9ba-e218e44a02eb', N'18f60983-a1ab-49d1-9f20-964e4bff20fa', N'https://free-images.com/lg/ff5f/shoe_handmade_shoes_dress.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2b4dfa86-73e9-4350-86fd-e33ea4fffe9f', N'4986319d-c8ed-4b24-bc14-e4e5c76867d4', N'https://cdn.pixabay.com/photo/2014/06/18/18/42/running-shoe-371625_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bb9a80de-df2b-4aa4-bfd8-e3c46e834aa8', N'15c08ceb-8f58-44b3-ba04-a7379593667e', N'https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'42959b29-115c-4d8c-822e-e8c33618e75d', N'cf7c7b04-a90f-4245-84bb-8bc48e2ebb90', N'https://cdn.pixabay.com/photo/2014/07/31/23/42/legs-407196_1280.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4163c7e1-4deb-4ee8-8399-ebb7feb8f90d', N'f867ea9d-4f1e-4aaa-9297-5f9de5bf6468', N'https://cdn.pixabay.com/photo/2016/11/23/06/57/isolated-t-shirt-1852113__480.png')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ebdffb08-ca3b-409e-9007-eeec1f5e8e46', N'06a9ca8d-11c5-4015-8a5e-7d8d0de08008', N'https://image.shutterstock.com/image-photo/abstract-dslr-camera-on-railway-450w-1165395928.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bacb4c7b-a5cb-4681-ae41-f1f199db4a85', N'ea69097f-6ce6-44c0-9eb3-17e086e216e4', N'https://image.shutterstock.com/image-photo/digital-video-camera-gimbal-stabilization-450w-1086230840.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b02c410f-12dd-41e8-b73f-f690c3cbae7a', N'7705a2b9-d2ef-4c67-9ad0-bca35c7a2348', N'https://cdn.pixabay.com/photo/2017/08/07/18/59/girl-2606776__480.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b21b59a0-4b77-4983-bc9a-f81ff1610b48', N'f49f73ae-c3a1-4637-9855-1060b3a3d0f0', N'https://image.shutterstock.com/image-photo/woman-watch-gold-white-color-450w-575248648.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd2395387-781a-455e-b07c-f82d7faa39ef', N'3ca84ad5-88b8-40e0-a024-5eb999226b69', N'https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c7957e41-56eb-4186-89b8-fd1c67ada588', N'0ec72a55-8ded-4002-972a-673defbf8829', N'https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1015451965.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4ea4016a-f54f-45c8-8538-ff5791f33d36', N'93f8b67c-74d3-4122-a213-5c626628eb73', N'https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] ON 

INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'e9e521da-09f4-436c-b897-f2d1b3da9eee')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (2, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'2cb2e0cd-7065-4994-934a-e178e9a49090')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (3, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'7d630da6-a090-46e6-a56c-07401f7d2011')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (4, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'3b1a2e98-1354-42f6-b0d5-9e3dd4bdaacb')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (5, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'a8d95acf-2f3e-4135-9072-7bc5ba77021d')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (6, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'7a04eeb4-5a72-4db1-a806-2c944de95061')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (7, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'228492df-b8f0-4ebe-9b7a-d153c398c26b')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (8, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'98bfeaf1-08f0-40ba-927e-2d91dacf08cb')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (9, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'3ec17295-641d-4a7e-b3ac-762e45bae673')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (10, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'5864d94c-153d-4c69-b88f-d964d6520f8d')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (11, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'73bd615c-3c5b-4207-b3b7-dcf6a65d0c6e')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (12, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'ab7da0e2-76c0-401c-ba3c-abb5f9c11e33')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (13, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'3870817e-601c-427f-bf59-3ffcdd2be85a')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (14, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'f88594f7-382c-4f97-b5d4-3dcb90473a50')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (15, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'f006cf59-163b-408e-a66b-b4880d995281')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (16, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'd5ed2a53-566b-4e0b-b35f-0606df105a2a')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (17, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'44c61d2a-ea19-4a9b-b8a3-cc9ad1094674')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (18, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'a22f53ab-e822-4468-a97a-dd775a728855')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (19, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'119562ee-0a08-4766-b9a9-17747b601964')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (20, N'a13633f5-41ab-4c3e-86f9-7bed721c7337', N'312e5e95-98f5-4d59-9078-70ae55053925')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (21, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'951e1412-3f43-40e2-ae69-8428ed918d2d')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (22, N'71998a53-90ca-4e14-8857-d2523a8593af', N'a8d95acf-2f3e-4135-9072-7bc5ba77021d')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (23, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'f2226bc3-2eee-4d57-a215-8246e3e8f7fc')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (24, N'71998a53-90ca-4e14-8857-d2523a8593af', N'7d630da6-a090-46e6-a56c-07401f7d2011')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (25, N'71998a53-90ca-4e14-8857-d2523a8593af', N'e9e521da-09f4-436c-b897-f2d1b3da9eee')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (26, N'a8d01119-d1f0-4a8a-9dae-ada3897d68e7', N'4dad7971-fe30-41dc-8704-25327abf7cc0')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 12-12-2018 18:04:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CartVariantMapping_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CCartVariantMapping_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [default_ProductsSold]  DEFAULT ((0)) FOR [ProductsSold]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderDate]  DEFAULT (CONVERT([varchar](19),getdate(),(120))) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderCancelled]  DEFAULT ('N') FOR [isCancelled]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [default_TotalVariantsSold]  DEFAULT ((0)) FOR [TotalVariantsSold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_ListingPrice]  DEFAULT ((0)) FOR [ListingPrice]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_QuantitySold]  DEFAULT ((0)) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Inventory]  DEFAULT ((0)) FOR [Inventory]
GO
ALTER TABLE [dbo].[VariantImage] ADD  CONSTRAINT [default_ImageURL]  DEFAULT ('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png') FOR [ImageURL]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Cart]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Variant] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Variant]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddressID] FOREIGN KEY([DeliveryAddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderAddressID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_statusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_statusID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_OrderID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_UserID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID] FOREIGN KEY([OrderPlacedID])
REFERENCES [dbo].[OrderPlaced] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_VariantID] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_VariantID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_Address]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_User]
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD  CONSTRAINT [FK_Variant] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Variant] CHECK CONSTRAINT [FK_Variant]
GO
ALTER TABLE [dbo].[VariantImage]  WITH CHECK ADD  CONSTRAINT [FK_VariantImage] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[VariantImage] CHECK CONSTRAINT [FK_VariantImage]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_PropertyID] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_PropertyID]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_ValueID] FOREIGN KEY([ValueID])
REFERENCES [dbo].[Value] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_ValueID]
GO
/****** Object:  StoredProcedure [dbo].[addCategory]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addCategory]
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
GO
/****** Object:  StoredProcedure [dbo].[AddItem]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddItem]
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
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProduct]
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
GO
/****** Object:  StoredProcedure [dbo].[AddProperty]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProperty]
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
GO
/****** Object:  StoredProcedure [dbo].[AddValue]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddValue]
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
GO
/****** Object:  StoredProcedure [dbo].[AddVariant]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddVariant] 
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
GO
/****** Object:  StoredProcedure [dbo].[AddVariantImage]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddVariantImage]
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
GO
/****** Object:  StoredProcedure [dbo].[AddVariantPropertyValueMapping]    Script Date: 12-12-2018 18:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddVariantPropertyValueMapping]
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
GO
