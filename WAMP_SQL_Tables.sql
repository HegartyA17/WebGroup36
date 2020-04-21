DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` varchar(6) NOT NULL,
  `Title` varchar(4) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Forename` varchar(20) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `City` varchar(20) NOT NULL,
  `County` varchar(20) NOT NULL,
  `Postcode` varchar(8) NOT NULL,
  `TelNo` varchar(11) NOT NULL,
  `CustEmail` varchar(30) NOT NULL,
  `CustPassword` varchar(20) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `models`;
CREATE TABLE IF NOT EXISTS `models` (
  `ModelID` varchar(6) NOT NULL,
  `Description` varchar(20) NOT NULL,
  PRIMARY KEY (`ModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `CarID` varchar(6) NOT NULL,
  `ModelID` varchar(6) NOT NULL,
  `BodyStyle` varchar(20) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `CarTrim` varchar(30) NOT NULL,
  `Drive` varchar(30) NOT NULL,
  `FuelConsumption` varchar(20) NOT NULL,
  `CO2Emmission` varchar(20) NOT NULL,
  `Price` float NOT NULL,
  `NumInStock` int NOT NULL,
  PRIMARY KEY (`CarID`),
  KEY `ModelID` (`ModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` varchar(6) NOT NULL,
  `CustomerID` varchar(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `DeliveryDate` date NOT NULL,
  `Paid` varchar(3) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderID` varchar(6) NOT NULL,
  `CarID` varchar(6) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`, `CarID`),
  KEY `OrderID` (`OrderID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `ReviewID` varchar(6) NOT NULL,
  `CustomerID` varchar(6) NOT NULL,
  `CarID` varchar(6) NOT NULL,
  `Rating` float NOT NULL,
  `CustomerComment` varchar(200) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `cars`
  ADD CONSTRAINT `fModelID` FOREIGN KEY (`ModelID`) REFERENCES `models` (`ModelID`);
COMMIT;

ALTER TABLE `orders`
  ADD CONSTRAINT `fCustomerID1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fCarID1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `fOrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);
COMMIT;

ALTER TABLE `reviews`
  ADD CONSTRAINT `fCarID2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `fCustomerID2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;