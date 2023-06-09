CREATE DATABASE [HKQTravelingWebsite2]
GO
USE [HKQTravelingWebsite2]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id_admin] [bigint] IDENTITY(1,1) NOT NULL,
	[user_admin] [varchar](50) NOT NULL,
	[pass_word] [varchar](100) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[status] [int] NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id_Bill] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_BookingFlightTour] [bigint] NULL,
	[ID_BookingIndividual] [bigint] NULL,
	[ID_BookingHotelTour] [bigint] NULL,
	[id_BookingTour] [bigint] NULL,
	[id_Staff] [bigint] NULL,
	[total_Price] [decimal](18, 2) NULL,
	[Bill_Date] [datetime] NULL,
	[Date_Create] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Tour]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Tour](
	[id_BookingTour] [bigint] IDENTITY(1,1) NOT NULL,
	[Booking_Date] [datetime] NOT NULL,
	[Paid] [bit] NULL,
	[Status] [int] NULL,
	[Date_Create] [datetime] NOT NULL,
	[Date_Update] [datetime] NULL,
	[id_guest_with_account] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_BookingTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingFlightTour]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingFlightTour](
	[ID_BookingFlightTour] [bigint] IDENTITY(1,1) NOT NULL,
	[id_Tour] [bigint] NOT NULL,
	[id_Flight] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BookingFlightTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingHotelTour]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingHotelTour](
	[ID_BookingHotelTour] [bigint] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [datetime] NOT NULL,
	[CheckOutDate] [datetime] NOT NULL,
	[id_Tour] [bigint] NOT NULL,
	[id_Hotel] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BookingHotelTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingIndividual]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingIndividual](
	[ID_BookingIndividual] [bigint] IDENTITY(1,1) NOT NULL,
	[id_Hotel] [bigint] NULL,
	[id_Flight] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BookingIndividual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[id_Destination] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [varchar](100) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Destination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Service]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Service](
	[id_BookingTour] [bigint] NOT NULL,
	[id_Service] [bigint] NOT NULL,
	[Quantity_Service] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_BookingTour] ASC,
	[id_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Tour]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Tour](
	[id_Tour] [bigint] NOT NULL,
	[id_BookingTour] [bigint] NOT NULL,
	[Num_Adult] [int] NULL,
	[Num_Child] [int] NULL,
	[Note] [text] NULL,
	[Departure_Date_Reality] [datetime] NULL,
	[Return_Date] [datetime] NULL,
	[id_Discount] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tour] ASC,
	[id_BookingTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id_Discount] [bigint] IDENTITY(1,1) NOT NULL,
	[name_discount] [nvarchar](200) NULL,
	[value_calculate] [decimal](18, 2) NULL,
	[begin_discount] [datetime] NULL,
	[end_discount] [datetime] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id_Discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id_Flight] [bigint] IDENTITY(1,1) NOT NULL,
	[AirPlane] [varchar](50) NULL,
	[Flight_Number] [varchar](10) NULL,
	[Departure_Time] [datetime] NULL,
	[Arrival_Time] [datetime] NULL,
	[Origin] [nvarchar](50) NULL,
	[Destination] [nvarchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
	[Type] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[NumberOfPassengers] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Flight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest_with_Account]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest_with_Account](
	[id_guest_with_account] [bigint] IDENTITY(1,1) NOT NULL,
	[user_guest] [varchar](50) NULL,
	[pass_word] [varchar](100) NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Sex] [varchar](5) NOT NULL,
	[Image] [varchar](100) NULL,
	[Date_Create] [datetime] NULL,
	[Date_Update] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_guest_with_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORY_BILL]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORY_BILL](
	[ID_HISTORY] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_CREATE] [datetime] NULL,
	[STATUS] [int] NULL,
	[id_Bill] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_HISTORY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id_Hotel] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Ranking] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Hotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id_Room] [bigint] IDENTITY(1,1) NOT NULL,
	[Amenities] [varchar](255) NULL,
	[Num_Room] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Descriptions] [text] NULL,
	[id_Hotel] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id_Service] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[Date_Create] [datetime] NOT NULL,
	[Date_Update] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id_Staff] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[pass_word] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Age] [int] NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Image] [varchar](100) NULL,
	[Rating] [int] NULL,
	[Date_Create] [datetime] NOT NULL,
	[Date_Update] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id_Tour] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Schedule] [text] NULL,
	[Image] [varchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[Departure_Day_Planned] [datetime] NULL,
	[Duration] [nvarchar](10) NULL,
	[Availability] [int] NULL,
	[Status] [int] NULL,
	[id_TourType] [bigint] NULL,
	[id_Destination] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_Type]    Script Date: 5/12/2023 4:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Type](
	[id_TourType] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_TourType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id_admin], [user_name], [pass_word], [fullName], [status], [Email]) VALUES (1, N'quang', N'123', N'Ngô Minh Quang', 1, N'quangngo1310@gmail.com')
