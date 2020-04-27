 DROP TABLE IF EXISTS `reviews`;
 DROP TABLE IF EXISTS `orderdetails`;
 DROP TABLE IF EXISTS `orders`;
 DROP TABLE IF EXISTS `cars`;
 DROP TABLE IF EXISTS `models`;
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

INSERT INTO `customer` (`CustomerID`, `Title`, `Surname`, `Forename`, `Street`, `City`, `County`, `Postcode`, `TelNo`, `CustEmail`, `CustPassword`) VALUES
('C00001', 'Mr', 'Quinn ', 'John', '93 Edergole Road', 'Omagh', 'Tyrone', 'BT19 1GT', '02882840459', 'j.quinn12@hotmail.com', 'Bailey.333'),
('C00002', 'Mr', 'Mullan', 'Conor', '34 Mill Lane ', 'Ennskillen', 'Fermanagh', 'BT78 2AB', '02890180340', 'mullan_c33@gmail.com', 'Mullan78'),
('C00003', 'Miss', 'Mc Cusker', 'Anna', '38 Crescent Way', 'Omagh', 'Tyrone', 'BT18 3UY', '02890180691', 'annamccusker133@hotmail.com', 'Snowy.33'),
('C00004', 'Mr', 'Mc Carney', 'Eugene ', '87 Kingsway ', 'Belfast', 'Antrim', 'BT88 7OI', '02882459631', 'e.mccarney@yahoo.co.uk', 'Sunshine44'),
('C00005', 'Miss', 'Martin', 'Una ', '21 North Street', 'Lurgan', 'Armagh', 'BT76 3GH', '02845921563', 'una.martin93@hotmail.co.uk', 'Lurgan.una'),
('C00006', 'Mr', 'Kearney', 'Mark', '8 Main Street ', 'Dromore', 'Down', 'BT78 2NK', '02845129534', 'm.kearney3@hotmail.com', 'Millie447'),
('C00007', 'Mr', 'Muldoon', 'Joseph ', '53 Stanley Road ', 'Derry', 'Londonderry', 'BT66 4TK', '02545896512', 'jo_muldoon9@gmail.co.uk', 'Derry99'),
('C00008', 'Mrs', 'Woods', 'Kirsten ', '77 Station Road ', 'Derry', 'Londonderry', 'BT23 9JD', '02856478963', 'kwoods3456@hotmail.com', 'Woods77'),
('C00009', 'Mrs', 'Monaghan', 'Ciara ', '29 Broadway', 'Belfast', 'Antrim', 'BT60 8IS', '02856415458', 'monaghan.ciara2@gmail.com', 'Monaghan60'),
('C00010', 'Mr', 'Burrows', 'Shane ', '23 Park Road ', 'Coleraine', 'Londonderry', 'BT34 5JK', '02847596541', 'shaneburrows44@outlook.com', 'Bonnie88'),
('C00011', 'Mrs', 'Kelly', 'Aoife ', '10 Windsor Road ', 'Ballyclare', 'Antrim ', 'BT35 9FC', '02845796523', 'aoife.kelly67@gmail.co.uk', 'Kells..45'),
('C00012', 'Miss', 'Healy', 'Catherine ', '12 Letfern Road', 'Newcastle', 'Down ', 'BT78 1NH', '02845779632', 'healy22cate@hotmail.com', 'Catie.12');

