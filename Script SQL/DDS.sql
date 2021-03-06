CREATE DATABASE [BI_DDS]
GO

USE [BI_DDS]
GO
/****** Object:  Table [dbo].[DIM_BORO]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_BORO](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[BoroName] [varchar](100),
	[NgayCapNhat] [datetime],
	[TrangThai] [int],
	[NguonDuLieu] [int]
)

GO
/****** Object:  Table [dbo].[Dim_Dayy]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dayy](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Dayy] [int] NULL,
 )

GO
/****** Object:  Table [dbo].[DIM_DROPOFF]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DROPOFF](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[dropoff_longitude] [varchar](100) NULL,
	[dropoff_latitude] [varchar](100) NULL,
	[StreetID] [int] NULL,
	[BoroID] [int] NULL,
	[NguonDL] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
)

GO
/****** Object:  Table [dbo].[Dim_Hourr]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Hourr](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Hourr] [varchar](50) NULL,
 )

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Monthh]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Monthh](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Monthh] [int] NULL,
 )

GO
/****** Object:  Table [dbo].[DIM_NUMBER]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_STREET](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Street] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[NguonDL] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
)

GO
/****** Object:  Table [dbo].[DIM_PAYMENT]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PAYMENT](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Payment_type] [varchar](100) NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
	[NguonDuLieu] [int] NULL
)

GO
/****** Object:  Table [dbo].[DIM_PICKUP]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PICKUP](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[pickup_longitude] [varchar](100) NULL,
	[pickup_latitude] [varchar](100) NULL,
	[StreetID] [int] NULL,
	[BoroID] [int] NULL,
	[NguonDL] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
)

GO
/****** Object:  Table [dbo].[Dim_Yearr]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Yearr](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[Yearr] [int] NULL,
 )

GO
/****** Object:  Table [dbo].[FACT_BILL]    Script Date: 12/23/2020 11:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_BILL](
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[PUID] [int] NULL,
	[DOID] [int] NULL,
	[passenger_count] [int] NULL,
	[trip_distance] [float] NULL,
	[rate_code] [varchar](50) NULL,
	[Payment_type] [int] NULL,
	[fare_amount] [float] NULL,
	[surcharge] [float] NULL,
	[mta_tax] [float] NULL,
	[tip_amount] [float] NULL,
	[tolls_amount] [float] NULL,
	[total_amount] [float] NULL,
	[PU_Hour] [int] NULL,
	[PU_Day] [int] NULL,
	[PU_Month] [int] NULL,
	[PU_Year] [int] NULL,
	[DO_Hour] [int] NULL,
	[DO_Day] [int] NULL,
	[DO_Month] [int] NULL,
	[DO_Year] [int] NULL,
	[NguonDL] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL
)

GO
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Yearr_PU FOREIGN KEY (PU_Year) REFERENCES Dim_Yearr(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Monthh_PU FOREIGN KEY (PU_Month) REFERENCES Dim_Monthh(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Dayy_PU FOREIGN KEY (PU_Day) REFERENCES Dim_Dayy(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Hourr_PU FOREIGN KEY (PU_Hour) REFERENCES Dim_Hourr(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Yearr_DO FOREIGN KEY (DO_Year) REFERENCES Dim_Yearr(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Monthh_DO FOREIGN KEY (DO_Month) REFERENCES Dim_Monthh(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Dayy_DO FOREIGN KEY (DO_Day) REFERENCES Dim_Dayy(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_Dim_Hourr_DO FOREIGN KEY (DO_Hour) REFERENCES Dim_Hourr(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_DIM_PAYMENT FOREIGN KEY (Payment_type) REFERENCES DIM_PAYMENT(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_DIM_PICKUP FOREIGN KEY (PUID) REFERENCES DIM_PICKUP(ID)
ALTER TABLE FACT_BILL ADD CONSTRAINT FK_FACTBILL_DIM_DROPOFF FOREIGN KEY (DOID) REFERENCES DIM_DROPOFF(ID)

ALTER TABLE DIM_DROPOFF ADD CONSTRAINT FK_DIM_DROPOFF_DIM_STREET FOREIGN KEY (StreetID) REFERENCES DIM_STREET(ID)
ALTER TABLE DIM_PICKUP ADD CONSTRAINT FK_DIM_PICKUP_DIM_STREET FOREIGN KEY (StreetID) REFERENCES DIM_STREET(ID)
ALTER TABLE DIM_DROPOFF ADD CONSTRAINT FK_DIM_DROPOFF_DIM_BORO FOREIGN KEY (BoroID) REFERENCES DIM_BORO(ID)
ALTER TABLE DIM_PICKUP ADD CONSTRAINT FK_DIM_PICKUP_DIM_BORO FOREIGN KEY (BoroID) REFERENCES DIM_BORO(ID)


INSERT INTO Dim_Yearr(Yearr) VALUES(2014) 
INSERT INTO Dim_Yearr(Yearr) VALUES(2015) 

INSERT INTO Dim_Monthh(Monthh) VALUES(1) 
INSERT INTO Dim_Monthh(Monthh) VALUES(2) 
INSERT INTO Dim_Monthh(Monthh) VALUES(3) 
INSERT INTO Dim_Monthh(Monthh) VALUES(4) 
INSERT INTO Dim_Monthh(Monthh) VALUES(5) 
INSERT INTO Dim_Monthh(Monthh) VALUES(6) 
INSERT INTO Dim_Monthh(Monthh) VALUES(7) 
INSERT INTO Dim_Monthh(Monthh) VALUES(8) 
INSERT INTO Dim_Monthh(Monthh) VALUES(9) 
INSERT INTO Dim_Monthh(Monthh) VALUES(10) 
INSERT INTO Dim_Monthh(Monthh) VALUES(11) 
INSERT INTO Dim_Monthh(Monthh) VALUES(12) 

INSERT INTO Dim_Dayy(Dayy) VALUES(1) 
INSERT INTO Dim_Dayy(Dayy) VALUES(2) 
INSERT INTO Dim_Dayy(Dayy) VALUES(3) 
INSERT INTO Dim_Dayy(Dayy) VALUES(4) 
INSERT INTO Dim_Dayy(Dayy) VALUES(5) 
INSERT INTO Dim_Dayy(Dayy) VALUES(6) 
INSERT INTO Dim_Dayy(Dayy) VALUES(7) 
INSERT INTO Dim_Dayy(Dayy) VALUES(8) 
INSERT INTO Dim_Dayy(Dayy) VALUES(9) 
INSERT INTO Dim_Dayy(Dayy) VALUES(10) 
INSERT INTO Dim_Dayy(Dayy) VALUES(11) 
INSERT INTO Dim_Dayy(Dayy) VALUES(12) 
INSERT INTO Dim_Dayy(Dayy) VALUES(13) 
INSERT INTO Dim_Dayy(Dayy) VALUES(14) 
INSERT INTO Dim_Dayy(Dayy) VALUES(15) 
INSERT INTO Dim_Dayy(Dayy) VALUES(16) 
INSERT INTO Dim_Dayy(Dayy) VALUES(17)
INSERT INTO Dim_Dayy(Dayy) VALUES(18) 
INSERT INTO Dim_Dayy(Dayy) VALUES(19) 
INSERT INTO Dim_Dayy(Dayy) VALUES(20) 
INSERT INTO Dim_Dayy(Dayy) VALUES(21) 
INSERT INTO Dim_Dayy(Dayy) VALUES(22) 
INSERT INTO Dim_Dayy(Dayy) VALUES(23) 
INSERT INTO Dim_Dayy(Dayy) VALUES(24) 
INSERT INTO Dim_Dayy(Dayy) VALUES(25) 
INSERT INTO Dim_Dayy(Dayy) VALUES(26) 
INSERT INTO Dim_Dayy(Dayy) VALUES(27) 
INSERT INTO Dim_Dayy(Dayy) VALUES(28) 
INSERT INTO Dim_Dayy(Dayy) VALUES(29) 
INSERT INTO Dim_Dayy(Dayy) VALUES(30) 
INSERT INTO Dim_Dayy(Dayy) VALUES(31)

INSERT INTO Dim_Hourr(Hourr) VALUES('01:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('02:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('03:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('04:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('05:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('06:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('07:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('08:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('09:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('10:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('11:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('12:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('13:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('14:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('15:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('16:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('17:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('18:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('19:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('20:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('21:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('22:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('23:00')
INSERT INTO Dim_Hourr(Hourr) VALUES('24:00')