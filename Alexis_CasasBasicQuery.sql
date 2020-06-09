-- Query 1: Employee Contact sheet
SELECT FirstName, LastName, HomePhone
FROM employee
ORDER BY  FirstName;

-- Query 2: What suppliers do we have in each Country?
SELECT CompanyName, Country, City
FROM supplier
ORDER BY Country, City, CompanyName;

-- Query 3: Which employees have a birthday coming up in December?
SELECT FirstName, LastName, BirthDate
FROM employee
WHERE Month(BirthDate)= 12;

-- Query 4: How much profit do we make on each product?
SELECT ProductName, ListPrice, UnitCost, ListPrice-UnitCost AS Profit
FROM product;

-- Query 5: What is the Average lead time to ship an order?
SELECT  AVG(datediff(OrderDate,ShippedDate)) AS AvgLeadTime
FROM orders;
