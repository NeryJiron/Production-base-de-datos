Select W.WorkOrderID,
       P.ProductID,
	   wo.WorkOrderID,
	   ps.ProductSubcategoryID,
	 
	   l.LocationID

	   --72591

	   --Select * 
from Production.WorkOrder W left join Production.Product P on  W.ProductID=P.ProductID
join Production.WorkOrderRouting wo on w.WorkOrderID = wo.WorkOrderID
and wo.ProductID= p.ProductID
join Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
join Production.Location l on wo.LocationID=l.LocationID



	

       