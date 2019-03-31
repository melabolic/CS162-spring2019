.mode column
.headers ON
PRAGMA temp_store = 2;

-- Querying the summary table (which agent works for whom)
-- .width 10 10 20
-- SELECT a.FIRSTNAME, a.LASTNAME, o.NAME FROM Workers
--       JOIN Agents a ON a.AGENT_NO = workers.AGENT
--       JOIN Offices o ON o.OFFICE_NO = workers.OFFICE;
-- .print ''
-- Checking the commission table
-- SELECT * FROM Commission;

-- .width 2 15 8 9 10 8 18
-- SELECT
--       l.LIST_NO as No,
--       u.DESCRIPTION as Unit,
--       u.BEDROOMS as Bedrooms,
--       u.BATHROOMS as Bathrooms,
--       l.LIST_PRICE as Price,
--       l.ZIPCODE as Zipcode,
--       (a.FIRSTNAME || " " || a.LASTNAME) as Agent
-- FROM Listings l
-- JOIN Agents a ON a.AGENT_NO = l.AGENT_NO
-- JOIN UnitTypes u ON u.UNIT_TYPE = l.UNIT_TYPE
-- WHERE l.STATUS = "FOR SALE";

.print "(1) Let's assume the mansion gets sold by Ash Ketchum"
.print ''
BEGIN TRANSACTION;
-- creating a temporary table to store the listing price and commission percentage for quicker reference
CREATE TEMP TABLE _var(OG_LIST INTEGER, AGENT_NO INTEGER, PRICE REAL, PERCENT REAL);
INSERT INTO _var(OG_LIST, AGENT_NO, PRICE) SELECT LIST_NO, AGENT_NO, LIST_PRICE FROM Listings WHERE AGENT_NO = 4 AND UNIT_TYPE = 8;
UPDATE _var SET PERCENT = CASE
      WHEN PRICE < 100000 THEN 0.1
      WHEN PRICE >= 100000 AND PRICE <= 250000 THEN 0.075
      WHEN PRICE >= 250000 AND PRICE <= 500000 THEN 0.06
      WHEN PRICE >= 500000 AND PRICE <= 1000000 THEN 0.05
      ELSE 0.04
END;
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Nicolas", "Nicolai", "2019-09-01", 4, 2);
UPDATE Sold SET OG_LIST = (SELECT LIST_NO FROM Listings WHERE AGENT_NO = 4 AND UNIT_TYPE = 8);
UPDATE Listings SET STATUS = "SOLD" WHERE LIST_NO = (SELECT OG_LIST FROM Sold WHERE Sold.OG_LIST = Listings.LIST_NO);
INSERT INTO Commission(OG_LIST, AGENT_NO, AMOUNT) SELECT OG_LIST, AGENT_NO, (PRICE*PERCENT) FROM _var;
DROP TABLE _var;
COMMIT;
-- Querying the new sales
.width 20 12 15 18 20
SELECT
      (s.BUYER_FIRST || " " || s.BUYER_LAST) as Buyer,
      l.LIST_PRICE as Price_Sold,
      s.DATE_SOLD as Date_Sold,
      (a.FIRSTNAME || " " || a.LASTNAME)as Agent,
      o.NAME as Office
FROM Sold s
JOIN Agents a ON a.AGENT_NO = s.AGENT_NO
JOIN Offices o ON o.OFFICE_NO = s.OFFICE
JOIN Listings l ON l.LIST_NO = s.OG_LIST;
.print ''

.print "(2) Now, let's assume further that 12 more properties end up getting sold"
.print ''
-- to ease reading here, I'm going to hardcode some of it
BEGIN TRANSACTION;
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Alice", "Morice",  1, "2019-08-02", 3, 1);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Tanice", "Garfield", 2, "2019-08-03", 1, 1);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Robert", "Hulligan", 3, "2019-08-11", 2, 2);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Sebastian", "Geoffrey", 4, "2019-08-12", 5, 2);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Jasper", "Teagal", 5, "2019-09-14", 6, 3);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Morice", "Astrid", 6, "2019-09-15", 8, 4);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Kavin", "Dunbar", 8, "2019-09-16", 7, 4);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Troy", "McNelly", 10, "2019-09-20", 5, 2);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Matthew", "Richards", 11, "2019-09-21", 4, 2);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Shelly", "Hennig", 12, "2019-09-22", 7, 4);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Matthias", "Jewith", 14, "2019-09-28", 1, 1);
INSERT INTO Sold(BUYER_FIRST, BUYER_LAST, OG_LIST, DATE_SOLD, AGENT_NO, OFFICE) VALUES ("Gordon", "Hallow", 16, "2019-09-30", 2, 1);
--
UPDATE Listings SET STATUS = "SOLD" WHERE LIST_NO = (SELECT OG_LIST FROM Sold WHERE Sold.OG_LIST = Listings.LIST_NO);

