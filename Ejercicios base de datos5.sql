SELECT * FROM hotel.clientes;
SELECT * FROM hotel.habitacions;
SELECT * FROM hotel.hoteis;
SELECT * FROM hotel.reservas;

1.
SELECT codigo,nome,enderezo,cp,localidade FROM hotel.hoteis
WHERE localidade IN("Lugo","Santiago")
ORDER BY nome;
2.
SELECT a.hotel,b.nome,a.numero,a.tipo,a.prezo FROM hotel.habitacions a
INNER JOIN hotel.hoteis b
ON a.hotel=b.codigo
ORDER BY a.prezo DESC;
3.
SELECT a.numero,a.`data`,c.nome,b.nome FROM hotel.reservas a
INNER JOIN hotel.hoteis b
ON a.hotel=b.codigo
INNER JOIN hotel.clientes c
ON c.codigo=a.cliente
WHERE c.tipo= "A" AND c.nome LIKE "%go"
ORDER BY a.`data` desc;
4.
SELECT a.numero,b.nome,c.numero,c.prezo,a.data_entrada,a.data_saida,DATEDIFF(a.data_saida,a.data_entrada)*c.prezo FROM hotel.reservas a
INNER JOIN hotel.hoteis b
ON a.hotel=b.codigo
INNER JOIN hotel.habitacions c
ON a.habitacion=c.numero AND a.hotel = c.hotel
WHERE a.data_saida IS NOT NULL;

5.
SELECT COUNT(codigo) FROM hotel.hoteis;
6.
SELECT a.codigo,a.nome,COUNT(b.hotel) FROM hotel.hoteis a
LEFT JOIN hotel.reservas b
ON a.codigo=b.hotel
GROUP BY a.codigo;
7.
SELECT nome,telefono,email FROM hotel.hoteis 
WHERE codigo IN(
SELECT hotel FROM hotel.reservas
WHERE data_entrada BETWEEN "2019-01-15" AND "2019-01-25");
8.
SELECT nome, telefono FROM hotel.clientes
WHERE codigo NOT IN 
(SELECT cliente FROM hotel.reservas WHERE YEAR(`data`) = 2019);
9.
SELECT DISTINCT a.nome,a.enderezo,a.telefono FROM hotel.clientes a
INNER JOIN hotel.reservas b
ON a.codigo=b.cliente
WHERE b.hotel IN
(SELECT hotel FROM hotel.reservas 
WHERE cliente="66666666F") AND a.nome <> "Ruíz Castro, Luis";
10.
SELECT a.codigo,a.nome,b.numero,b.prezo,b.prezo*0.95 FROM hotel.hoteis a
INNER JOIN hotel.habitacions b
ON a.codigo=b.hotel
WHERE a.localidade = "Lugo" AND b.tipo= "S";
11.
SELECT COUNT(*) as Cantidade_reservas, a.hotel, a.habitacion, b.nome FROM hotel.reservas a
INNER JOIN hotel.hoteis b
ON a.hotel= b.codigo
GROUP BY a.hotel, a.habitacion, b.nome
HAVING Cantidade_reservas >= 2
12.
SELECT a.tipo, a.nome, c.nome, COUNT(*) AS Cantidade_reservas FROM hotel.reservas b
INNER JOIN hotel.clientes a
ON a.codigo=b.cliente
INNER JOIN hotel.hoteis c
ON b.hotel=c.codigo
WHERE a.tipo IN ("A","E")
GROUP BY a.tipo, a.nome, c.nome
ORDER BY a.tipo, a.nome, c.nome, Cantidade_reservas DESC;
13.
(SELECT a.tipo, COUNT(DISTINCT b.habitacion) AS "nº de Habitaciones", SUM(DATEDIFF(b.data_saida,b.data_entrada)) AS "Suma de dias de reserva" FROM hotel.clientes a
INNER JOIN hotel.reservas b
ON a.codigo=b.cliente
INNER JOIN hotel.hoteis c
ON b.hotel=c.codigo
WHERE c.nome LIKE "Lu%Palace"
GROUP BY a.tipo) AS Tabla_Agregada 
(SELECT "A" AS tipo UNION SELECT "E" UNION SELECT "P") AS tipos_temp 