INSERT [dbo].[admin] ([id_admin], [user_name], [pass_word], [fullName], [status], [Email]) VALUES (2, N'kien', N'123', N'Đoàn Trung Kiên', 1, N'123@gmail.com')
INSERT [dbo].[admin] ([id_admin], [user_name], [pass_word], [fullName], [status], [Email]) VALUES (3, N'hung', N'123', N'Hà Lâm Hùng', 1, N'312@gmail.com')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking_Tour] ON 

INSERT [dbo].[Booking_Tour] ([id_BookingTour], [Booking_Date], [Paid], [Status], [Date_Create], [Date_Update], [id_guest_with_account]) VALUES (1, CAST(N'2023-04-29T18:25:53.813' AS DateTime), 1, 1, CAST(N'2023-04-29T18:25:53.813' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Booking_Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingFlightTour] ON 

INSERT [dbo].[BookingFlightTour] ([ID_BookingFlightTour], [id_Tour], [id_Flight]) VALUES (1, 5, 1)
INSERT [dbo].[BookingFlightTour] ([ID_BookingFlightTour], [id_Tour], [id_Flight]) VALUES (2, 5, 3)
INSERT [dbo].[BookingFlightTour] ([ID_BookingFlightTour], [id_Tour], [id_Flight]) VALUES (3, 5, 2)
SET IDENTITY_INSERT [dbo].[BookingFlightTour] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingHotelTour] ON 

INSERT [dbo].[BookingHotelTour] ([ID_BookingHotelTour], [CheckInDate], [CheckOutDate], [id_Tour], [id_Hotel]) VALUES (1, CAST(N'2023-05-29T18:25:53.813' AS DateTime), CAST(N'2023-06-01T18:25:53.813' AS DateTime), 5, 6)
INSERT [dbo].[BookingHotelTour] ([ID_BookingHotelTour], [CheckInDate], [CheckOutDate], [id_Tour], [id_Hotel]) VALUES (2, CAST(N'2023-05-22T18:25:53.813' AS DateTime), CAST(N'2023-05-25T18:25:53.813' AS DateTime), 1, 1)
INSERT [dbo].[BookingHotelTour] ([ID_BookingHotelTour], [CheckInDate], [CheckOutDate], [id_Tour], [id_Hotel]) VALUES (3, CAST(N'2023-05-22T18:25:53.813' AS DateTime), CAST(N'2023-05-25T18:25:53.813' AS DateTime), 1, 2)
INSERT [dbo].[BookingHotelTour] ([ID_BookingHotelTour], [CheckInDate], [CheckOutDate], [id_Tour], [id_Hotel]) VALUES (4, CAST(N'2023-05-22T18:25:53.813' AS DateTime), CAST(N'2023-05-25T18:25:53.813' AS DateTime), 1, 3)
INSERT [dbo].[BookingHotelTour] ([ID_BookingHotelTour], [CheckInDate], [CheckOutDate], [id_Tour], [id_Hotel]) VALUES (5, CAST(N'2023-05-22T18:25:53.813' AS DateTime), CAST(N'2023-05-25T18:25:53.813' AS DateTime), 1, 4)
SET IDENTITY_INSERT [dbo].[BookingHotelTour] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingIndividual] ON 

INSERT [dbo].[BookingIndividual] ([ID_BookingIndividual], [id_Hotel], [id_Flight]) VALUES (1, 5, 1)
INSERT [dbo].[BookingIndividual] ([ID_BookingIndividual], [id_Hotel], [id_Flight]) VALUES (2, 5, 2)
INSERT [dbo].[BookingIndividual] ([ID_BookingIndividual], [id_Hotel], [id_Flight]) VALUES (3, 5, 3)
INSERT [dbo].[BookingIndividual] ([ID_BookingIndividual], [id_Hotel], [id_Flight]) VALUES (4, 5, 4)
SET IDENTITY_INSERT [dbo].[BookingIndividual] OFF
GO
SET IDENTITY_INSERT [dbo].[Destination] ON 

INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (1, N'Đà Lạt', N'dalat.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (2, N'Đà Nẵng', N'danang.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (3, N'Phú Quốc', N'phuquoc.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (4, N'Hội An', N'hoian.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (5, N'Sapa', N'sapa.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (6, N'Paris', N'paris.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (7, N'Dubai', N'dubai.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (8, N'New York', N'ny.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (9, N'Los Angeles', N'la.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (10, N'Korea', N'kr.jpg', 1)
INSERT [dbo].[Destination] ([id_Destination], [Name], [Image], [Status]) VALUES (11, N'Côn Ð?o', N'condao.jpg', 1)
SET IDENTITY_INSERT [dbo].[Destination] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id_Discount], [name_discount], [value_calculate], [begin_discount], [end_discount]) VALUES (1, N'HKQ & Sacombank tung ưu đãi “Tiền về đầy ví - Du hí thả ga” (Welcom June)', CAST(0.32 AS Decimal(18, 2)), CAST(N'2023-05-31T23:59:59.000' AS DateTime), CAST(N'2023-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[Discount] ([id_Discount], [name_discount], [value_calculate], [begin_discount], [end_discount]) VALUES (2, N'Sacombank tung ưu đãi (Welcom June)', CAST(0.25 AS Decimal(18, 2)), CAST(N'2023-05-31T23:59:59.000' AS DateTime), CAST(N'2023-06-30T23:59:59.000' AS DateTime))
INSERT [dbo].[Discount] ([id_Discount], [name_discount], [value_calculate], [begin_discount], [end_discount]) VALUES (3, N'HKQ 7 (Welcom July)', CAST(0.50 AS Decimal(18, 2)), CAST(N'2023-06-30T23:59:59.000' AS DateTime), CAST(N'2023-07-31T23:59:59.000' AS DateTime))
INSERT [dbo].[Discount] ([id_Discount], [name_discount], [value_calculate], [begin_discount], [end_discount]) VALUES (4, N'(Welcom July', CAST(0.32 AS Decimal(18, 2)), CAST(N'2023-06-30T23:59:59.000' AS DateTime), CAST(N'2023-07-31T23:59:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (1, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 1)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (2, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 2)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (3, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 3)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (4, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 4)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (5, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 5)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (6, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 6)
INSERT [dbo].[Flight] ([id_Flight], [AirPlane], [Flight_Number], [Departure_Time], [Arrival_Time], [Origin], [Destination], [Price], [Type], [Class], [NumberOfPassengers]) VALUES (7, N'Bamboo Airways', N'BAV1034', CAST(N'2023-05-06T18:25:53.813' AS DateTime), CAST(N'2023-05-06T20:25:53.813' AS DateTime), N'Co Ong', N'Noi Bai Intl', CAST(3000000.00 AS Decimal(10, 2)), N'E190', N'High Class', 7)
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest_with_Account] ON 

INSERT [dbo].[Guest_with_Account] ([id_guest_with_account], [user_name], [pass_word], [fullName], [Phone], [Email], [Birthday], [Address], [Sex], [Image], [Date_Create], [Date_Update]) VALUES (1, N'quang', N'123', N'NGÔ MINH QUANG', N'0981494344', N'quangngo1310@gmail.com', CAST(N'2002-10-13' AS Date), N'13, D5, Ward 25, Binh Thanh District, HCMC', N'Nam', NULL, CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL,1)
SET IDENTITY_INSERT [dbo].[Guest_with_Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (1, N'Ana Mandara Villas Dalat Resort & Spa', NULL, NULL, 5, NULL)
INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (2, N'Dalat Wonder Resort', NULL, NULL, 4, NULL)
INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (3, N'Le Recit Boutique Hotel de Dalat', NULL, NULL, 3, NULL)
INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (4, N'Khách sạn The Grace Dalat', NULL, NULL, 2, NULL)
INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (5, N'LATA Hotel & Apartments', NULL, NULL, 1, NULL)
INSERT [dbo].[Hotel] ([id_Hotel], [Name], [Email], [Phone], [Ranking], [Description]) VALUES (6, N'Khách sạn The Secret Côn Đảo
(The Secret Con Dao)', NULL, NULL, 4, NULL)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (1, N'Free Wifi', 1, CAST(2788002.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (2, N'Fool', 2, CAST(3221505.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (3, N'Restaurant', 3, CAST(3287250.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (4, N'Free Wifi', 4, CAST(3655008.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (5, N'Restaurant', 1, CAST(1430791.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (6, N'Infinity Pool', 2, CAST(1430791.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (7, N'Free Parking', 3, CAST(1430791.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (8, N'Restaurant', 1, CAST(1437160.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (9, N'Restaurant', 2, CAST(1512800.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (10, N'Elevator', 1, CAST(367200.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (11, N'Elevator', 2, CAST(408000.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (12, N'Fontdesk 24H', 1, CAST(652545.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Room] ([id_Room], [Amenities], [Num_Room], [Price], [Descriptions], [id_Hotel]) VALUES (13, N'Free Wifi', 2, CAST(725050.00 AS Decimal(10, 2)), NULL, 5)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id_Service], [name], [price], [Date_Create], [Date_Update], [Status]) VALUES (1, N'Motorcycle', CAST(150000.00 AS Decimal(10, 2)), CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
INSERT [dbo].[Service] ([id_Service], [name], [price], [Date_Create], [Date_Update], [Status]) VALUES (2, N'Fishing', CAST(350000.00 AS Decimal(10, 2)), CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
INSERT [dbo].[Service] ([id_Service], [name], [price], [Date_Create], [Date_Update], [Status]) VALUES (3, N'Toll booths', CAST(70000.00 AS Decimal(10, 2)), CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([id_Staff], [user_name], [pass_word], [fullName], [Phone], [Email], [Age], [Position], [Image], [Rating], [Date_Create], [Date_Update], [Status]) VALUES (1, N'quang', N'123', N'NGÔ MINH QUANG', N'0123456789', N'quangngo1310@gmail.com', 21, N'Manager', NULL, 10, CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
INSERT [dbo].[Staff] ([id_Staff], [user_name], [pass_word], [fullName], [Phone], [Email], [Age], [Position], [Image], [Rating], [Date_Create], [Date_Update], [Status]) VALUES (2, N'kien', N'123', N'ĐOÀN TRUNG KIÊN', N'0123456789', N'123@gmail.com', 21, N'Manager', NULL, 10, CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
INSERT [dbo].[Staff] ([id_Staff], [user_name], [pass_word], [fullName], [Phone], [Email], [Age], [Position], [Image], [Rating], [Date_Create], [Date_Update], [Status]) VALUES (3, N'hung', N'123', N'HÀ LÂM HÙNG', N'0123456789', N'312@gmail.com', 21, N'Manager', NULL, 10, CAST(N'2023-04-06T18:25:53.813' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([id_Tour], [Name], [Schedule], [Image], [Price], [Departure_Day_Planned], [Duration], [Availability], [Status], [id_TourType], [id_Destination]) VALUES (1, N'Đà Lạt - Thác Bobla - KDL Cao Nguyên Hoa - Trang Trại rau và hoa Vạn Thành', N'3 Days', N'Thac_Bobla.jpg', CAST(800.00 AS Decimal(10, 2)), CAST(N'2023-05-21T00:00:00.000' AS DateTime), N'10 hours', 1, 1, 1, 1)
INSERT [dbo].[Tour] ([id_Tour], [Name], [Schedule], [Image], [Price], [Departure_Day_Planned], [Duration], [Availability], [Status], [id_TourType], [id_Destination]) VALUES (2, N'Phú Quốc - Kỳ Nghỉ Đẳng Cấp Tại Thiên Đường Biển Đảo', N'3 Days', N'phuquoc.jpg', CAST(35000000.00 AS Decimal(10, 2)), CAST(N'2023-05-19T00:00:00.000' AS DateTime), N'12 hours', 1, 1, 1, 3)
INSERT [dbo].[Tour] ([id_Tour], [Name], [Schedule], [Image], [Price], [Departure_Day_Planned], [Duration], [Availability], [Status], [id_TourType], [id_Destination]) VALUES (3, N'Đà Nẵng - Huế - Đầm Lập An - La Vang - Động Phong Nha & Thiên Đường - KDL Bà Nà - Cầu Vàng -Sơn Trà - Hội An - Đà Nẵng', N'5 Days', N'danang.jpg', CAST(7990000.00 AS Decimal(10, 2)), CAST(N'2023-05-30T00:00:00.000' AS DateTime), N'12 hours', 1, 1, 2, 2)
INSERT [dbo].[Tour] ([id_Tour], [Name], [Schedule], [Image], [Price], [Departure_Day_Planned], [Duration], [Availability], [Status], [id_TourType], [id_Destination]) VALUES (4, N'Đà Nẵng - Hội An - Bà Nà - Cầu Vàng - Huế - Trải nghiệm đi thuyền dạo Sông Hoài & Tặng show Ký Ức Hội An | Kích cầu Du lịch', N'3 Days', N'hoian.jpg', CAST(5490000.00 AS Decimal(10, 2)), CAST(N'2023-05-21T00:00:00.000' AS DateTime), N'14 hours', 1, 1, 2, 4)
INSERT [dbo].[Tour] ([id_Tour], [Name], [Schedule], [Image], [Price], [Departure_Day_Planned], [Duration], [Availability], [Status], [id_TourType], [id_Destination]) VALUES (5, N'Côn Đảo - Thiên Đường Của Biển', N'3 days', N'condao.jpg', CAST(6000000.00 AS Decimal(10, 2)), CAST(N'2023-06-29T18:25:53.813' AS DateTime), N'3 days', 1, 1, 2, 5)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[Tour_Type] ON 

INSERT [dbo].[Tour_Type] ([id_TourType], [Name], [Status]) VALUES (1, N'High-class', 1)
INSERT [dbo].[Tour_Type] ([id_TourType], [Name], [Status]) VALUES (2, N'Standard', 1)
INSERT [dbo].[Tour_Type] ([id_TourType], [Name], [Status]) VALUES (3, N'Save', 1)
INSERT [dbo].[Tour_Type] ([id_TourType], [Name], [Status]) VALUES (4, N'Good prices', 1)
SET IDENTITY_INSERT [dbo].[Tour_Type] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__7C9273C44C4504B9]    Script Date: 5/12/2023 4:21:23 PM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Guest_wi__5C7E359E909D4DBA]    Script Date: 5/12/2023 4:21:23 PM ******/
ALTER TABLE [dbo].[Guest_with_Account] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Guest_wi__7C9273C48EACFA6D]    Script Date: 5/12/2023 4:21:23 PM ******/
ALTER TABLE [dbo].[Guest_with_Account] ADD UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Guest_wi__A9D10534DF723C9C]    Script Date: 5/12/2023 4:21:23 PM ******/
ALTER TABLE [dbo].[Guest_with_Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__7C9273C4D7221642]    Script Date: 5/12/2023 4:21:23 PM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([id_BookingTour])
REFERENCES [dbo].[Booking_Tour] ([id_BookingTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([ID_BookingHotelTour])
REFERENCES [dbo].[BookingHotelTour] ([ID_BookingHotelTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([ID_BookingFlightTour])
REFERENCES [dbo].[BookingFlightTour] ([ID_BookingFlightTour])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([ID_BookingIndividual])
REFERENCES [dbo].[BookingIndividual] ([ID_BookingIndividual])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([id_Staff])
REFERENCES [dbo].[Staff] ([id_Staff])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking_Tour]  WITH CHECK ADD FOREIGN KEY([id_guest_with_account])
REFERENCES [dbo].[Guest_with_Account] ([id_guest_with_account])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingFlightTour]  WITH CHECK ADD FOREIGN KEY([id_Flight])
REFERENCES [dbo].[Flight] ([id_Flight])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingFlightTour]  WITH CHECK ADD FOREIGN KEY([id_Tour])
REFERENCES [dbo].[Tour] ([id_Tour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingHotelTour]  WITH CHECK ADD FOREIGN KEY([id_Hotel])
REFERENCES [dbo].[Hotel] ([id_Hotel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingHotelTour]  WITH CHECK ADD FOREIGN KEY([id_Tour])
REFERENCES [dbo].[Tour] ([id_Tour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingIndividual]  WITH CHECK ADD FOREIGN KEY([id_Flight])
REFERENCES [dbo].[Flight] ([id_Flight])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingIndividual]  WITH CHECK ADD FOREIGN KEY([id_Hotel])
REFERENCES [dbo].[Hotel] ([id_Hotel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail_Service]  WITH CHECK ADD FOREIGN KEY([id_BookingTour])
REFERENCES [dbo].[Booking_Tour] ([id_BookingTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail_Service]  WITH CHECK ADD FOREIGN KEY([id_Service])
REFERENCES [dbo].[Service] ([id_Service])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail_Tour]  WITH CHECK ADD FOREIGN KEY([id_BookingTour])
REFERENCES [dbo].[Booking_Tour] ([id_BookingTour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail_Tour]  WITH CHECK ADD FOREIGN KEY([id_Tour])
REFERENCES [dbo].[Tour] ([id_Tour])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail_Tour]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Tour_Discount] FOREIGN KEY([id_Discount])
REFERENCES [dbo].[Discount] ([id_Discount])
GO
ALTER TABLE [dbo].[Detail_Tour] CHECK CONSTRAINT [FK_Detail_Tour_Discount]
GO
ALTER TABLE [dbo].[HISTORY_BILL]  WITH CHECK ADD FOREIGN KEY([id_Bill])
REFERENCES [dbo].[Bill] ([id_Bill])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([id_Hotel])
REFERENCES [dbo].[Hotel] ([id_Hotel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([id_Destination])
REFERENCES [dbo].[Destination] ([id_Destination])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([id_TourType])
REFERENCES [dbo].[Tour_Type] ([id_TourType])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
