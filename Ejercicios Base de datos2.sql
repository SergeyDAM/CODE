USE bada;
SELECT * FROM bada.all_pokemon;

-- ALTER TABLE bada.all_pokemon
-- CHANGE COLUMN `Type?` Tipo1 text;

-- ALTER TABLE bada.all_pokemon
 -- CHANGE COLUMN `Type?_[0]` Tipo2 text;
1.
SELECT `Name` AS Nombre, Tipo1 AS Tipo FROM bada.all_pokemon;
2.
SELECT DISTINCT Tipo1 FROM bada.all_pokemon;
3.
SELECT DISTINCT Tipo1,Tipo2 FROM bada.all_pokemon;
4.
SELECT * FROM bada.all_pokemon ORDER BY `Name` DESC;
5.
SELECT `Name`,HP-50 FROM bada.all_pokemon;
6.
SELECT CONCAT(`Name`," ",Tipo1) AS "Nombre y tipo",Att FROM bada.all_pokemon
ORDER BY Att ASC;
7.
SELECT `Name`,Att FROM bada.all_pokemon
WHERE HP > 50;
8.
SELECT `Name`,Att,Def FROM bada.all_pokemon 
WHERE NOT Tipo1 = "Poison";
9.
SELECT COUNT(`Number`) FROM bada.all_pokemon;
10.
SELECT SUM(Def) FROM bada.all_pokemon;
11.
SELECT MIN(Def) FROM bada.all_pokemon;
12.
SELECT MIN(Spe) FROM bada.all_pokemon;
13.
SELECT MAX(Att) FROM bada.all_pokemon
WHERE Tipo1 = "Water" OR Tipo2 = "Water";
14.
SELECT AVG(Spe),COUNT(*) FROM bada.all_pokemon
WHERE Tipo1 = "Fire" or Tipo2 = "Fire";
15.
SELECT MAX(Att),MIN(Att),SUM(Att),AVG(Att) FROM bada.all_pokemon;
16.
SELECT Generation, COUNT(*) AS "Conteo" FROM bada.all_pokemon 
GROUP BY Generation ORDER BY Conteo DESC;
17.
SELECT MAX(Spe),MIN(Spe) FROM bada.all_pokemon;
18.
SELECT MIN(HP), Generation FROM bada.all_pokemon
GROUP BY Generation;
19.
SELECT `Name`, Generation, HP FROM bada.all_pokemon
WHERE HP = (SELECT MIN(HP) FROM bada.all_pokemon);
20.
SELECT MIN(Att), Generation FROM bada.all_pokemon
GROUP BY Generation;
21.
SELECT AVG(Att),Tipo1 AS "Promedio" FROM bada.all_pokemon
GROUP BY Tipo1 ORDER BY Promedio ASC;
22.
SELECT AVG(Spe),Tipo1 FROM bada.all_pokemon
WHERE Generation <> "6" GROUP BY Tipo1 ORDER BY AVG(Spe) DESC;
23.
SELECT AVG(Spe),MAX(Spe),MIN(Spe),COUNT(*) FROM bada.all_pokemon
WHERE Tipo1 = "Fire" AND Tipo2 = "";
24.
SELECT `Name`, Tipo1,Tipo2,Generation,HP FROM bada.all_pokemon
WHERE HP >= 150;
25.
SELECT MAX(HP),Tipo1 FROM bada.all_pokemon
WHERE HP >= 150 GROUP BY Tipo1;
26.
SELECT AVG(HP),Tipo1 FROM bada.all_pokemon
WHERE HP >= 150 GROUP BY Tipo1;
27.
SELECT AVG(HP), Tipo1 FROM bada.all_pokemon
GROUP BY Tipo1 HAVING AVG(HP) > 75;
28.

SELECT DISTINCT `Event`,City FROM bada.winter
WHERE City="Turin"
UNION
SELECT DISTINCT `Event`,City FROM bada.summer
WHERE City= "Turin";

