USE [master]
GO
/****** Object:  Database [RestaurantManagement]    Script Date: 3/30/2019 10:51:19 PM ******/
CREATE DATABASE [RestaurantManagement] ON  PRIMARY 
( NAME = N'RestaurantManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestaurantManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestaurantManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantManagement] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantManagement] SET DB_CHAINING OFF 
GO
USE [RestaurantManagement]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Discount_ID] [varchar](10) NULL,
	[TB_ID] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__Bill__CF6E7D435AA2F367] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__Customer__8CB286B93B878E92] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Discount_ID] [varchar](10) NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK__Discount__6C137224ADCC8D6B] PRIMARY KEY CLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Dish_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Type_ID] [smallint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Detail] [ntext] NULL,
	[Images] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK__Dish__3B04B49FF6088173] PRIMARY KEY CLUSTERED 
(
	[Dish_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodType]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodType](
	[Type_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Detail] [ntext] NULL,
	[Images] [nvarchar](255) NULL,
 CONSTRAINT [PK__FoodType__FE90DDFEA997FEAA] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcribe]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcribe](
	[Email] [varchar](255) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Subcribe] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Table_ID] [smallint] NOT NULL,
	[TB_ID] [bigint] NULL,
	[Seats] [tinyint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__Table__BAB7E656C58FEF92] PRIMARY KEY CLUSTERED 
(
	[Table_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Detail]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Detail](
	[TB_ID] [bigint] NOT NULL,
	[Dish_ID] [smallint] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK__TB_Detai__52CB067CDED289D6] PRIMARY KEY CLUSTERED 
(
	[TB_ID] ASC,
	[Dish_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Information]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Information](
	[TB_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [bigint] NOT NULL,
	[Tb_Seats] [tinyint] NOT NULL,
	[DateSet] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK__TB_Infor__B17B4D35BA0AB581] PRIMARY KEY CLUSTERED 
(
	[TB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/30/2019 10:51:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Administrator] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK__User__206D9190635E7744] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Username], [Password], [Name], [Email], [Administrator], [CreatedDate], [ModifiedDate]) VALUES (1, N'baonguyen', N'031a9a7f7d5bb2ecdd555d6c4e440170', N'Nguyễn Trần Xuân Bảo', N'xvxiiixixviii@gmail.com', 1, CAST(N'2019-03-30T21:22:37.510' AS DateTime), CAST(N'2019-03-30T21:38:02.450' AS DateTime))
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Name], [Email], [Administrator], [CreatedDate], [ModifiedDate]) VALUES (2, N'tuehuynh', N'202cb962ac59075b964b07152d234b70', N'Đinh Huỳnh Tuệ Tuệ', N'dinhhuynhtue@gmail.com', 0, NULL, CAST(N'2019-03-30T21:39:32.793' AS DateTime))
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Name], [Email], [Administrator], [CreatedDate], [ModifiedDate]) VALUES (3, N'thaothach', N'202cb962ac59075b964b07152d234b70', N'Đặng Thị Thạch Thảo', N'dangthithachthao@gmail.com', 0, NULL, NULL)
INSERT [dbo].[User] ([User_ID], [Username], [Password], [Name], [Email], [Administrator], [CreatedDate], [ModifiedDate]) VALUES (20, N'quynhpham', N'202cb962ac59075b964b07152d234b70', N'Phạm Thị Quỳnh', N'phamthiquynh@gmail.com', 1, CAST(N'2019-03-30T22:49:28.940' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359E457F0A48]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__5C7E359E457F0A48] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__8CB286B88EB86AD7]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__8CB286B88EB86AD7] UNIQUE NONCLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D1053490521CF1]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__A9D1053490521CF1] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Discount__6C13722590589211]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[Discount] ADD  CONSTRAINT [UQ__Discount__6C13722590589211] UNIQUE NONCLUSTERED 
(
	[Discount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__User__206D9191AEFC55DE]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__206D9191AEFC55DE] UNIQUE NONCLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E4AEC40E55]    Script Date: 3/30/2019 10:51:20 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ__User__536C85E4AEC40E55] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Dish] ADD  CONSTRAINT [DF_Dish_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Subcribe] ADD  CONSTRAINT [DF_Subcribe_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TB_Information] ADD  CONSTRAINT [DF_TB_Information_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Administrator]  DEFAULT ((0)) FOR [Administrator]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__CreatedBy__5165187F] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__CreatedBy__5165187F]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__Discount_I__5441852A] FOREIGN KEY([Discount_ID])
REFERENCES [dbo].[Discount] ([Discount_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__Discount_I__5441852A]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__TB_ID__5629CD9C] FOREIGN KEY([TB_ID])
REFERENCES [dbo].[TB_Information] ([TB_ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__TB_ID__5629CD9C]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK__Dish__Type_ID__534D60F1] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[FoodType] ([Type_ID])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK__Dish__Type_ID__534D60F1]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK__Table__TB_ID__571DF1D5] FOREIGN KEY([TB_ID])
REFERENCES [dbo].[TB_Information] ([TB_ID])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK__Table__TB_ID__571DF1D5]
GO
ALTER TABLE [dbo].[TB_Detail]  WITH CHECK ADD  CONSTRAINT [FK__TB_Detail__Dish___4F7CD00D] FOREIGN KEY([Dish_ID])
REFERENCES [dbo].[Dish] ([Dish_ID])
GO
ALTER TABLE [dbo].[TB_Detail] CHECK CONSTRAINT [FK__TB_Detail__Dish___4F7CD00D]
GO
ALTER TABLE [dbo].[TB_Detail]  WITH CHECK ADD  CONSTRAINT [FK__TB_Detail__TB_ID__5535A963] FOREIGN KEY([TB_ID])
REFERENCES [dbo].[TB_Information] ([TB_ID])
GO
ALTER TABLE [dbo].[TB_Detail] CHECK CONSTRAINT [FK__TB_Detail__TB_ID__5535A963]
GO
ALTER TABLE [dbo].[TB_Information]  WITH CHECK ADD  CONSTRAINT [FK__TB_Inform__Creat__52593CB8] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[TB_Information] CHECK CONSTRAINT [FK__TB_Inform__Creat__52593CB8]
GO
ALTER TABLE [dbo].[TB_Information]  WITH CHECK ADD  CONSTRAINT [FK__TB_Inform__Custo__5070F446] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[TB_Information] CHECK CONSTRAINT [FK__TB_Inform__Custo__5070F446]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [ck_phone] CHECK  ((len([phone])>=(8) AND len([phone])<=(11) AND NOT [phone] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [ck_phone]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [CK_Rate] CHECK  (([rate]>=(0.01) AND [rate]<=(1)))
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [CK_Rate]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [ck_seats] CHECK  (([seats]>=(1) AND [seats]<=(10)))
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [ck_seats]
GO
ALTER TABLE [dbo].[TB_Information]  WITH CHECK ADD  CONSTRAINT [ck_tb_seats] CHECK  (([tb_seats]>=(1) AND [tb_seats]<=(50)))
GO
ALTER TABLE [dbo].[TB_Information] CHECK CONSTRAINT [ck_tb_seats]
GO
USE [master]
GO
ALTER DATABASE [RestaurantManagement] SET  READ_WRITE 
GO
