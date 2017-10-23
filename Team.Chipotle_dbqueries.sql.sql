/*Team.Chipotle, team members: Lingxiao Lyu, Huateng Zhang, Zirui Jiao*/

USE Chipotle2nd;
GO

/*Query 1:*/
/*Select all records/relevant information from customers*/
SELECT * FROM Customer;

/*Select all records/relevant information from employees*/
SELECT * FROM Employee;

/*Select all records from stores*/
SELECT * FROM Store;

/*Select all sales records*/
SELECT * FROM Orders;

/*Select all product records*/
SELECT * FROM Product;

/*Select all records from suppliers*/
SELECT * FROM Supplier;

/*Select all records from territory*/
SELECT * FROM Territory;

/*Select all ingredients records*/
SELECT * FROM Ingredient;

/*Select all records from each order line*/
SELECT * FROM OrderLine;

/*Query 2: Find Daily Maximum sales*/
SELECT MAX(TotalDue) AS Max_Sales, OrderDate
FROM Orders
GROUP BY OrderDate

/*Query 3: Find the total sales of each store*/
SELECT SUM(Orders.TotalDue) AS Total_Sales, Store.StoreID
FROM Orders
JOIN Store 
ON Orders.StoreID = Store.StoreID
GROUP BY Store.StoreID
ORDER BY SUM(Orders.TotalDue) DESC

/*Query 4:Show quantity sold for each product, including product never sold*/
UPDATE OrderLine 
SET ProductID = 5
WHERE OrderLineID = 1
SELECT Product.ProductID, Product.ProductName, SUM(OrderLine.OrderQuantity) AS Total_Quantity_Sold
FROM OrderLine
RIGHT OUTER JOIN Product
ON Product.ProductID = OrderLine.ProductID
GROUP BY Product.ProductID, Product.ProductName
Order BY SUM(OrderLine.OrderQuantity) DESC
/*This query is to obtain the quantity sold for each product and there might be products that are never sold.
In order to include the product that have no sale which has "NULL" in Total_quantity_sold column, outer join is 
needed to show "NULL" in the output*/

/*Query 5:Report the Product IDs and Names of those products where the quantity sold is greater than the average of total quantity sold*/
SELECT Product.ProductID, Product.ProductName, SUM(OrderLine.OrderQuantity) AS Total_quantity_Sold
FROM Product
FULL OUTER JOIN OrderLine
ON Product. ProductID = OrderLine.ProductID
GROUP BY Product.ProductID, Product.ProductName
Having SUM(OrderLine.OrderQuantity) >
    (
	SELECT AVG(OrderLine.OrderQuantity)
	FROM OrderLine
	)
ORDER BY SUM(OrderLine.OrderQuantity) DESC

