DELETE FROM Computer;
DELETE FROM TrainingProgram;
DELETE FROM Supervisor;
DELETE FROM Employee;
DELETE FROM Department;
DELETE FROM ProductType;
DELETE FROM Product;
DELETE FROM PaymentType;
DELETE FROM Customer;
DELETE FROM Orders;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS ProductType;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Training;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Supervisor;

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

INSERT INTO Computer VALUES(null, "1/3/07", "1/3/18", 1)
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
	FOREIGN KEY(`OrderId`) REFERENCES `Order`(`OrderId`)

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
	`ProductId` INTEGER NOT NULL,
	FOREIGN KEY(`PaymentTypeId`) REFERENCES `PaymentType`(`PaymentTypeId`),
	FOREIGN KEY(`ProductId`) REFERENCES `Product`(`ProductId`),
	FOREIGN KEY(`CustomerId`) REFERENCES `Customer`(`CustomerId`)
)

INSERT INTO  Orders VALUES(null, "2", "3", "5")



