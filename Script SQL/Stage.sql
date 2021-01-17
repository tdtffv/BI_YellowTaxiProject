
CREATE DATABASE BI_STAGE
GO

USE BI_STAGE
GO

CREATE TABLE YELLOWTAXI(
	VendorID VARCHAR(50),
	PUDatetime DATETIME,
	DODatetime DATETIME,
	PassCount INT,
	TripDistance FLOAT,
	PULongtitude FLOAT,
	PULattitude FLOAT,
	RateCode VARCHAR(50),
	StoreAndFwd VARCHAR(10),
	DOLongtitude FLOAT,
	DOLattitude FLOAT,
	PaymentType VARCHAR(10),
	FareAmount FLOAT,
	Extra FLOAT,
	MtaTax FLOAT,
	TipAmount FLOAT,
	TollsAmount FLOAT,
	TotalAmount FLOAT,
	NumberPU VARCHAR(100),
	StreetPU VARCHAR(100),
	CityPU VARCHAR(100),
	StatePU VARCHAR(100),
	PUCensusTractCode VARCHAR(100),
	PUCensusBlockCode VARCHAR(100),
	PUCensusBlockGroup VARCHAR(100),
	NumberDO VARCHAR(100),
	StreetDO VARCHAR(100),
	CityDO VARCHAR(100),
	StateDO VARCHAR(100),
	DOCensusTractCode VARCHAR(100),
	DOCensusBlockCode VARCHAR(100),
	DOCensusBlockGroup VARCHAR(100),
	BoroughPU VARCHAR(100),
	BoroughDO VARCHAR(100),
	TrangThai INT,
	NgayCapNhat DATETIME,
	NgayTao DATETIME
)

CREATE TABLE CENSUSBLOCK(
	CTLabel VARCHAR(100),
	BoroName VARCHAR(100),
	BoroCode VARCHAR(100),
	CT2010 VARCHAR(100),
	BoroCT2010 VARCHAR(100),
	CDELigibil NVARCHAR(100),
	NTACode VARCHAR(100),
	NTAName VARCHAR(100),
	PUMA VARCHAR(100),
	TrangThai INT,
	NgayCapNhat DATETIME,
	NgayTao DATETIME
)

UPDATE YELLOWTAXI
SET VendorID = CASE
		WHEN VendorID = 'CMT' THEN '1'
		WHEN VendorID = 'VTS' THEN '2'
		WHEN VendorID = 'DDS' THEN '3'
		ELSE VendorID
	END
WHERE VendorID IN ('CMT','VTS','DDS')

UPDATE YELLOWTAXI
SET PaymentType = CASE
		WHEN PaymentType = 'CRD' THEN '1'
		WHEN PaymentType = 'CSH' THEN '2'
		WHEN PaymentType = 'NOC' THEN '3'
		WHEN PaymentType = 'DIS' THEN '4'
		WHEN PaymentType = 'UNK' THEN '5'
		WHEN PaymentType = 'V' THEN '6'
		ELSE PaymentType
	END
WHERE PaymentType IN ('CRD','CSH','NOC','DIS','UNK','V')

UPDATE YELLOWTAXI
SET BoroughPU = CASE
		WHEN BoroughPU = '0' THEN 'Manhattan'
		WHEN BoroughPU = '1' THEN 'Manhattan'
		WHEN BoroughPU = 'FALSE' THEN 'Manhattan'
		WHEN BoroughPU = '6' THEN 'Manhattan'
		WHEN BoroughPU = '7' THEN 'Manhattan'
		WHEN BoroughPU = '8' THEN 'Manhattan'
		WHEN BoroughPU = '9' THEN 'Manhattan'
		WHEN BoroughPU = '2' THEN 'Bronx'
		WHEN BoroughPU = '3' THEN 'Brooklyn'
		WHEN BoroughPU = '4' THEN 'Queens'
		WHEN BoroughPU = '5' THEN 'Staten Island'
		ELSE BoroughPU
	END
WHERE BoroughPU IN ('0', '1', '2', '3', '4', '5','FALSE', '6', '7', '8', '9')

UPDATE YELLOWTAXI
SET BoroughDO = CASE
		WHEN BoroughDO = 'FALSE' THEN 'Manhattan'
		WHEN BoroughDO = '6' THEN 'Manhattan'
		WHEN BoroughDO = '7' THEN 'Manhattan'
		WHEN BoroughDO = '8' THEN 'Manhattan'
		WHEN BoroughDO = '9' THEN 'Manhattan'
		ELSE BoroughDO
	END
WHERE BoroughDO IN ('FALSE', '6', '7', '8', '9')