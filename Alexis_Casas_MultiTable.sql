-- Query 1: Number of orders for each customer?
SELECT customer.CompanyName, Count(orders.OrderID) AS NumOrders
FROM orders INNER JOIN customer USING (CustomerID)
Group By CompanyName
Order By NumOrders DESC;

-- Query 2: What were the total sales for each product?
SELECT product.ProductName, sum(orderDetail.Quantity* orderDetail.SalePrice) AS TotalSales
FROM product INNER JOIN orderDetail USING (ProductID)
GROUP BY ProductName
ORDER BY TotalSales DESC;

-- Query 3: What are the total sales for each category?
SELECT category.CategoryName, sum(orderDetail.Quantity* orderDetail.SalePrice) AS TotalSales
FROM product INNER JOIN orderDetail USING (ProductID)
	Inner Join category USING(CategoryID)
GROUP BY CategoryName
ORDER BY TotalSales DESC;

-- Query 4: Which Sales Rep had the highest amount of sales based on the orders they
-- are associated with.
SELECT employee.FirstName, employee.LastName, count(OrderDetail.Quantity) AS NumOrders, 
sum(orderDetail.Quantity* orderDetail.SalePrice) AS TotalSales
FROM employee INNER JOIN orders USING(EmployeeID)
	INNER JOIN orderDetail USING (OrderID)
GROUP BY EmployeeID
ORDER BY NumOrders DESC;

-- Query 5: How are product sales impacting revenue? Compare the list price to the 
-- average sale price.
SELECT product.ProductName, product.ListPrice AS UnitPrice, 
ROUND(AVG(orderDetail.SalePrice),2) AS AvgSalePrice, ROUND(AVG(orderDetail.SalePrice)-product.ListPrice,2)  AS DiffinPrice
FROM product INNER JOIN orderDetail USING(ProductID)
GROUP BY ProductID
ORDER BY ProductName;