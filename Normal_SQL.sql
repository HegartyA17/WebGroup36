DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
 CustomerID varchar(6) NOT NULL,
 Title varchar(4) NOT NULL,
 Surname varchar(20) NOT NULL,
 Forename varchar(20) NOT NULL,
 Street varchar(40) NOT NULL,
 City varchar(20) NOT NULL,
 County varchar(20) NOT NULL,
 Postcode varchar(8) NOT NULL,
 TelNo varchar(11) NOT NULL,
 CustEmail varchar(30) NOT NULL,
 CustPassword varchar(20) NOT NULL,
 PRIMARY KEY (CustomerID)
)

 DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
 EmployeeID varchar(6) NOT NULL,
 Title varchar(10) NOT NULL,
 Surname varchar(20) NOT NULL,
 Forename varchar(20) NOT NULL,
 Street varchar(20) NOT NULL,
 City varchar(20) NOT NULL,
 County varchar(20) NOT NULL,
 Postcode varchar(8) NOT NULL,
 TelNo varchar(11) NOT NULL,
 NationalInsuranceNumber varchar(20) NOT NULL,
 EmpPassword varchar(20) NOT NULL,
 PRIMARY KEY (EmployeeID)
) 

 DROP TABLE IF EXISTS models;
CREATE TABLE models (
 ModelID varchar(6) NOT NULL,
 Description varchar(20) NOT NULL,
 PRIMARY KEY (ModelID)
) 

 DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
 CarID varchar(6) NOT NULL,
 ModelID varchar(6) NOT NULL, --Foreign Key
 BodyStyle varchar(20) NOT NULL,
 Color varchar(20) NOT NULL,
 CarTrim varchar(30) NOT NULL,
 Drive varchar(30) NOT NULL,
 FuelConsumption varchar(20) NOT NULL,
 CO2Emmission varchar(20) NOT NULL,
 Price float NOT NULL,
 NumInStock int NOT NULL,
 PRIMARY KEY (CarID),
 CONSTRAINT fkModelID Foreign Key (ModelID) REFERENCES models (ModelID)
) 

 DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
 OrderID varchar(6) NOT NULL,
 OrderDate date NOT NULL,
 DeliveryDate date NOT NULL,
 Paid varchar(3) NOT NULL,
 PRIMARY KEY (OrderID)
) 

 DROP TABLE IF EXISTS orderdetails;
CREATE TABLE orderdetails (
 OrderID varchar(6) NOT NULL, --Foreign Key
 CarID varchar(6) NOT NULL, --Foreign Key
 Quantity int NOT NULL,
 PRIMARY KEY (OrderID, CarID), --Composite Key
 CONSTRAINT fkOrderID Foreign Key (OrderID) REFERENCES orders (OrderID),
 CONSTRAINT fkCarID1 Foreign Key (CarID) REFERENCES cars (CarID)
) 

 DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
 SalesID varchar(6) NOT NULL,
 CustomerID varchar(6) NOT NULL, --Foreign Key
 EmployeeID varchar(6) NOT NULL, --Foreign Key
 CarID varchar(6) NOT NULL, --Foreign Key
 SalesDate date NOT NULL,
 PRIMARY KEY (SalesID),
 CONSTRAINT fkCustomerID Foreign Key (CustomerID) REFERENCES customer (CustomerID),
 CONSTRAINT fkEmployeeID Foreign Key (EmployeeID) REFERENCES employee (EmployeeID),
 CONSTRAINT fkCarID2 Foreign Key (CarID) REFERENCES cars (CarID),
) 