CREATE TABLE IF NOT EXISTS `models` (
  `ModelID` varchar(6) NOT NULL,
  `Description` varchar(20) NOT NULL,
  PRIMARY KEY (`ModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `models` (`ModelID`, `Description`) VALUES
('F00001', 'Fiesta'),
('F00002', 'Mustang'),
('F00003', 'Focus'),
('F00004', 'S-Max'),
('F00005', 'Kuga'),
('F00006', 'Puma'),
('F00007', 'EcoSport'),
('F00008', 'Mondeo'),
('F00009', 'Galaxy'),
('F00010', 'Tourneo Connect');

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

INSERT INTO `cars` (`CarID`, `ModelID`, `BodyStyle`, `Color`, `CarTrim`, `Drive`, `FuelConsumption`, `CO2Emmission`, `Price`, `NumInStock`) VALUES
('V00001', 'F00001', '3 door', 'Blazer Blue', 'Ebony Cloth', '1.1 L Ti-VCT75PS 5 Speed', '53.3 mpg (5.3L/100KM)', '129 g/km', '16140', '35'),
('V00002', 'F00002', '5 door', 'Agate Black', 'Ebony Leather', '5.0 V8 6 Speed Manual', '23.9 mpg (11.8L/100km)', '268 g/km', '43685', '10'),
('V00003', 'F00003', '3 door', 'Race Red', 'Salerno Partial Leather', '1.OL Ford EcoBoost 125 PS 6 Speed Manual', '49.6 mpg (5.7L/100 km)', '130 g/km', '24440', '30'),
('V00004', 'F00004', '7 door', 'Moondust Sliver', 'Manhattan in Ebony ', '2.0 Ford EcoBlue 150PS 6 Speed Manual FWD', '47.1mpg (6L/100km)', '157 g/km', '29650', '20'),
('V00005', 'F00005', '5 door', 'White Platnium', 'Sport seats Eton Cloth in Ebony ', '1.5 EcoBoost 120PS 6 Speed Manual FWD', '42.2 mpg (67.L/100 km)', '152 g/km', '24615', '25'),
('V00006', 'F00006', '5 door', 'Chrome Blue', 'Ebony Partial Leather Trim', '1.OL Ford EcoBoost Hybrid 125PS 6 Speed', '51.4 mpg (5.5L/100km)', '126 g/km', '23040', '19'),
('V00007', 'F00007', '5 door', 'Frozen White', 'ST-Line Partial Sensico seat trim', '1.OL Ford EcoBoost 125PS 6 Speed', '47.1 mpg (6L/100km)', '136 g/km', '20995', '10'),
('V00008', 'F00008', '5 door', 'Maroon', 'Miko Suede in Charcoal Black with red stitching', '2.OL Ford EcoBlue 150PS 6 Speed Manual FWD', '54.3 mpg (5.2L/100km)', '136 g/km', '28030', '12'),
('V00009', 'F00009', '5 door', 'Magnetic Black', 'Axis in Ebony', '2.OL Ford EcoBlue 150PS 6 Speed Manual FWD', '46.3mpg (6.1L/100km)', '161 g/km', '33100', '9'),
('V00010', 'F00010', '5 door', 'Lucid Red', 'Ligne fabric in Dark Palazzo Grey', '1.5 L 100PS Ford EcoBlue 6 Speed Manual', '48.7 mpg (5.8 L/100km)', '151 g/km', '24030', '13');

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` varchar(6) NOT NULL,
  `CustomerID` varchar(6) NOT NULL,
  `OrderDate` date NOT NULL,
  `DeliveryDate` date NOT NULL,
  `Paid` varchar(3) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `DeliveryDate`, `Paid`) VALUES
('O10001', 'C00005', '20200310', '20200317', 'Yes'),
('O10002', 'C00003', '20200312', '20200319', 'Yes'),
('O10003', 'C00010', '20200318', '20200324', 'Yes'),
('O10004', 'C00002', '20200320', '20200326', 'Yes'),
('O10005', 'C00004', '20200323', '20200330', 'Yes'),
('O10006', 'C00007', '20200326', '20200403', 'Yes'),
('O10007', 'C00008', '20200331', '20200408', 'Yes');

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `OrderID` varchar(6) NOT NULL,
  `CarID` varchar(6) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`, `CarID`),
  KEY `OrderID` (`OrderID`),
  KEY `CarID` (`CarID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `orderdetails` (`OrderID`, `CarID`, `Quantity`) VALUES
('O10001', 'V00006', '2'),
('O10002', 'V00003', '1'),
('O10003', 'V00001', '1'),
('O10004', 'V00010', '2'),
('O10005', 'V00007', '3'),
('O10006', 'V00002', '1'),
('O10007', 'V00008', '3');

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

INSERT INTO `reviews` (`ReviewID`, `CustomerID`, `CarID`, `Rating`, `CustomerComment`) VALUES
('R10001', 'C00005', 'V00006', '9', 'Loved the colour of the car and the interior was stunning.'),
('R10002', 'C00003', 'V00003', '7', 'Good quality car. Would prefer the 5 door there would be more room for the back passengers.'),
('R10003', 'C00010', 'V00001', '10', 'Very comfortable car.'),
('R10004', 'C00002', 'V00010', '10', 'Good family car. Would highly recommend.'),
('R10005', 'C00004', 'V00007', '5', 'This car has a rather small impractical boot and has a bumpy suspension when at low speeds.'),
('R10006', 'C00007', 'V00002', '7', 'Well priced car which is decent to drive however it has rather tight back seats.'),
('R10007', 'C00008', 'V00008', '8', 'Brilliant family car. Just love the interior.');

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