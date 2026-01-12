SELECT * FROM bada.nba_universidades;
SELECT * FROM bada.nba_nacimientos;
SELECT * FROM bada.nba_jugador;

Peso medio de los jugadores de la universidad de Miami

SELECT AVG(a.weight),b.collage FROM bada.nba_jugador a
INNER JOIN bada.nba_universidades b
ON a.ID_Player=b.ID_Player
WHERE b.collage LIKE "Miami University" OR b.collage LIKE "University of Miami"
GROUP BY b.collage;

Encontrar fecha y lugar de nacimiento asociado a cada jugador

SELECT a.Player,b.born,b.birth_city,b.birth_state FROM bada.nba_jugador a
LEFT JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player;

Encontrar nombre, ID y lugar de nacimiento de los jugadores

SELECT a.ID_Player,a.Player,b.born,b.birth_city,b.birth_state FROM bada.nba_jugador a
RIGHT JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player;

Encontrar nombre, ID y lugar de nacimiento de los jugadores

SELECT a.ID_Player,a.Player,b.born,b.birth_city,b.birth_state FROM bada.nba_jugador a
INNER JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player;

Encontrar nombre, id, lugar y fecha de nacimiento de jugadores de Columbia University

SELECT a.ID_Player,a.Player,b.born,b.birth_city,b.birth_state FROM bada.nba_jugador a
INNER JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player
INNER JOIN bada.nba_universidades c
ON a.ID_Player=c.ID_Player
WHERE c.collage LIKE "Columbia University";

Encontrar el ID, la fecha de nacimiento que nacieron despues del jugador llamado "Jim McMillian"

SELECT a.ID_Player,b.born FROM bada.nba_jugador a
INNER JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player
WHERE b.born > (SELECT b.born FROM bada.nba_jugador a
INNER JOIN bada.nba_nacimientos b
ON a.ID_Player=b.ID_Player
WHERE a.Player = "Jim McMillian");


