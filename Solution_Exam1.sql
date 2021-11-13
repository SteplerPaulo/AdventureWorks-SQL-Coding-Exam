/***Show the top selling product in terms order quantity of sales per product category for each month***/
SELECT 
  MONTH,
  YEAR,
  ProductName,
  Category,
  TotalOrderQty
FROM
  (SELECT 
    MONTH(salesorderdetail.ModifiedDate) MONTH,
    YEAR(salesorderdetail.ModifiedDate) YEAR,
    product.name ProductName,
    SUM(OrderQty) TotalOrderQty,
    productcategory.name Category,
    productsubcategory.name SubCategory 
  FROM
    salesorderdetail 
    LEFT JOIN product USING (ProductID) 
    LEFT JOIN productsubcategory USING (ProductSubcategoryID) 
    LEFT JOIN productcategory USING (ProductCategoryID) 
  GROUP BY YEAR,
    MONTH,
    ProductId 
  ORDER BY YEAR,
    MONTH,
    Category,
    TotalOrderQty DESC) t 
GROUP BY YEAR,
  MONTH,
  Category
  