-- CREATE SCHEMA BADA;

-- USE BADA;
SET SQL_SAFE_UPDATES = 0;
UPDATE bada.dictionary 
SET `GDP per Capita` = null
WHERE `GDP per Capita`=0;
UPDATE bada.dictionary
SET Population=null
WHERE Population=0;

SELECT * FROM BADA.SAMPLE_SUPERSTORE_ORDERS;
SELECT ship_date, ship_mode FROM BADA.SAMPLE_SUPERSTORE_ORDERS;
SELECT DISTINCT SHIP_MODE FROM BADA.SAMPLE_SUPERSTORE_ORDERS;
SELECT CITY,ATHLETE FROM BADA.Winter;
SELECT * FROM BADA.WINTER;
SELECT SPORT,YEAR,COUNTRY FROM BADA.WINTER;
SELECT DISTINCT COUNTRY FROM BADA.WINTER;
SELECT Year AS Anho, City AS Ciudad, Sport AS Deporte FROM bada.winter;
SELECT ATHLETE AS Participante, Country AS Origen FROM bada.winter;
SELECT DISTINCT CONCAT(Sport," ",Country) FROM bada.winter;
SELECT DISTINCT CITY AS CiudadSinDuplicar FROM bada.winter;
SELECT CITY AS Sede,YEAR as Fecha FROM bada.winter;
SELECT * FROM bada.winter
WHERE City = "Sapporo";
SELECT * FROM bada.winter
WHERE Sport= "Skiing";
SELECT ATHLETE,DISCIPLINE,COUNTRY FROM bada.winter
WHERE Medal= "Gold";
SELECT `YEAR`,SPORT,DISCIPLINE FROM bada.winter
WHERE `YEAR` <> 1924;
SELECT * FROM bada.winter
WHERE Country = "ITA" AND Medal = "Gold";
SELECT * FROM bada.winter
WHERE Gender = "Women" AND Medal = "Gold";
SELECT Sport, `Year`,City FROM bada.winter
WHERE Country = "FRA" AND Gender = "Women";
SELECT * FROM bada.winter
WHERE `Year` > 1980;
SELECT * FROM bada.winter
WHERE NOT Country = "GER";
SELECT * FROM bada.winter
WHERE NOT (Country <> "GER" OR `Event`<> "Ice Hockey");
SELECT * FROM bada.winter
WHERE NOT (Country = "GER" OR Country = "SUI");
SELECT DISTINCT Country FROM bada.winter
WHERE Country LIKE "S%";
SELECT * FROM bada.winter
WHERE Athlete LIKE "%son%";
SELECT * FROM bada.winter
WHERE Sport LIKE "%ing";
SELECT * FROM bada.winter
WHERE Sport LIKE "_u%";
SELECT DISTINCT Sport FROM bada.winter
WHERE Sport LIKE "S%g";
SELECT * FROM bada.winter
WHERE Country IN("GER","FRA");
SELECT * FROM bada.winter
WHERE Sport IN("Skating","Curling");
SELECT * FROM bada.winter
WHERE NOT Country IN("USA");
SELECT * FROM bada winter
WHERE NOT Medal IN("Gold","Silver");
SELECT * FROM bada.winter
WHERE Country IN("USA","GBR","SUI","BEL");
SELECT * FROM bada.dictionary
WHERE Population BETWEEN 100000 AND 200000;
SELECT * FROM bada.dictionary
WHERE `GDP per Capita` BETWEEN 100 AND 1000;
SELECT * FROM bada.dictionary
WHERE Country BETWEEN "A" AND "C";
SELECT * FROM bada.tips;
SELECT MAX(total_bill) FROM bada.tips
WHERE `DAY` = "Sun" AND Sex="Female";
SELECT MIN(total_bill) AS "SmallestBill" FROM bada.tips;
SELECT MAX(total_bill) AS "LargestBill" FROM bada.tips;
SELECT COUNT(*) FROM bada.tips;
SELECT AVG(size) FROM bada.tips
WHERE `day` = "Sat";
SELECT SUM(tip) FROM bada.tips;
SELECT SUM(tip) FROM bada.tips
WHERE `day` = "Sat" OR `day`="Sun";
SELECT `day`,SUM(size) FROM bada.tips
GROUP BY `day`;
SELECT sex, AVG(tip) FROM bada.tips
GROUP BY sex;
SELECT `day`,size,
CASE
WHEN total_bill < 10 THEN "Poco"
WHEN total_bill BETWEEN 10 AND 30 THEN "Aceptable"
ELSE "Top"
END AS "Categoria propina"
FROM bada.tips;
SELECT * FROM bada.dictionary
ORDER BY Population;
SELECT * FROM bada.dictionary
ORDER BY Population, Country;
SELECT * FROM bada.dictionary
ORDER BY `Code` DESC;
SELECT * FROM bada.dictionary
ORDER BY Population ASC, `GDP per Capita` DESC;
SELECT Country FROM bada.dictionary WHERE `GDP per Capita` > (
SELECT AVG (`GDP per Capita`) FROM bada.dictionary);
SELECT Athlete, Medal, Country FROM bada.winter WHERE Country IN (
SELECT `Code` FROM bada.dictionary WHERE `GDP per Capita` < 10000);
SELECT Country, `GDP per Capita` FROM bada.dictionary WHERE Population IS NULL;
SELECT Country, Population FROM bada.dictionary WHERE `GDP per Capita` IS NULL;