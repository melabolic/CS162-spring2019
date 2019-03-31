-- Initializing the tables
PRAGMA foreign_keys = ON;

-- Agents store all the agents who are currently working with a property office
CREATE TABLE Agents(
  AGENT_NO INTEGER PRIMARY KEY AUTOINCREMENT,
  FIRSTNAME VARCHAR(20),
  LASTNAME VARCHAR(20),
  MOBILE VARCHAR(20),
  EMAIL VARCHAR(20)
);

-- Offices record which property offices exist out there
CREATE TABLE Offices(
  OFFICE_NO INTEGER PRIMARY KEY AUTOINCREMENT,
  NAME VARCHAR(20)
);

-- This table records which Agents work for which property offices
CREATE TABLE Workers(
  OFFICE INTEGER,
  AGENT INTEGER,
  FOREIGN KEY (OFFICE) REFERENCES Offices(OFFICE_NO),
  FOREIGN KEY (AGENT) REFERENCES Agents(AGENT_NO)
);

-- Creates a table that lists all the different unit types
CREATE TABLE UnitTypes(
  UNIT_TYPE INTEGER PRIMARY KEY,
  DESCRIPTION VARCHAR(20),
  BEDROOMS INTEGER,
  BATHROOMS INTEGER
);

-- Listings refer to the table that records the original listing of the houses
CREATE TABLE Listings (
  LIST_NO INTEGER PRIMARY KEY AUTOINCREMENT,
  UNIT_TYPE INTEGER,
  DATE_POSTED TEXT,
  LIST_PRICE REAL,
  ZIPCODE VARCHAR(5),
  AGENT_NO INTEGER,
  STATUS VARCHAR(10),
  FOREIGN KEY (UNIT_TYPE) REFERENCES UnitTypes(UNIT_TYPE),
  FOREIGN KEY (AGENT_NO) REFERENCES Agents(AGENT_NO)
);

-- Commission records the commision prices
CREATE TABLE Commission (
  ENTRY INTEGER PRIMARY KEY AUTOINCREMENT,
  OG_LIST INTEGER,
  AGENT_NO INTEGER,
  AMOUNT REAL
);

-- Sold acts as the summary table that records:
-- buyer details, sale price, date of sale, the selling estate agent.
CREATE TABLE Sold (
  ORDER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  BUYER_FIRST VARCHAR(20),
  BUYER_LAST VARCHAR(20),
  OG_LIST INTEGER,
  DATE_SOLD VARCHAR(30),
  AGENT_NO INTEGER,
  OFFICE INTEGER,
  FOREIGN KEY (AGENT_NO) REFERENCES Agents(AGENT_NO),
  FOREIGN KEY (OG_LIST) REFERENCES Listings(LIST_NO),
  FOREIGN KEY (OFFICE) REFERENCES Offices(OFFICE_NO)
);
