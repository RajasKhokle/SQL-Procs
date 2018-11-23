USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[__TMP__WRK_TableName]    Script Date: 23/11/2018 3:07:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[__TMP__WRK_TableName]
-- =============================================
-- Author		:	
-- Create date	: 
-- Description	:	RAW-WRK
-- Modify date	:
-- =============================================
AS
BEGIN
-- This is comment
-- 

-- ===================================================
-- Drop table if exist
-- ===================================================
if OBJECT_ID('WRK_TableName') IS NOT NULL
DROP TABLE [WRK_TableName]

-- ===================================================
-- CREATE New TABLE
-- ===================================================
CREATE TABLE [WRK_TableName]
(
[RowNumber]		INT identity(1,1)
,[Order ID]		VARCHAR(100)
,[Order Date]	DATE
,[Region]		VARCHAR(100)
,[Rep]			VARCHAR(50)
,[Item]  		VARCHAR(50)
,[Units]		INT
,[Unit Price]   FLOAT
)


-- ====================================================
-- TRUNCATE TABLE JUST TO BE SAFE
-- ====================================================
TRUNCATE TABLE [WRK_TableName]

-- ====================================================
-- INSERT ROWS IN THE TABLE
-- ====================================================
INSERT INTO [WRK_TableName]
(
[Order ID]
,[Order Date]		
,[Region]		
,[Rep]			
,[Item]  		
,[Units]			
,[Unit Price]       
)
SELECT 
[Order ID]
,CONVERT(DATE,[Order Date],20)		
,[Region]		
,[Rep]			
,[Item]  		
,[Units]			
,CAST([Unit Price] AS float)    
FROM [YYYYMMDD_Raw_TableName]


END

-- XX Rows Affected
--SELECT * FROM [dbo].[WRK_TableName]
--Select * FROM [dbo].[YYYYMMDD_Raw_TableName]
