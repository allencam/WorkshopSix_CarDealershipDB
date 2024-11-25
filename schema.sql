# -------------------------------------------- #
# Target DBMS:  MySQL                          #
# Project:      WorkshopSix_CarDealershipDB    #
# -------------------------------------------- #

DROP DATABASE IF EXISTS CarDealerShipDB;
-- Will check if database exists, deletes if it it does

CREATE DATABASE IF NOT EXISTS CarDealerShipDB;
-- Handles the creation of the database, so this will run regardless since it will be deleted in line 6 if it does exist

USE CarDealerShipDB;
-- Sets specified database as the active one for commands to be executed on it

# ------------------- TABLES ------------------- #

# 1. Dealerships
	CREATE TABLE `Dealerships` (
		`DealershipID`     INT NOT NULL AUTO_INCREMENT,
		`DealershipName`   VARCHAR(50) NOT NULL,
		`Address`          VARCHAR(50),
		`City`             VARCHAR(20),
		`State`            VARCHAR(2),
		`Phone`            VARCHAR(12),
        
		CONSTRAINT `PK_DealershipID` PRIMARY KEY (`DealershipID`)
	);

# 2. Vehicles
	CREATE TABLE `Vehicles` (
		`VIN`             VARCHAR(17) NOT NULL, -- A VIN has 17 digits, typically
        `Year`            YEAR,
        `Make`            VARCHAR(50) NOT NULL,
        `Model`           VARCHAR(50) NOT NULL,
        `Color`           VARCHAR(50),
        `VehicleType`     VARCHAR(50),
        `Price`           DECIMAL(9,2),
        `Availability`    BOOLEAN NOT NULL, -- TRUE (1) FALSE (0)
        `Status`          VARCHAR(50), -- Status can be: Available, sold, maintenance, in transit, etc.
        
        CONSTRAINT `PK_VIN` PRIMARY KEY (`VIN`)
    );

# 3. Inventory
	CREATE TABLE `Inventory` (
		`DealershipID`   INT NOT NULL,
		`VIN`            VARCHAR(17) NOT NULL,
        
        PRIMARY KEY (`DealershipID`, `VIN`),
        FOREIGN KEY (`DealershipID`) REFERENCES `Dealerships`(`DealershipID`),
		FOREIGN KEY (`VIN`) REFERENCES `Vehicles`(`VIN`)
     );

# 4. SalesContracts
	CREATE TABLE `SalesContracts` (
		`SalesContractID`  INT NOT NULL AUTO_INCREMENT,
        `DateOfContract`   DATE NOT NULL,
        `ClientFirstName`  VARCHAR(24) NOT NULL,
        `ClientLastName`   VARCHAR(24) NOT NULL,
        `ClientEmail`      VARCHAR(50),
--         `VINVehicleSold`  
		`LoanTermInMonths` SMALLINT NOT NULL,
        `LoanAmount`       DECIMAL(9,2),
        `MonthlyPayment`   DECIMAL(9,2),
        
        CONSTRAINT `PK_SalesContractID` PRIMARY KEY (`SalesContractID`)
    ); 

# 5. LeaseContracts
    
    
# ------------------- DATA ------------------- #

# 1. Dealerships

	INSERT INTO `Dealerships` (`DealershipName`, `Address`, `City`, `State`, `Phone`)
		VALUES 
		('Elite Motors', '123 Main St', 'Springfield', 'IL', '555-123-4567'),
		('Auto World', '456 Elm St', 'Rivertown', 'NY', '555-987-6543'),
		('Prime Autos', '789 Oak St', 'Greenville', 'CA', '555-654-3210');
        
# 2. Vehicles
	INSERT INTO `Vehicles` (`VIN`, `Year`, `Make`, `Model`, `Color`, `VehicleType`, `Price`, `Availability`, `Status`)
		VALUES
		('1HGCM82633A123456', 2023, 'Honda', 'Civic', 'Blue', 'Sedan', 24999.99, TRUE, 'Available'),
		('1FTFW1EF9EKD12345', 2022, 'Ford', 'F-150', 'Black', 'Truck', 35999.99, FALSE, 'Sold'),
		('5TDJK3DC6KS123456', 2021, 'Toyota', 'Sienna', 'White', 'Minivan', 29999.99, TRUE, 'Available'),
		('WVWZZZ3CZ8E123456', 2023, 'Volkswagen', 'Golf', 'Red', 'Hatchback', 21999.99, FALSE, 'Maintenance'),
		('1C4RJFAG3FC123456', 2023, 'Jeep', 'Grand Cherokee', 'Silver', 'SUV', 40999.99, TRUE, 'In Transit');
        
# 3. Inventory
	INSERT INTO `Inventory` (`DealershipID`, `VIN`)
		VALUES
		(1, '1HGCM82633A123456'),
		(2, '1FTFW1EF9EKD12345'),
		(3, '5TDJK3DC6KS123456'),
		(1, 'WVWZZZ3CZ8E123456'), 
		(2, '1C4RJFAG3FC123456');

        
# 3. SalesContracts
	INSERT INTO `SalesContracts` (`DateOfContract`, `ClientFirstName`, `ClientLastName`, `ClientEmail`, `LoanTermInMonths`, `LoanAmount`, `MonthlyPayment`)
		VALUES
		('2023-01-15', 'John', 'Doe', 'johndoe@example.com', 60, 24000.00, 400.00),
		('2023-03-10', 'Jane', 'Smith', 'janesmith@example.com', 48, 35000.00, 729.17),
		('2023-06-25', 'Bob', 'Johnson', 'bobjohnson@example.com', 72, 30000.00, 416.67);