SELECT 'Hola' REGEXP 'hola';
SELECT 'Hola' REGEXP BINARY 'hola';

^ -> ^S cualquier palabra que empiece por S (Indica el inicio de la cadena)
$ -> s$ cualquier palabra que termine por S (Indica el final de la cadena)
. -> s.to -> cualquier caracter individual (Indica que hay un caracter entre esos caracteres) (s1to,suto,s3to)
* -> base* cualquier cantidada de veces, desde 0, el ultimo caracter -> bas, base, basee, baseee y asi consecutivamente, si ponemos (base*) incluye el contenido, es decir, NULL, base, basebase, basebasebase...
+ -> base+ cualquier cantidad de veces, desde 1, el ultimo caracter -> bas, base, basee, baseee y asi consecutivamente, si ponemos (base*) incluye el contenido, es decir, base, basebase, basebasebase...
? -> base? -> 0 o 1 vez el caracter anterior -> bas o base
() -> (abc) agrupa operadores en un mismo conjunto, un mismo caracter
| -> com|es funciona como un OR
[] -> [aeiou] funciona como un OR dentro de este conjunto
[^] -> [^0-9] cualquier cosa menos el grupo 
{} -> repeticion exacta de veces  -> {2} Por ejemplo [aeiou]{2} -> ae,ai,ao,ao,ea,ei,eo,eu y etc
{,} -> repeticion en un rango -> {2-3} por ejemplo [aeiou]{3} -> ae, aei, ao, aoi y etc
[-] -> [a-z] o [0-9] rango de caracteres
\\. -> \\.com|\\.es -> para incluir los caracteres especiales como los mencionados anteriormente.

DNI -> Exactamente 8 numeros + letra 

SELECT column1 FROM db.tabla 
WHERE column1 REGEXP '^[0-9]{8}[A-Z]$'

Matricula -> Exactamente 4 numeros + - + 3 letras (Sin vocales y Q/Ñ )

SELECT colmun1 FROM db.tabla
WHERE column1 REGEXP '^[0-9]{4}\\-[WRTYPSDFGHJKLZXCVBNM]{3}$'

Fechas ISO (AÑO-MES-DIA)

SELECT column1 FROM db.tabla
WHERE column1 REGEXP '^[0-9]{4}\\-(0[1-9]|1[0-2]\\-([0-2][0-9]|3[0-1])$'

Correos electronicos

SELECT column1 FROM db.tabla
WHERE column1 REGEXP '^[a-Z0-9.-_+]+\\@[a-z]{1,}\\.[a-z]{2-3}$'

IPv4

SELECT column1 FROM db.tabla
WHERE column1 REGEXP '^([0-9]{1,3}\\.){3}[0-9]{3}$'

