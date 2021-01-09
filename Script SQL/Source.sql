CREATE DATABASE BI_YellowTaxi
GO

USE BI_YellowTaxi
GO

--Them cot cho YellowTaxi
ALTER TABLE YellowTaxi
   ADD [NgayTao] datetime NULL,
       [NgayCapNhat] datetime NULL,
       [TrangThai] int NULL;

GO
UPDATE YellowTaxi
SET [TrangThai] = 1;

GO
UPDATE YellowTaxi
SET [NgayTao] = '20201213 22:12:11.853',
	[NgayCapNhat] = '20201213 22:12:11.853';

--Them cot cho CensusBlock
ALTER TABLE CensusBlock
   ADD [NgayTao] datetime NULL,
       [NgayCapNhat] datetime NULL,
       [TrangThai] int NULL;

GO
UPDATE CensusBlock
SET [TrangThai] = 1;

GO
UPDATE CensusBlock
SET [NgayTao] = '20201213 22:12:11.853',
	[NgayCapNhat] = '20201213 22:12:11.853';