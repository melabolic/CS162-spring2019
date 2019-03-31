-- Inserting fake values into my DB

-- Initializing the Agents
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Ronald", "McDonald", "019-4527329","ronald@abg.com");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Donald", "Duck", "017-5522019", "dduck@gmail.com");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Jon", "Snow", "012-3333022", "jonthesnow@bb.co");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Ash", "Ketchum", "019-8922234", "pokemonslayer@ham.co");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Snow", "White", "017-6770919", "snow_white@gmail.com");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Lana", "Lang", "012-4522678", "lana@dco.my");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Mickey", "Mouse", "011-1234567", "mickey@dsny.my");
INSERT INTO Agents(FIRSTNAME, LASTNAME, MOBILE, EMAIL) VALUES ("Sabrina", "Witch", "017-4522517", "sabrina_witch@gmail.com");

-- Initializing the Offices
INSERT INTO Offices(NAME) VALUES ("Great Territories");
INSERT INTO Offices(NAME) VALUES ("Eastern Dynasties");
INSERT INTO Offices(NAME) VALUES ("Plotgetters");
INSERT INTO Offices(NAME) VALUES ("Your Place");

-- Summary table for agents and Offices
INSERT INTO Workers(OFFICE, AGENT) VALUES (1, 1);
INSERT INTO Workers(OFFICE, AGENT) VALUES (1, 2);
INSERT INTO Workers(OFFICE, AGENT) VALUES (1, 3);
INSERT INTO Workers(OFFICE, AGENT) VALUES (2, 2);
INSERT INTO Workers(OFFICE, AGENT) VALUES (2, 4);
INSERT INTO Workers(OFFICE, AGENT) VALUES (2, 5);
INSERT INTO Workers(OFFICE, AGENT) VALUES (3, 6);
INSERT INTO Workers(OFFICE, AGENT) VALUES (4, 7);
INSERT INTO Workers(OFFICE, AGENT) VALUES (4, 8);

-- Initializing the Unit types
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (1, "Condo", 2, 1);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (2, "Condo", 3, 1);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (3, "Apartment", 3, 2);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (4, "Terrace", 3, 2);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (5, "Terrace", 4, 3);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (6, "Bungalow", 5, 3);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (7, "Bungalow", 6, 4);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (8, "Mansion", 8, 6);
INSERT INTO UnitTypes(UNIT_TYPE, DESCRIPTION, BEDROOMS, BATHROOMS) VALUES (9, "Room for Rent", 1, 1);

-- Initializing the listings
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (1, "2018-12-22", 15000, 14002, 1, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (2, "2018-12-22", 25000, 14012, 4, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (2, "2018-12-22", 28000, 14022, 6, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (3, "2018-12-23", 30000, 14102, 7, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (4, "2018-12-24", 90000, 14042, 5, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (4, "2018-12-27", 120000, 14022, 4, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (5, "2018-12-27", 200000, 14032, 3, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (5, "2018-12-28", 180000, 14052, 2, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (5, "2018-12-28", 240000, 14032, 7, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (5, "2018-12-28", 400000, 14012, 8, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (6, "2018-12-28", 590000, 14032, 1, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (7, "2018-12-29", 660000, 14062, 2, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (8, "2018-12-30", 1500000, 14102, 4, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (8, "2018-12-31", 2800000, 14042, 1, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (9, "2018-12-31", 4000, 14042, 5, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (9, "2019-01-02", 5000, 14012, 7, "FOR SALE");
INSERT INTO Listings(UNIT_TYPE, DATE_POSTED, LIST_PRICE, ZIPCODE, AGENT_NO, STATUS) VALUES (9, "2019-01-11", 3500, 14032, 8, "FOR SALE");
