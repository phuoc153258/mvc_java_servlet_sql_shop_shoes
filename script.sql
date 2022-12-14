USE [ShopShoes]
GO
/****** Object:  Table [dbo].[Origin]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Origin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[Price] [int] NULL,
	[BrandId] [int] NULL,
	[OriginId] [int] NULL,
	[DesignId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Design]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Design](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Design] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DetailProduct]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetailProduct]
AS
SELECT dbo.Brand.Name AS BrandName, dbo.Design.Name AS DesignName, dbo.Origin.Name AS OriginName, dbo.Product.Id, dbo.Product.Name, dbo.Product.Image, dbo.Product.Price, dbo.Product.BrandId, dbo.Product.OriginId, dbo.Product.DesignId
FROM   dbo.Brand INNER JOIN
             dbo.Product ON dbo.Brand.Id = dbo.Product.BrandId INNER JOIN
             dbo.Design ON dbo.Product.DesignId = dbo.Design.Id INNER JOIN
             dbo.Origin ON dbo.Product.OriginId = dbo.Origin.Id
GO
/****** Object:  Table [dbo].[User]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Cart]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Cart]
AS
SELECT dbo.[Order].Id, dbo.[Order].Name, dbo.[Order].Status, dbo.[Order].UserId, dbo.OrderDetail.Amount, dbo.OrderDetail.ProductId, dbo.Product.Name AS ProductName, dbo.Product.Image, dbo.Product.Price
FROM   dbo.[User] INNER JOIN
             dbo.[Order] ON dbo.[User].Id = dbo.[Order].UserId INNER JOIN
             dbo.OrderDetail ON dbo.[Order].Id = dbo.OrderDetail.OrderId INNER JOIN
             dbo.Product ON dbo.OrderDetail.ProductId = dbo.Product.Id
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21/12/2022 10:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (1, N'Prada', N'image/image_1.png')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (2, N'Reebok', N'image/image_1.png')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (3, N'Fila', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (4, N'Geox', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (5, N'Versace', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (6, N'MLB', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (7, N'Dior', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (8, N'Lacoste', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (9, N'Calvin Klein', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (10, N'Gucci', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (11, N'Adidas', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (12, N'Nike', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (13, N'Puma', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (14, N'Coach', N'1')
INSERT [dbo].[Brand] ([Id], [Name], [Image]) VALUES (15, N'Pedro', N'1')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Design] ON 

INSERT [dbo].[Design] ([Id], [Name]) VALUES (1, N'Giày Slip on')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (2, N'Giày hở gót')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (3, N'Giày cao gót')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (4, N'Giày tây')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (5, N'Giày chạy bộ')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (6, N'Giày tennis')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (7, N'Giày bệt')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (8, N'Sandals')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (9, N'Giày đá bóng')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (10, N'Giày cao cổ')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (11, N'Giày đánh golf')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (12, N'Giày bóng rổ')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (13, N'Giày sục')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (14, N'Giày bốt')
INSERT [dbo].[Design] ([Id], [Name]) VALUES (15, N'Giày trẻ em')
SET IDENTITY_INSERT [dbo].[Design] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (1, N'ORDER001', 1, 1)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (6, N'ORDER002', 0, 5)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (7, N'ORDER004', 1, 6)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (8, N'432', 0, NULL)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (9, N'dsa', 0, 14)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (10, N'ORDER07569ec4-cfbf-445f-9ac0-7af48a292026', 1, 1)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (11, N'ORDER14a0d545-3290-4ff7-b8e3-72b34e2aa34e', 0, 15)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (12, N'ORDERd2bd2c5d-e4ad-4bb1-8e61-80df0efdd686', 1, 1)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (13, N'ORDER00fb774b-c5c3-48ed-a7ca-02e41c95cbce', 1, 1)
INSERT [dbo].[Order] ([Id], [Name], [Status], [UserId]) VALUES (14, N'ORDER02e718fd-3804-4434-923c-ee23d17ef575', 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (1, 1, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (1, 2, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (1, 7, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (6, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (7, 1, 2)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (10, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (10, 2, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (11, 1, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (11, 9, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (12, 5, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (13, 3, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (13, 8, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Amount]) VALUES (14, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Origin] ON 

INSERT [dbo].[Origin] ([Id], [Name]) VALUES (1, N'Mỹ')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (2, N'Pháp')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (3, N'Ý')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (4, N'Hàn Quốc')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (5, N'Đức')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (6, N'Singapore')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (7, N'Anh')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (8, N'Nhật bản')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (9, N'Việt nam')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (10, N'Tây ban nha')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (11, N'Trung quốc')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (12, N'Thụy sĩ')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (13, N'Đài loan')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (14, N'Malaysia')
INSERT [dbo].[Origin] ([Id], [Name]) VALUES (15, N'Thái lan')
SET IDENTITY_INSERT [dbo].[Origin] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (1, N'Giày Thể Thao Nike Revolution 6 Next Nature Women’s 1', N'images/image_shoes_1.jpg', 1000000, 2, 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (2, N'Giày Thể Thao Adidas Runfalcon', N'images/image_shoes_2.jpg', 2000000, 2, 2, 2)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (3, N'Giày Thể Thao Lacoste', N'images/image_shoes_3.jpg', 1000000, 3, 3, 3)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (4, N'Giày Thể Thao Nam Lacoste Chaymon', N'images/image_shoes_4.jpg', 3000000, 4, 4, 4)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (5, N'Giày Thể Thao Nike Revolution 6 Next Nature Women’s', N'images/image_shoes_5.jpg', 2000000, 5, 5, 5)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (6, N'Giày Thể Thao Nike Air Force 1 HO20 BG ''Dual Swoosh Black', N'images/image_shoes_6.jpg', 1000000, 6, 6, 6)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (7, N'heheeeeeedsadsa', N'images/image_shoes_7.jpg', 10011110, 4, 5, 6)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (8, N'Giày Thể Thao MLB Chunky Classic A New York Yankees', N'images/image_shoes_8.jpg', 4000000, 2, 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (9, N'Giày Sneakers MLB Playball Paisley New York Yankees', N'images/image_shoes_9.jpg', 5000000, 9, 9, 9)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (10, N'Giày Bệt Clarks Gracelin Lola Ballet Flat', N'images/image_shoes_10.jpg', 3000000, 10, 10, 10)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (11, N'Giày Thể Thao Lacoste Men''s Graduate BL', N'images/image_shoes_11.jpg', 2000000, 11, 11, 11)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (12, N'Giày Thể Thao Lacoste Men''s L001 Leather Trainers', N'images/image_shoes_12.jpg', 2000000, 12, 12, 12)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (13, N'Giày Sneakers Dolce & Gabbana White Leather Màu Đen Trắng', N'images/image_shoes_13.jpg', 1000000, 13, 13, 13)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (14, N'Giày Thể Thao Nam Adidas Runfalcon F36201 Màu Xanh', N'images/image_shoes_14.jpg', 1500000, 14, 14, 14)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (15, N'Giày Thể Thao Nữ Adidas Duramo 9 EG8672 Màu Xám', N'images/image_shoes_15.jpg', 1500000, 15, 15, 15)
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [BrandId], [OriginId], [DesignId]) VALUES (17, N'Nguyễn Đôn Phước', N'images/image_shoes_1.jpg', 1, 6, 8, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Fullname], [Username], [Email], [PhoneNumber], [Password], [Avatar], [RoleId]) VALUES (1, N'admin', N'admin', N'admin@gmail.com', N'0123456789', N'202cb962ac59075b964b07152d234b70', N'image/image_default.png', 1)
INSERT [dbo].[User] ([Id], [Fullname], [Username], [Email], [PhoneNumber], [Password], [Avatar], [RoleId]) VALUES (5, N'phuoc1', N'phuoc1', N'phuoc1@gmail.com', N'0123456789', N'590e76c9398927684fd4b59a88ce721a', N'image/image_default.png', 1)
INSERT [dbo].[User] ([Id], [Fullname], [Username], [Email], [PhoneNumber], [Password], [Avatar], [RoleId]) VALUES (6, N'phuoc2', N'phuoc2', N'phuoc2@gmail.com', N'0123456789', N'590e76c9398927684fd4b59a88ce721a', N'image/image_default.png', 2)
INSERT [dbo].[User] ([Id], [Fullname], [Username], [Email], [PhoneNumber], [Password], [Avatar], [RoleId]) VALUES (14, N'ndphuoc', N'ndphuoc254', N'ndphuoc@gmail.com', N'', N'590e76c9398927684fd4b59a88ce721a', N'', 2)
INSERT [dbo].[User] ([Id], [Fullname], [Username], [Email], [PhoneNumber], [Password], [Avatar], [RoleId]) VALUES (15, N'testtest', N'testtest', N'testtest@gmail.com', N'', N'590e76c9398927684fd4b59a88ce721a', N'', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand1] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Design1] FOREIGN KEY([DesignId])
REFERENCES [dbo].[Design] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Design1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Origin1] FOREIGN KEY([OriginId])
REFERENCES [dbo].[Origin] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Origin1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 147
               Left = 312
               Bottom = 344
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetail"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 202
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 9
               Left = 894
               Bottom = 206
               Right = 1116
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Cart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Cart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[39] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -144
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Brand"
            Begin Extent = 
               Top = 0
               Left = 378
               Bottom = 170
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Origin"
            Begin Extent = 
               Top = 35
               Left = 1050
               Bottom = 178
               Right = 1272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Design"
            Begin Extent = 
               Top = 220
               Left = 710
               Bottom = 363
               Right = 932
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 72
               Left = 42
               Bottom = 269
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetailProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetailProduct'
GO
