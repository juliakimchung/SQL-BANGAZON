DELETE FROM Supervisor;
DELETE FROM Employee;
DELETE FROM Computer;
DELETE FROM TrainingProgram
DELETE FROM Department;

DELETE FROM OrderItems;
DELETE FROM Product;
DELETE FROM Orders;
DELETE FROM ProductType;
DELETE FROM Customer;



DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS ProductType; 
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS OrderItems;

CREATE TABLE `Department` (
	`DepartmentId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL,
	`Budget`	INTEGER NOT NULL
);

INSERT INTO Department VALUES(null, "Sales Department", 1000000.00)

CREATE TABLE `Supervisor` (
	`SupervisorId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL,
	`DepartmentId`	INTEGER NOT NULL,
	FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`)
);
INSERT INTO Supervisor VALUES (null, "Sammy Taylor", 1)

CREATE TABLE `Employee` (
	`EmployeeId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`DepartmentId` INTEGER NOT NULL,
	`TrainingId` INTEGER NOT NULL,
	FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`),
	FOREIGN KEY(`TrainingId`) REFERENCES `TrainingProgram`(`TrainingId`)

);

INSERT INTO Employee VALUES(null, "John", "Bright", 1 , 1)
INSERT INTO Employee VALUES(null, "Noa", "Tuple", 1, 2 )
INSERT INTO Employee VALUES(null, "Joanne", "Set", 1, 3 )
INSERT INTO Employee VALUES(null, "Py", "Dudley", 1, 1)
INSERT INTO Employee VALUES(null, "Bason", "Baylor", 1, 2 )
INSERT INTO Employee VALUES(null, "John", "Bright", 1 , 3)


CREATE TABLE `Computer` (
	`ComputerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDay` INTEGER NOT NULL,
	`DecomissionedDay` INTEGER NOT NULL,
	`EmployeeId`	INTEGER NOT NULL,
	FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);

INSERT INTO Computer VALUES(null, "1/3/07","1/3/18",1)
INSERT INTO Computer VALUES(null, "1/3/11","1/3/20", 2)
INSERT INTO Computer VALUES(null, "1/3/09", "1/5/18", 3 )
INSERT INTO Computer VALUES(null, "1/3/14", "1/5/18", 4)
INSERT INTO Computer VALUES(null, "1/3/08", "1/3/18", 5 )
INSERT INTO Computer VALUES(null, "1/3/12", "1/4/22", 6)








CREATE TABLE `TrainingProgram` (
	`TrainingId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`StartDay` INTEGER NOT NULL,
	`EndDay` INTEGER NOT NULL
	
);

INSERT INTO TrainingProgram VALUES(null, '1/3/17', '3/24/17')
INSERT INTO TrainingProgram VALUES(null, "4/01/17", "7/1/17")
INSERT INTO TrainingProgram VALUES(null, "8/1/17", "11/1/17")

CREATE TABLE `ProductType` (
	`ProductTypeId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL
);

INSERT INTO ProductType VALUES( null, "Laser");
INSERT INTO ProductType VALUES( null, "Inkjet");
INSERT INTO ProductType VALUES( null, "Fax");
INSERT INTO ProductType VALUES( null, "Printer");
INSERT INTO ProductType VALUES( null, "Copier");
INSERT INTO ProductType VALUES( null, "Data Storage");
INSERT INTO ProductType VALUES( null, "Thermal Transfer");
INSERT INTO ProductType VALUES( null, "Ink");
INSERT INTO ProductType VALUES( null, "Paper");
INSERT INTO ProductType VALUES( null, "Pen");



CREATE TABLE `Product` (
	`ProductId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`Description` TEXT NOT NULL,
	`Price` INTEGER NOT NULL,
	`ProductTypeId`	INTEGER NOT NULL,
	`CustomerId`	INTEGER ,
	FOREIGN KEY(`ProductTypeId`) REFERENCES `ProductType`(`ProductTypeId`),
	FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`)
);
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Laser", "increase your cartridges longevity and lower your overall cost", "350.00", 1, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Inkjet", "increase your cartridges longevity and lower your overall cost", "450.00", 2, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Fax", "increase your cartridges longevity and lower your overall cost", "50.00", 3, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Printer", "increase your cartridges longevity and lower your overall cost", "250.00", 4, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Copier", "increase your cartridges longevity and lower your overall cost", "550.00", 5, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super DataSotrage", "increase your cartridges longevity and lower your overall cost", "150.00", 6, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Thermal", "increase your cartridges longevity and lower your overall cost", "100.00", 7, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Ink", "increase your cartridges longevity and lower your overall cost", "250.00", 8, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Laser Friend", "increase your cartridges longevity and lower your overall cost", "1150.00", 9, null )
INSERT INTO Product (ProductId, Name, Description, Price, ProductTypeId, CustomerId) VALUES (null, "Super Inkjet Pet", "increase your cartridges longevity and lower your overall cost", "2450.00", 10, null )

CREATE TABLE `PaymentType` (
	`PaymentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL

);

