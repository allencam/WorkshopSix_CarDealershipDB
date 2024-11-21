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

# 1. Vehicles
/* DATA TYPES GUIDE
===================================================
               SQL Data Types Guide
===================================================

-- NUMERIC DATA TYPES --
TINYINT    : Integer data from -128 to 127 (1 byte storage).
SMALLINT   : Integer data from -32,768 to 32,767 (2 bytes storage).
INT/INTEGER: Standard integer from -2,147,483,648 to 2,147,483,647 (4 bytes).
BIGINT     : Large integer from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 (8 bytes).
DECIMAL(p,s)/NUMERIC(p,s): Fixed-point numbers with precision (p) and scale (s).
    - `p`: Total number of digits.
    - `s`: Number of digits to the right of the decimal point.
FLOAT(n)   : Approximate floating-point number. Precision depends on `n` (4 or 8 bytes).
REAL       : Single-precision floating-point (approx. 7 digits of precision).
DOUBLE      : Double-precision floating-point (approx. 15 digits of precision).

-- CHARACTER DATA TYPES --
CHAR(n)    : Fixed-length string. Pads with spaces if value is shorter than `n`.
VARCHAR(n) : Variable-length string with a maximum of `n` characters. No padding.
TEXT       : Variable-length string for large text data (size limit depends on DBMS).

-- DATE AND TIME DATA TYPES --
DATE       : Stores date in 'YYYY-MM-DD' format.
TIME       : Stores time in 'HH:MM:SS' format.
DATETIME   : Stores both date and time in 'YYYY-MM-DD HH:MM:SS' format.
TIMESTAMP  : Similar to DATETIME but with time zone support in some DBMS.
YEAR       : Stores a 4-digit year.

-- BOOLEAN DATA TYPE --
BOOLEAN    : Logical value, typically TRUE or FALSE (may be stored as 0 and 1 in some DBMS).

-- BINARY DATA TYPES --
BINARY(n)  : Fixed-length binary data.
VARBINARY(n): Variable-length binary data.
BLOB       : Binary Large Object for storing large binary data like images or files.

-- OTHER DATA TYPES --
ENUM       : String object with a predefined set of possible values.
SET        : A collection of zero or more predefined values (specific to some DBMS like MySQL).
JSON       : Stores JSON-formatted data (supported in MySQL, PostgreSQL, etc.).
ARRAY      : Stores an array of values (supported in PostgreSQL).
UUID       : Stores universally unique identifiers.

===================================================
Note: Data type availability and behavior may vary 
      depending on the Database Management System 
      (DBMS) in use (e.g., MySQL, PostgreSQL, SQL Server).
===================================================
*/

CREATE TABLE `Dealerships` (
	`DealershipID`     INT NOT NULL AUTO_INCREMENT,
    `DealershipName`   VARCHAR(50) NOT NULL,
    `Address`          VARCHAR(50),
    `City`             VARCHAR(20),
    `State`            VARCHAR(2),
    `Phone`            VARCHAR(12),
    CONSTRAINT `PK_DealershipID` PRIMARY KEY (`DealershipID`)
);
