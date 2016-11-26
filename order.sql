DROP SCHEMA IF EXISTS `ORDER`;
CREATE SCHEMA `ORDER`;
USE `ORDER`;

DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER`
(
	`Cust_no`   INT AUTO_INCREMENT,
    `Cust_name` VARCHAR(30) NOT NULL,
    `City`      VARCHAR(30) NOT NULL,
	PRIMARY KEY (`Cust_no`)
);

DROP TABLE IF EXISTS `ORDER`;
CREATE TABLE `ORDER`
(
	`Order_no` INT AUTO_INCREMENT,
    `Ord_date` DATE,
    `Cust_no`  INT,
    `Ord_amt`  FLOAT,
    PRIMARY KEY (`Order_no`),
    FOREIGN KEY (`Cust_no`) REFERENCES `CUSTOMER`(`Cust_no`)
);

DROP TABLE IF EXISTS `ITEM`;
CREATE TABLE `ITEM`
(
	`Item_no`    INT AUTO_INCREMENT,
    `Unit_price` FLOAT,
    PRIMARY KEY (`Item_no`)
);

DROP TABLE IF EXISTS `ORDER_ITEM`;
CREATE TABLE `ORDER_ITEM`
(
	`Order_no` INT,
    `Item_no`  INT,
    `Qty`      FLOAT,
    PRIMARY KEY (`Order_no`, `Item_no`),
    FOREIGN KEY (`Order_no`) REFERENCES `ORDER`(`Order_no`),
    FOREIGN KEY (`Item_no`)  REFERENCES `ITEM`(`Item_no`)
);

DROP TABLE IF EXISTS `WAREHOUSE`;
CREATE TABLE `WAREHOUSE`
(
	`Warehouse_no` INT AUTO_INCREMENT,
    `City`         VARCHAR(30) NOT NULL,
    PRIMARY KEY (`Warehouse_no`)
);

DROP TABLE IF EXISTS `SHIPMENT`;
CREATE TABLE `SHIPMENT`
(
	`Order_no` 	   INT,
    `Warehouse_no` INT,
    `Ship_date`    DATE,
    PRIMARY KEY (`Order_no`, `Warehouse_no`),
    FOREIGN KEY (`Order_no`)     REFERENCES     `ORDER`(`Order_no`),
    FOREIGN KEY (`Warehouse_no`) REFERENCES `WAREHOUSE`(`Warehouse_no`)    
);

INSERT INTO `CUSTOMER`(`Cust_name`,`City`)
VALUES
('John Smith'      ,'Houston'),
('Franklin Wong'   ,'Houston'),
('Alicia Zelaya'   ,'Spring'),
('Jennifer Wallace','Bellaire'),
('Ramesh Narayan'  ,'Humble'),
('Joyce English'   ,'Houston'),
('Ahmed Jabbar'    ,'Houston'),
('James Borg'      ,'Houston');

INSERT INTO `ORDER`(`Ord_date`,`Cust_no`,`Ord_amt`)
VALUES
('2016-10-25', 1, 115.06),
('2016-10-24', 1, 15.80),
('2016-10-19', 8, 15.98);

INSERT INTO `ITEM`(`Unit_price`)
VALUES
(115.06),
(12.79),
(7.99),
(8.50),
(15.80);

INSERT INTO `ORDER_ITEM`(`Order_no`, `Item_no`, `Qty`)
VALUES
(1, 1, 1),
(2, 5, 1),
(3, 3, 2);

INSERT INTO `WAREHOUSE`(`City`)
VALUES
('Houston'),
('Humble'),
('Bellaire');

INSERT INTO `SHIPMENT`(`Order_no`, `Warehouse_no`, `Ship_date`)
VALUES
(1, 1, '2016-11-22'),
(2, 1, '2016-10-25'),
(3, 2, '2016-10-20');