-- Creating temporary table to store the percentage, again...
CREATE TEMP TABLE _var(OG_LIST INTEGER, AGENT_NO INTEGER, PRICE REAL, AMOUNT REAL);
INSERT INTO _var(OG_LIST, AGENT_NO, PRICE) SELECT LIST_NO, AGENT_NO, LIST_PRICE FROM Listings WHERE LIST_NO = (SELECT OG_LIST FROM Sold WHERE Sold.OG_LIST = Listings.LIST_NO);
UPDATE _var SET AMOUNT = CASE
      WHEN PRICE < 100000 THEN 0.1*PRICE
      WHEN PRICE >= 100000 AND PRICE <= 250000 THEN 0.075*PRICE
      WHEN PRICE >= 250000 AND PRICE <= 500000 THEN 0.06*PRICE
      WHEN PRICE >= 500000 AND PRICE <= 1000000 THEN 0.05*PRICE
      WHEN PRICE >= 1000000 THEN 0.04*PRICE
END;
INSERT INTO Commission(OG_LIST, AGENT_NO) SELECT OG_LIST, AGENT_NO FROM Sold WHERE NOT OG_LIST = 13;
UPDATE Commission SET AMOUNT = (SELECT AMOUNT FROM _var WHERE Commission.OG_LIST = _var.OG_LIST);
DROP TABLE _var;
COMMIT;
--
.width 20 12 15 18 20
SELECT
      (s.BUYER_FIRST || " " || s.BUYER_LAST) as Buyer,
      l.LIST_PRICE as Price_Sold,
      s.DATE_SOLD as Date_Sold,
      (a.FIRSTNAME || " " || a.LASTNAME)as Agent,
      o.NAME as Office
FROM Sold s
JOIN Agents a ON a.AGENT_NO = s.AGENT_NO
JOIN Offices o ON o.OFFICE_NO = s.OFFICE
JOIN Listings l ON l.LIST_NO = s.OG_LIST;
.print ''

.print "(3) Finding the top 4 offices with most sales for the month of September"
.print ''
SELECT
    o.NAME as Office,
    COUNT(*) as No_of_Sales
FROM Sold s
JOIN Offices o ON o.OFFICE_NO = s.OFFICE
WHERE strftime("%m", s.DATE_SOLD) = "09"
GROUP BY s.OFFICE
ORDER BY COUNT(*) DESC;
.print ''


.print "(4) Finding the top 5 estate agents for the month of September"
.print ''
SELECT
    (a.FIRSTNAME || " " || a.LASTNAME) as Agent,
    a.MOBILE as Mobile,
    COUNT(*) as No_of_Sales
FROM Sold s
JOIN Agents a ON a.AGENT_NO = s.AGENT_NO
WHERE strftime("%m", s.DATE_SOLD) = "09"
GROUP BY s.AGENT_NO
ORDER BY COUNT(*) DESC
LIMIT 5;
.print ''

.print "(5) Let's check how much commission each agent has earned for September"
.print ''
-- Viewing the commission tables
.width 20 18 15
SELECT
    (a.FIRSTNAME || " " || a.LASTNAME) as Agent,
    SUM(c.AMOUNT) as Commission
FROM Commission c
JOIN Agents a ON a.AGENT_NO = c.AGENT_NO
JOIN Sold s ON s.OG_LIST = c.OG_LIST
WHERE strftime("%m", s.DATE_SOLD) = "09"
GROUP BY c.AGENT_NO
ORDER BY SUM(c.AMOUNT) DESC;
.print ''

.print "(6) Finding the average amount of days the houses sold in September were on the market"
.print ''
SELECT
    AVG(julianday(s.DATE_SOLD) - julianday(l.DATE_POSTED)) as Average_days
FROM Sold s
JOIN Listings l ON l.LIST_NO = s.OG_LIST
WHERE strftime("%m", s.DATE_SOLD) = "09";
.print ''

.print "(7) Finding average selling price of houses sold in September"
.print ''
SELECT
    AVG(l.LIST_PRICE) as Average_price
FROM Sold s
JOIN Listings l ON l.LIST_NO = s.OG_LIST
WHERE strftime("%m", s.DATE_SOLD) = "09";
.print ''

.print "(8) Finding the top 5 zipcodes with highest sales prices"
.print ''
SELECT
    l.ZIPCODE as Zipcode,
    SUM(l.LIST_PRICE) as Total_Amount,
    COUNT(*) as No_of_Sales
FROM Sold s
JOIN Listings l ON l.LIST_NO = s.OG_LIST
GROUP BY l.ZIPCODE
ORDER BY l.LIST_PRICE DESC
LIMIT 5;
