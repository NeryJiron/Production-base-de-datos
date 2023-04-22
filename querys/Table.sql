/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [TransactionID]
      ,[ProductID]
      ,[ReferenceOrderID]
      ,[ReferenceOrderLineID]
      ,[TransactionDate]
      ,[TransactionType]
      ,[Quantity]
      ,[ActualCost]
  FROM [Stage].[dbo].[Dim_TransactionHistory]



