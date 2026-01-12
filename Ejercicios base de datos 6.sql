1.
SELECT pac_nome,ing_dataingreso, IFNULL(ing_numhabitacion,"No registrado") FROM paciente
INNER JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
WHERE pac_cidade = "Lugo";
2.
SELECT pac_nome,pac_cidade,ing_dataingreso, IFNULL(ing_numhabitacion,"No registrado"),IFNULL(hab_numcamas,"No registrado") FROM paciente
INNER JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
LEFT JOIN habitacion
ON hab_numero=ing_numhabitacion
WHERE pac_cidade = "Lugo";
3.
SELECT pac_nome,pac_cidade,ing_dataingreso, IFNULL(ing_numhabitacion,"No registrado"),IFNULL(hab_numcamas,"No registrado") FROM paciente
LEFT JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
LEFT JOIN habitacion
ON hab_numero=ing_numhabitacion
WHERE pac_cidade = "Lugo";
4.
SELECT pac_nome,ing_dataingreso,ing_numhabitacion FROM paciente
INNER JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
WHERE pac_cidade = "Lugo" AND ing_numhabitacion IS NOT NULL;
5.
SELECT pac_nome,ing_dataingreso,ing_numhabitacion,IFNULL(hab_numcamas,"No registrado") FROM paciente
INNER JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
LEFT JOIN habitacion
ON hab_numero=ing_numhabitacion
WHERE pac_cidade = "Lugo" ;
6.
SELECT pac_nome,ing_dataingreso,ing_numhabitacion,IFNULL(hab_numcamas,"No registrado") FROM paciente
LEFT JOIN ingreso 
ON pac_numhistoria=ing_nhpaciente
LEFT JOIN habitacion
ON hab_numero=ing_numhabitacion
WHERE pac_cidade = "Lugo";
7.
SELECT pac_nome,pac_datanac,ing_dataingreso,tra_enfermidade,per_nome FROM paciente
INNER JOIN ingreso
ON ing_nhpaciente=pac_numhistoria
LEFT JOIN tratamento
ON tra_idingreso=ing_nhpaciente
LEFT JOIN persoal
ON tra_codigomedico=per_codigo
8.
SELECT per_nome,per_enderezo,per_cidade,IFNULL(med_especialidade,"No es medico") AS "Especialidade" FROM persoal
LEFT JOIN medico
ON med_codigo=per_codigo
9.
SELECT  per_nome, per_nif,per_enderezo,per_cidade,IFNULL(med_especialidade,"No es medico") AS "Especialidade" FROM persoal
LEFT JOIN medico
ON med_codigo=per_codigo
WHERE med_especialidade="Cardioloxía" OR med_codigo IS NULL;
10.
SELECT per_nome,per_nif,per_enderezo,per_cidade,"Persoal" FROM persoal
UNION
SELECT pac_nome,pac_nif,pac_enderezo,pac_cidade,"Paciente" FROM paciente
11.
SELECT DISTINCT per_nome AS "Nome" FROM persoal
INNER JOIN tratamento
ON tra_codigomedico=per_codigo
INNER JOIN ingreso
ON tra_idingreso=ing_id
INNER JOIN paciente
ON ing_nhpaciente=pac_numhistoria
WHERE YEAR(pac_datanac) BETWEEN "1961" AND "1970"


SELECT DISTINCT per_nome AS "Nome" FROM paciente
INNER JOIN ingreso 
ON YEAR(pac_datanac) BETWEEN 1961 AND 1970 AND ing_nhpaciente=pac_numhistoria
INNER JOIN tratamento
ON tra_idingreso= ing_id
INNER JOIN persoal
ON tra_codigomedico= per_codigo

12.

SELECT med_codigo,tra_enfermidade,tra_idingreso FROM medico
INNER JOIN tratamento
ON tra_codigomedico=med_codigo
WHERE tra_enfermidade= "Infarto";

SELECT tra_codigomedico,tra_enfermidade,tra_idingreso FROM tratamento
WHERE tra_enfermidade="Infarto";

13.
SELECT per_nome,tra_enfermidade,ing_nhpaciente FROM medico
LEFT JOIN persoal
ON per_codigo=med_codigo
LEFT JOIN tratamento
ON tra_codigomedico=med_codigo AND tra_enfermidade="Infarto"
LEFT JOIN ingreso
ON tra_idingreso=ing_id


