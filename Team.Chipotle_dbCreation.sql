/*Team.Chipotle,Team members: Lingxiao Lyu, Huateng Zhang, Zirui Jiao*/

CREATE Chipotle2nd;
GO
USE Chipotle2nd
GO

CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  StoreID bigint NOT NULL,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Title varchar (50) NOT NULL,
  Age bigint NOT NULL,
  Gender varchar (50) NOT NULL,
  Address varchar (50) NOT NULL,
  Email varchar (50) NOT NULL,
  PhoneNumber bigint NOT NULL,
  StartDate Date NOT NULL);


  CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  TerritoryID bigint NOT NULL,
  StoreType varchar (50) NOT NULL,
  AddressLine1 varchar (50) NOT NULL,
  ZipCode bigint NOT NULL);

  CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Address varchar (50) NOT NULL,
  Email varchar (50) NOT NULL,
  PhoneNumber bigint NOT NULL,
  ModifiedDate Date NOT NULL);

  CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  SupplierID bigint NOT NULL,
  ProductName varchar(50) NOT NULL,
  UnitPrice float NOT NULL,
  Portion varchar(50) NOT NULL);

  CREATE TABLE Territory(
  TerritoryID bigint NOT NULL PRIMARY KEY,
  City varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  Country varchar (50) NOT NULL);

CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  SupplierName varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  TerritoryID bigint NOT NULL);

CREATE TABLE Ingredient(
  IngredientID bigint NOT NULL PRIMARY KEY,
  SupplierID bigint NOT NULL,
  IngredientName varchar(50) NOT NULL,
  UnitCostPerQuantity float NOT NULL);

CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  StoreID bigint NOT NULL,
  OrderDate date NOT NULL,
  Quantity bigint NOT NULL,
  TotalDue float NOT NULL);

CREATE TABLE OrderLine(
   OrderLineID bigint NOT NULL PRIMARY KEY,
   OrderID bigint NOT NULL,
   ProductID bigint NOT NULL,
   OrderQuantity bigint NOT NULL,
   LineTotal float NOT NULL);



ALTER TABLE Ingredient ADD CONSTRAINT FK_Ingredient_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
GO

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE Orders ADD CONSTRAINT FK_Order_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);


ALTER TABLE Supplier ADD CONSTRAINT FK_Supplier_Territory
FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID);
GO

ALTER TABLE OrderLine ADD CONSTRAINT FK_OrderLine_Order 
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
GO

ALTER TABLE OrderLine ADD CONSTRAINT FK_OrderLine_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO


ALTER TABLE Store ADD CONSTRAINT FK_Store_Territory
FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID);
GO


ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

ALTER TABLE Product ADD CONSTRAINT FK_Product_Supplier
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
GO


INSERT INTO Customer(CustomerID, FirstName, LastName, Address, Email, PhoneNumber, ModifiedDate) VALUES 
(1, 'Jason', 'Lee', '231 Forest St', 'Jlee@babson.edu', '7075911097', '10-18-2017'),
(2, 'Evan', 'Lehrman', '23 Washington St', 'evanl@gmail.com', '5084443294','11-29-2016'),
(3, 'Yating', 'Lu', '1 Junper Rd', 'yatinglu@163.com', '5172357030', '6-15-2017'),
(4, 'Erica', 'Fishberg', '47 Moody St', 'efishberg2@babson.edu', '1234567891', '8-30-2017'),
(5, 'Jamie', 'Traverso', '2 Colby Rd', 'Traverso1997@gmail.com', '1236784567', '7-21-2017'),
(6, 'Kyle', 'Waldron', '2381 Commonwealth Ave','Kyle122@yahoo.com', '4567892345', '3-25-2017'),
(7, 'Nadira', 'Zahiruddin', '12 Butterfield Rd', 'Nadira@gmail.com', '7892345671', '2-28-2017'),
(8, 'Nad', 'Zahi', '12 Tree Rd', 'Nad@gmail.com', '8892345672', '3-28-2017'),
(9, 'Nadlia', 'Zahiruddia', '12 House Rd', 'Nadlia@gmail.com', '9892345673', '4-28-2017'),
(10, 'Nadee', 'Zahiruee', '12 Dream Rd', 'Nadee@gmail.com', '2892345674', '5-28-2017');


INSERT INTO Territory(TerritoryID, City, State, Country) VALUES 
(1, 'Wellesley', 'MA', 'US'),
(2, 'Newton','MA','US'),
(3, 'Malden','MA','US'),
(4,'Waltham','MA','US'),
(5,'Wellesley','MA','US'),
(6,' Auburndale','MA','US'),
(7,'Lexington','MA','US'),
(8,' Shelburne','MA','US'),
(9,'Springfiled','MA','US'),
(10,'Cape Cod','MA','US');

INSERT INTO Supplier(SupplierID, SupplierName, Address, TerritoryID) VALUES
(1, 'Walmart', '123 Washington st, Wellesley', 1),
(2, 'Trader Joes', ' 958 Highland Ave, Needham', 2),
(3, 'Veggie Farm', '1121 Washington St, West Newton',3),
(4, 'Natural Valley', '659 Worcester Rd, Framingham', 4),
(5, 'Farm Farm', '1317 Beacon St, Brookline', 5),
(6, 'Perfect Farm', '211 Alewife Brook Pkwy, Cambridge', 6),
(7, 'Happy Animal', '1427 Massachusetts Ave, Arlington', 7),
(8, 'Happy Lamb', '1101 Beacon St, Newton', 8),
(9, 'Happy Tree', '399 Washington St, Newton', 9),
(10, 'Unhappy Animal', '15 Main St, Waltham', 10);

