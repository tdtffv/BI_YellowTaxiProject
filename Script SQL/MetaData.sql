CREATE DATABASE BI_METADATA
GO

USE BI_METADATA
GO

CREATE TABLE Data_Flow(
	ID int identity(1,1) PRIMARY KEY,
	Tenbang varchar(50),
	NgayCapNhat datetime
)

CREATE TABLE DDS(
	ID int identity(1,1) PRIMARY KEY,
	Tenbang varchar(50),
	NgayCapNhat datetime
)

CREATE TABLE DDS_MOLAP(
	ID int identity(1,1) PRIMARY KEY,
	Tenbang varchar(50),
	NgayCapNhat datetime
)

SET IDENTITY_INSERT [dbo].[Data_Flow] ON
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Tenbang], [NgayCapNhat])
VALUES 
  (1, 'YELLOWTAXI', '20201212 22:11:11.823')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Tenbang], [NgayCapNhat])
VALUES 
  (2, 'CENSUSBLOCK', '20201212 22:12:11.853')
GO

--DAY LA PHAN DE UPDATE LAI DU LIEU DE NAP ETL
USE BI_METADATA
GO

UPDATE [dbo].[Data_Flow]
SET [NgayCapNhat] = '20201212 22:11:11.823'
WHERE [Tenbang] = 'YELLOWTAXI'
GO

UPDATE [dbo].[Data_Flow]
SET [NgayCapNhat] = '20201212 22:11:11.823'
WHERE [Tenbang] = 'CENSUSBLOCK'
GO