INSERT INTO PaymentType VALUES (null,"Visa")
INSERT INTO PaymentType VALUES (null,"Master")
INSERT INTO PaymentType VALUES (null,"Paypal")
INSERT INTO PaymentType VALUES (null,"Discover")

CREATE TABLE `Customer` (
	`CustomerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`AcctStartDay` INTEGER NOT NULL,
	`Active`	BOOLEAN NOT NULL,
	`OrderId` INTEGER,
	FOREIGN KEY(`OrderId`) REFERENCES `Orders`(`OrderId`)

);

INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Julia", "Kim", '1/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Tess", "Taylor", '2/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Monica", "Moon", '3/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Suria", "Pankinson", '4/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Juliiette", "Miles", '5/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Zoro", "Zak", '6/11/16', 'True', null)
INSERT INTO Customer ( CustomerId, FirstName, LastName, AcctStartDay, Active, OrderId) VALUES ( null, "Grace", "Kinmberly", '11/11/16', 'False', null)


CREATE TABLE `Orders` (
	`OrderId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PaymentTypeId` INTEGER NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	FOREIGN KEY(`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`),
	FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`)
)

INSERT INTO  Orders VALUES(null, "2", "3")
INSERT INTO  Orders VALUES(null, "1", "2")
INSERT INTO  Orders VALUES(null, "3", "4")
INSERT INTO  Orders VALUES(null, "1", "5")
INSERT INTO  Orders VALUES(null, "1", "6")
INSERT INTO  Orders VALUES(null, "2", "7")
INSERT INTO  Orders VALUES(null, "2", "2")
INSERT INTO  Orders VALUES(null, "3", "2")
INSERT INTO  Orders VALUES(null, "1", "3")

CREATE TABLE `OrderItems` (
	`OrderItemId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Quantity` INTEGER NOT NULL,
	`PaymentTypeId` INTEGER NOT NULL,
	`CustomerId`	INTEGER NOT NULL,
	`ProductId` INTEGER NOT NULL,
	`OrderId` INTEGER NOT NULL,
	FOREIGN KEY(`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`),
	FOREIGN KEY(`ProductId`) REFERENCES `Product`(`ProductId`),
	FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`)
	FOREIGN KEY(`OrderId`) REFERENCES `Orders`(`OrderId`)
)

INSERT INTO OrderItems (OrderItemId, Quantity, PaymentTypeId, CustomerId, ProductId, OrderId)VALUES(null, 1,3, 2, 6, 8)
INSERT INTO OrderItems(OrderItemId, Quantity, PaymentTypeId, CustomerId, ProductId, OrderId)VALUES(null, 2,3,2,4, 8)
INSERT INTO OrderItems(OrderItemId, Quantity, PaymentTypeId, CustomerId, ProductId, OrderId)VALUES(null, 2,3,2,3,8)


SELECT o.CustomerId, c.CustomerId, c.OrderId, o.PaymentTypeId, o.ProductId
FROM Orders o, Customer c, Product p
WHERE o.CustomerId = c.CustomerId
GROUP BY o.CustomerId ORDER BY p.Name

UPDATE Customer
SET OrderId = 1
Where CustomerId = 3

UPDATE Customer
SET OrderId = 2
Where CustomerId = 2

UPDATE Customer
SET OrderId = 3
Where CustomerId = 4

UPDATE Customer
SET OrderId = 4
Where CustomerId = 5

UPDATE Customer
SET OrderId = 5
Where CustomerId = 6

UPDATE Customer
SET OrderId = 6
Where CustomerId = 7

UPDATE Customer
SET OrderId = 7
Where CustomerId = 2

UPDATE Customer
SET OrderId = 8
Where CustomerId = 2

UPDATE Customer
SET OrderId = 9
Where CustomerId = 3

SELECT CustomerId, ProductId
FROM ORDERS

UPDATE Product
SET CustomerId = 3
Where ProductId = 5

UPDATE Product
SET CustomerId = 2
Where ProductId = 2

UPDATE Product
SET CustomerId = 4
Where ProductId = 7

UPDATE Product
SET CustomerId = 5
Where ProductId = 3

UPDATE Product
SET CustomerId = 6
Where ProductId = 5

UPDATE Product
SET CustomerId = 7
Where ProductId = 4

UPDATE Product
SET CustomerId = 2
Where ProductId = 6

UPDATE Product
SET CustomerId = 3
Where ProductId = 1



