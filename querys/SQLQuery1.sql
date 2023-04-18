Select s.ProductSubcategoryID,
	   c.ProductCategoryID,
	   c.Name Category,
	   C.ModifiedDate,
	   s.Name Subcategory

into Dim_Category
from AdventureWorks2019.Production.ProductCategory C inner join AdventureWorks2019.Production.ProductSubcategory S
on s.ProductCategoryID=c.ProductCategoryID

Select * from Dim_Category

USE [AdventureWorks2019]
GO

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[Color]
      ,[Size]
      ,[Weight]
      ,[DaysToManufacture]
      ,[Class]
      ,[Style]
   into Dim_Product
  FROM AdventureWorks2019.Production.Product
  select * from Dim_Product

  USE [AdventureWorks2019]
GO

SELECT [LocationID]
      ,[Name]
      ,[CostRate]
      ,[Availability]

  into Dim_Location
  FROM AdventureWorks2019.Production.Location
  select * from Dim_Location
  use AdventureWorks2019

GO

USE [AdventureWorks2019]
GO

SELECT [ProductID]
      ,[StandardCost]
      
  into Dim_ProductCostHistory
  from AdventureWorks2019.Production.ProductCostHistory
  select * from Dim_ProductCostHistory
  use AdventureWorks2019




USE [AdventureWorks2019]
GO

SELECT [ProductReviewID]
      ,[ProductID]
      ,[Rating]
      ,[Comments]
	  into Dim_ProductReview
  FROM AdventureWorks2019.Production.ProductReview
  select * from Dim_ProductReview
  use AdventureWorks2019

GO

USE [AdventureWorks2019]
GO

SELECT [TransactionID]
      ,[ProductID]
      ,[ReferenceOrderID]
      ,[ReferenceOrderLineID]
      ,[TransactionDate]
      ,[TransactionType]
      ,[Quantity]
      ,[ActualCost]
	  into Dim_TransactionHistory
  FROM AdventureWorks2019.Production.TransactionHistory
  select * from Dim_TransactionHistory
  use AdventureWorks2019

GO

CREATE TABLE Fact_Table(
[WorkOrderID] int 
 ,[ProductID] int 
 ,[LocationID] int
 ,[PlannedCost] float
 ,[ActualCost] float
 ,[OrdertQty] int
 ,[StartDate] datetime
 ,[EndDate] datetime
 ,[ListPrice] float
 ,[StandardCost] float
 );

USE AdventureWorks2019; 

INSERT INTO Fact_Table(WorkOrderID, ProductID, locationID, OrdertQty, StartDate, EndDate, LocationID, PlannedCost, ActualCost, ListPrice, StandardCost)
SELECT 
    Dim_TransactionHistory.WorkOrderID,
    Dim_Product.ProductID,
    Dim_TransactionHistory.OrderQty,
    Dim_TransactionHistory.StartDate,
    Dim_TransactionHistory.EndDate,
    Dim_Location.LocationID,
    Dim_Product.PlannedCost,
    Dim_Product.ActualCost,
    Dim_Product.ListPrice,
    Dim_Product.StandardCost
FROM 
    Dim_Location
JOIN 
    Dim_Product ON Dim_Location.LocationID = Dim_Product.LocationID
JOIN 
    Dim_Category ON Dim_Product.CategoryID = Dim_Category.CategoryID
JOIN 
    Dim_TransactionHistory ON Dim_TransactionHistory.LocationID = Dim_Location.LocationID
    AND Dim_TransactionHistory.ProductID = Dim_Product.ProductID
JOIN 
    Dim_ProductReview ON Dim_ProductReview.ProductID = Dim_Product.ProductID
JOIN 
    Dim_ProductCostHistory ON Dim_ProductCostHistory.ProductID = Dim_Product.ProductID;




















