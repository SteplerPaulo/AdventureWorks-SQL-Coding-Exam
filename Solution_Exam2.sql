/*#####Show the top performing person per territory per month in terms of total sales (unit price * quantity)*/
SELECT * FROM (
SELECT 
    MONTH(salesorderdetail.ModifiedDate) MONTH,
    YEAR(salesorderdetail.ModifiedDate) YEAR,
    `salesterritory`.`Name` TerritoryName,
    `salesperson`.`SalesPersonID`,
    SUM(salesorderdetail.`OrderQty`) TotalQty,
    UnitPrice,
    SUM(salesorderdetail.`OrderQty`) * UnitPrice TotalSales 
  FROM
    `adventureworks`.`salesorderdetail` 
    LEFT JOIN salesorderheader USING (SalesOrderID) 
    LEFT JOIN salesterritory USING (TerritoryID) 
    LEFT JOIN salesperson USING (SalesPersonID) 
  GROUP BY YEAR,
    MONTH,
    salesperson.SalesPersonID 
  ORDER BY YEAR,
    MONTH,
    TotalSales DESC) t
    GROUP BY YEAR, MONTH, TerritoryName
    