USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_Revenue]    Script Date: 23/11/2018 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rajas Khokle
-- Create date: 2018 10 28
-- Description:	WRK-DRV
-- =============================================

ALTER PROC [dbo].[BLD_DRV_Revenue]
AS
BEGIN
if OBJECT_ID('DRV_Revenue') IS NOT NULL
DROP TABLE [DRV_Revenue]

SELECT 
	 A.[Customer ID]
	,A.[Gender]
	,B.[Unit Price]*B.[Units] As Revenue
INTO [DRV_Revenue]
FROM [dbo].[Wrk_Customer_List] A
Left Join [dbo].[Wrk_Transaction_List] B
on A.[Customer ID]=B.[Customer ID]

END
