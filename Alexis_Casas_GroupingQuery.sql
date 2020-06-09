-- Query 1: Show an alphabetical list of the current product offering
SELECT ProductName, QuantityPerUnit, CONCAT("$", ListPrice) AS UnitPrice
FROM product
ORDER BY  ProductName;

-- Query 2: As part of the daily routine, the production floor needs a list of orders 
-- that have not shipped yet?
SELECT OrderID, CustomerID, OrderDate, RequiredDate
from orders
WHERE ShippedDate is null 
order by OrderDate, RequiredDate;

-- Query 3: Scale issue: 
-- Recently there have been multiple detections of 500-gram products reporting in underweight. 
-- Due to the complex packaging system, it’s hard to tell where the misreading is coming from. 
-- Develop a query that will show the production floor managers a list of 500-gram products 
-- and any relevant data to help narrow down where the issue might be coming from
SELECT ProductName, QuantityPerUnit
FROM product
WHERE QuantityPerUnit like '%500 g%';

-- Query 4: How many customers does Northwinds have in each Country?
SELECT Country, COUNT(CustomerID) AS NumOfCusts
FROM customer
GROUP BY Country
ORDER BY NumOfCusts DESC;

-- Query 5: a request needs to know the average profit for each category but only if the average 
-- is greater then $10.00
SELECT CategoryID, ROUND(AVG(ListPrice-UnitCost), 2) AS AvgProfit
FROM product
GROUP BY CategoryID
HAVING AvgProfit > 10;