14.
SELECT COUNT(b.numero) AS Habitaciones, h.codigo,h.nome,h.email FROM hotel.hoteis h
INNER JOIN hotel.habitacions b
ON b.hotel=h.codigo
GROUP BY h.codigo,h.nome,h.email
HAVING Habitaciones > 5;
15.
SELECT DISTINCT c.codigo, c.nome FROM hotel.clientes c
INNER JOIN hotel.reservas r
ON c.codigo=r.cliente
WHERE r.data >
(SELECT MAX(`data`) FROM hotel.reservas
WHERE cliente = (SELECT codigo FROM hotel.clientes 
WHERE nome= "López Rodríguez, Ánxela"));
16.
SELECT re.hotel AS `codigo hotel`, SUM(DATEDIFF(re.data_saida,re.data_entrada)) AS `suma_dias_Reserva`
FROM hotel.reservas re
WHERE data_entrada >= DATE_SUB(@hoy, INTERVAL 2 MONTH) AND data_entrada <= @hoy
GROUP BY re.hotel
HAVING SUM(DATEDIFF(re.data_saida,re.data_entrada)) = (
SELECT MAX(suma_dias_Reserva) FROM (SELECT SUM(DATEDIFF(r.data_saida,r.data_entrada)) AS suma_dias_Reserva ,r.hotel FROM hotel.reservas r
WHERE data_entrada >= DATE_SUB(@hoy, INTERVAL 2 MONTH) AND data_entrada <= @hoy
GROUP BY r.hotel) AS Tabla1);
17.
SELECT AVG(DATEDIFF(data_entrada,data)) AS Media,
MAX(DATEDIFF(data_entrada,data)) AS Maximo,
MIN(DATEDIFF(data_entrada,data)) AS Minimo
FROM hotel.reservas;
18.
SELECT hot.localidade, COUNT(res.numero) AS "Cantidade Reservas" FROM hotel.hoteis hot
INNER JOIN hotel.reservas res
ON hot.codigo=res.hotel
INNER JOIN hotel.habitacions hab
ON res.hotel=hab.hotel AND res.habitacion=hab.numero
WHERE hab.supletoria = "S"
GROUP BY hot.localidade;
19.
20.
SELECT cli.codigo, cli.nome, cli.tipo, res.data, DATEDIFF(res.data_saida,res.data_entrada), hot.nome FROM hotel.clientes cli
INNER JOIN hotel.reservas res
ON cli.codigo=res.cliente
INNER JOIN hotel.hoteis hot
ON hot.codigo=res.hotel
WHERE res.data= (SELECT MAX(DATA) FROM hotel.reservas);
21.
SELECT nome,YEAR(MAX(`data`)) AS Anho ,MONTH(MAX(`data`)) AS Mes FROM 
(SELECT cli.nome,res.cliente,res.`data` FROM hotel.reservas res
INNER JOIN hotel.clientes cli
ON res.cliente=cli.codigo
WHERE cli.tipo="A" AND YEAR(data)= 2019
) AS Tabla_Fecha

GROUP BY nome;
22.
SELECT hot.codigo,hot.nome,MAX(hab.prezo),MIN(hab.prezo),AVG(hab.prezo) FROM hotel.hoteis hot
INNER JOIN hotel.habitacions hab
ON hab.hotel=hot.codigo
WHERE hot.localidade <> "Lugo"
GROUP BY hot.codigo,hot.nome
ORDER BY AVG(hab.prezo) DESC;
23.
SELECT COUNT(DISTINCT hotel) FROM hotel.habitacions
WHERE supletoria = "S"
24.
SELECT hot.codigo,hot.nome,hab.numero,COUNT(hab.numero) FROM hotel.hoteis hot
INNER JOIN hotel.habitacions hab
ON hot.codigo=hab.hotel
INNER JOIN hotel.reservas res
ON hab.hotel=res.hotel AND res.habitacion=hab.numero
GROUP BY hot.codigo,hot.nome,hab.numero
HAVING COUNT(hab.numero) >=2;
25.
SELECT hot.nome AS "Nome Hotel",hab.
SUM(CASE WHEN hab.tipo = "I" THEN 1 ELSE 0 END)
SUM(CASE WHEN hab.tipo IN ("D","S","M") THEN 1 ELSE 0 END)
SUM(CASE WHEN hab.tipo = "I" THEN 1 ELSE 2 END)
FROM hotel.hoteis hot
INNER JOIN hotel.habitacions hab
ON hot.codigo=hab.hotel
GROUP BY hot.nome;