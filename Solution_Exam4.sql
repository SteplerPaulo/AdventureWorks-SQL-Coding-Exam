/***Show the list customers per territory who didn’t place an order in any given 30-day range*/
SELECT 
  * 
FROM
  customer 
WHERE CustomerId NOT IN 
  (SELECT 
    customer.`CustomerID` 
  FROM
    customer 
    LEFT JOIN `salesterritory` USING (TerritoryID) 
    RIGHT 
    OUTER JOIN `salesorderheader` USING (CustomerID) 
  WHERE salesorderheader.`ModifiedDate` BETWEEN CAST('2001-07-08' AS DATE) 
    AND CAST('2001-08-08' AS DATE)) 
ORDER BY CustomerID 



/**with orders between given 30-days range*/
/*
SELECT 
  salesterritory.`Name` TerritoryName,
  customer.`CustomerID`,
  customer.`AccountNumber`,
  salesorderheader.`ModifiedDate` 
FROM
  customer 
  LEFT JOIN `salesterritory` USING (TerritoryID) 
  RIGHT 
  OUTER JOIN `salesorderheader` USING (CustomerID) 
WHERE salesorderheader.`ModifiedDate` BETWEEN CAST('2001-07-08' AS DATE) 
  AND CAST('2001-08-08' AS DATE) 
ORDER BY CustomerID 
*/
