/***Rank each territory according to total sales (unit price * quantity) for a given month***/
SELECT 
  MONTH(salesorderdetail.ModifiedDate) MONTH,
  YEAR(salesorderdetail.ModifiedDate) YEAR,
  `salesterritory`.`Name` TerritoryName,
  SUM(OrderQTy) TotalQty,
  UnitPrice,
  SUM(OrderQTy) * UnitPrice TotalSale 
FROM
  `adventureworks`.`salesorderdetail` 
  LEFT JOIN salesorderheader USING (SalesOrderID) 
  LEFT JOIN salesterritory USING (TerritoryID) 
  LEFT JOIN salesperson USING (SalesPersonID) 
GROUP BY YEAR,
  MONTH,
  TerritoryName 
ORDER BY YEAR,
  MONTH,
  TotalSale DESC 