SELECT * FROM bada.cardspoc_nuevo;cardspoc_nuevo
SELECT RIGHT(`date`,4)  FROM bada.cardspoc_nuevo;
SELECT SUBSTRING(`date`,4,2) FROM bada.cardspoc_nuevo;
SELECT LEFT(`date`,2) FROM bada.cardspoc_nuevo;
SELECT CONCAT(RIGHT(`date`,4),"-",SUBSTRING(`date`,4,2),"-",LEFT(`date`,2)) FROM bada.cardspoc_nuevo;
SET SQL_SAFE_UPDATES= 0;
UPDATE bada.cardspoc_nuevo
SET `date` = CONCAT(RIGHT(`date`,4),"-",SUBSTRING(`date`,4,2),"-",LEFT(`date`,2));
ALTER TABLE bada.cardspoc_nuevo
MODIFY COLUMN `date` DATE;