Insert Into Store(StoreID, TerritoryID, StoreType, AddressLine1, ZipCode) Values
(1, 2, 'dine-in', '899 Boylston St, Boston, MA', '02115'),
(2, 1, 'drive-through', '51 Middlesex Turnpike, Burlington, MA', '01803'),
(3, 6, 'drive-through', '350 Patriot Pl, Foxborough, MA', '02035'),
(4, 7, 'dine-in', '145 Great Rd, Acton, MA', '01720'),
(5, 3, 'drive-through', '145 Great Rd, Acton, MA', '01720'),
(6, 4, 'dine-in', '200 Boylston St, Chestnut Hill, MA', '02467'),
(7, 5, 'drive-through', '169 University Ave, Westwood, MA', '02090'),
(8, 10, 'dine-in', '300 Needham St, Newton, MA', '02459'),
(9, 9, 'dine-in', '1924 Beacon St, Brighton', 'MA 02135'),
(10, 8, 'dine-in', '148 Brookline Ave, Boston', 'MA 02215');

Insert into Product (ProductID, SupplierID, ProductName, UnitPrice, Portion) Values
(1, 3, 'Burrito', 12, 'Big'),
(2, 4, 'Burrito Bowl', 11, 'Medium'),
(3, 7, 'Soft Flour Taco', 10, 'Small'),
(4, 2, 'Salad', 9, 'Small'),
(5, 1, 'Kid Menu', 8, 'Big'),
(6, 5, 'Crispy Corn Taco', 11, 'Big'),
(7, 9, 'Burrito2', 12, 'Medium'),
(8, 8, 'Burrito3', 5, 'Big'),
(9, 10, 'SadSalad', 9, 'Medium'),
(10, 6, 'AmazingGua', 6, 'Small');


Insert into Orders (OrderID, CustomerID, StoreID, OrderDate, Quantity, TotalDue) VALUES
(1, 3, 4, '7-1-2017', 3, 20),
(2, 3, 6, '12-31-2017', 7, 302),
(3, 5, 2, '10-21-2017', 8, 222),
(4, 4, 3, '9-28-2017', 2, 25),
(5, 1, 7, '8-31-2017', 3, 54),
(6, 2, 4, '4-22-2017', 5, 29),
(7, 7, 1, '3-22-2017', 7, 340),
(8, 2, 4, '4-22-2017', 5, 30),
(9, 2, 4, '4-22-2017', 5, 50),
(10, 2, 4, '4-22-2017', 6, 60);

Insert into Ingredient (IngredientID, SupplierID, IngredientName, UnitCostPerQuantity) VALUES
(1, 2, 'Salts', 1.5),
(2, 2, 'Sugar', 2),
(3, 2, 'Oil', 5),
(4, 3, 'Vegetables', 4),
(5, 4, 'Meat', 5),
(6, 2, 'Flour', 4),
(7, 5, 'Package', 1000),
(8, 7, 'Flour-2', 5),
(9, 9, 'Flour-3', 6),
(10, 10, 'Flour-4', 7);


Insert into OrderLine (OrderLineID, OrderID, ProductID, OrderQuantity, LineTotal) VALUES
(1, 2, 3, 4, 22.5),
(2, 2, 4, 7, 38),
(3, 4, 5, 10, 79),
(4, 1, 6, 12, 90),
(5, 6, 7, 39, 120),
(6, 5, 1, 5, 121),
(7, 7, 2, 9, 33),
(8, 2, 8, 5, 50),
(9, 4, 9, 9, 30),
(10, 6, 10, 10, 40);


Insert into Employee (EmployeeID, StoreID, FirstName, LastName, Title, Age, Gender, Address, Email, PhoneNumber, StartDate) VALUES
(1, 2, 'Zirui', 'Jiao', 'StoreManager', 20, 'Female', '6 Juniper Rd', 'jiaozirui1997@gmail.com', 5083334834, '7-30-2016'),
(2, 1, 'Lingling', 'Li', 'Cashier', 19, 'Male', '11 Forest St', 'lling11@gmail.com',7783265290, '8-29-2017'),
(3, 4, 'John', 'Huang', 'Cashier', 22, 'Female', '16 Wellesley Dr', 'JohnH@gmail.com', 6674809765, '5-22-2014'),
(4, 6, 'Jeffery', 'Patrick', 'StoreManager', 33, 'Male', '325 Long St', 'JefferyP@gmail.com', 5563490340, '3-24-2013'),
(5, 3, 'Tim', 'Zhi', 'Cashier', 35, 'Male','455 Legacy Dr', 'TimZhi@gmail.com', 4352873564, '2-28-2012'),
(6, 4, 'Sarah','Johnson', 'StoreManager', 18, 'Female', '321 Wells St, 233 Triumph St', 'SarahJ@gmail.com', 3223458675, '12-21-2008'),
(7, 5, 'Grace',' Brown', 'Cashier', 22, 'Female', '328 Galaxy St, 545 Union Dr', 'GraceB@gmail.com', 6553489320, '11-25-2010'),
(8, 5, 'Grace',' MacCartney', 'Cashier', 44, 'Female', '43 Green St, 11 Prospect Dr', 'GraceM@gmail.com', 7553489320, '1-25-2007'),
(9, 5, 'Han',' Li', 'Cashier', 20, 'Male', '20 Awesome St, 233 Legal St', 'HanL@gmail.com', 2383489320, '5-23-2010'),
(10, 5, 'Alice','Freeman', 'Cashier', 18, 'Female', '38 Girl St, 122 Dream Ave', 'AliceF@gmail.com', 9013489320, '6-11-2014');

