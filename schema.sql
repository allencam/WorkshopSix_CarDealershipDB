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

