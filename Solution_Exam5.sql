/**
***Show the total sales per territory 7 day from any given date. 
***Do not use a date range. Get the past 7 days from a given date 
**/
SELECT 
  salesterritory.name TerritoryName,
 
  salesorderheader.ModifiedDate
FROM
  salesorderheader 
  LEFT JOIN `salesterritory` USING (TerritoryID) 
WHERE DATE(salesorderheader.ModifiedDate) >= DATE("2001-07-14 00:00:00") 
  AND DATE(salesorderheader.ModifiedDate) < DATE("2001-07-14 00:00:00") + INTERVAL 7 DAY 
 
ORDER BY salesorderheader.ModifiedDate 