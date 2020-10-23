CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, -- OS DADOS (VALORES) DESSE CAMPO IRAM SER PREENCHIDOS AUTOMATICAMENTE
    NOME VARCHAR(30) NOT NULL, -- NOT NULL - NÃO PODE SER VALOR NULOS
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(50) UNIQUE, -- USADO PARA DIZER QUE O DADO RECEBIDO É ÚNICO, NÃO SIGNIFICA QUE ELE TEM QUE SER OBRIGATÓRIO.
    CPF VARCHAR(15) UNIQUE 
);

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

CREATE TABLE ENDERECO(
    IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    NUMERO INT NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(50) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| NUMERO     | int(11)     | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(50) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_CLIENTE INT, 
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

CREATE TABLE PRODUTO (
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PROD VARCHAR(30) NOT NULL,
    VALOR_UNIT FLOAT(8, 2) NOT NULL,
    PESO FLOAT(5, 2) NOT NULL,
    FRETE FLOAT (5, 2) NOT NULL,
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)  
);

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDPRODUTO  | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PROD  | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNIT | float(8,2)  | NO   |     | NULL    |                |
| PESO       | float(5,2)  | NO   |     | NULL    |                |
| FRETE      | float(5,2)  | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | MUL | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');
INSERT INTO CLIENTE VALUES(NULL,'PAULA','F',NULL,'77437493');
INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

+-----------+---------+------+-------------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         |
+-----------+---------+------+-------------------+-------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|         4 | CLARA   | F    | NULL              | 5687766856  |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|         7 | PAULA   | F    | NULL              | 77437493    |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|        10 | GIOVANA | F    | NULL              | 0876655     |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |
|        13 | LORENA  | M    | NULL              | 774557887   |
|        14 | EDUARDO | M    | NULL              | 54376457    |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
+-----------+---------+------+-------------------+-------------+

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA',1234,'CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES',3214,'CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS',1432,'JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA',2134,'ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR',4352,'FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA',1765,'CENTRO','VITORIA','ES',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA',1654,'ALVORADA','NITEROI','RJ',7);
INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES',1987,'CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA',1657,'ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA',1652,'CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA',1765,'COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA',1236,'CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES',1564,'LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES',1254,'CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO',1087,'JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO',1065,'BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA',1769,'LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO',1543,'CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE',1654,'CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE',1654,'CENTRO','RIO DE JANEIRO','RJ',8);

+------------+--------------------+--------+------------+----------------+--------+------------+
| IDENDERECO | RUA                | NUMERO | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+--------+------------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     |   1234 | CENTRO     | B. HORIZONTE   | MG     |          4 |
|          2 | RUA CAPITAO HERMES |   3214 | CENTRO     | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      |   2134 | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     |   4352 | FLAMENGO   | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     |   1765 | CENTRO     | VITORIA        | ES     |          5 |
|          7 | RUA JOAQUIM SILVA  |   1654 | ALVORADA   | NITEROI        | RJ     |          7 |
|          8 | RUA GUEDES         |   1987 | CASCADURA  | B. HORIZONTE   | MG     |          9 |
|          9 | RUA MAIA LACERDA   |   1657 | ESTACIO    | RIO DE JANEIRO | RJ     |         10 |
|         10 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     |         11 |
|         11 | RUA NELSON MANDELA |   1765 | COPACABANA | RIO DE JANEIRO | RJ     |         12 |
|         12 | RUA ARAUJO LIMA    |   1236 | CENTRO     | VITORIA        | ES     |         13 |
|         13 | RUA CASTRO ALVES   |   1564 | LEBLON     | RIO DE JANEIRO | RJ     |         14 |
|         14 | AV CAPITAO ANTUNES |   1254 | CENTRO     | CURITIBA       | PR     |         15 |
|         15 | AV CARLOS BARROSO  |   1087 | JARDINS    | SAO PAULO      | SP     |         16 |
|         16 | ALAMEDA SAMPAIO    |   1065 | BOM RETIRO | CURITIBA       | PR     |         17 |
|         17 | RUA DA LAPA        |   1769 | LAPA       | SAO PAULO      | SP     |         18 |
|         18 | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     |         19 |
|         19 | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     |         20 |
|         20 | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     |          8 |
+------------+--------------------+--------+------------+----------------+--------+------------+

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);

+------------+------+----------+------------+
|          1 | CEL  | 78458743 |          5 |
|          2 | RES  | 56576876 |          5 |
|          3 | CEL  | 87866896 |          1 |
|          4 | COM  | 54768899 |          2 |
|          5 | RES  | 99667587 |          1 |
|          6 | CEL  | 78989765 |          3 |
|          7 | CEL  | 99766676 |          3 |
|          8 | COM  | 66687899 |          1 |
|          9 | RES  | 89986668 |          5 |
|         10 | CEL  | 88687909 |          2 |
|         11 | RES  | 68976565 |          9 |
|         12 | CEL  | 99656675 |          9 |
|         13 | CEL  | 33567765 |         11 |
|         14 | CEL  | 88668786 |         11 |
|         15 | COM  | 55689654 |         11 |
|         16 | COM  | 88687979 |         12 |
|         17 | COM  | 88965676 |         13 |
|         18 | CEL  | 89966809 |         15 |
|         19 | COM  | 88679978 |         16 |
|         20 | CEL  | 99655768 |         17 |
|         21 | RES  | 89955665 |         18 |
|         22 | RES  | 77455786 |         19 |
|         23 | RES  | 89766554 |         19 |
|         24 | RES  | 77755785 |         20 |
|         25 | COM  | 44522578 |         20 |
+------------+------+----------+------------+

/* RELATÓRIO GERAL DE TODOS OS CLIENTES */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
       E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, 
       T.TIPO, T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY C.IDCLIENTE;

+-----------+---------+------+-------------------+-------------+--------------------+--------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | NUMERO | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+-------------+--------------------+--------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      |   2134 | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      |   2134 | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         |   1987 | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         |   1987 | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    | RUA NELSON MANDELA |   1765 | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | LORENA  | F    | NULL              | 774557887   | RUA ARAUJO LIMA    |   1236 | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        15 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    | AV CAPITAO ANTUNES |   1254 | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | AV CARLOS BARROSO  |   1087 | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    | ALAMEDA SAMPAIO    |   1065 | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA DA LAPA        |   1769 | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
+-----------+---------+------+-------------------+-------------+--------------------+--------+------------+----------------+--------+------+----------+

/* RELATÓRIO DE HOMENS */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
       E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, 
       T.TIPO, T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON E.ID_CLIENTE = C.IDCLIENTE
INNER JOIN TELEFONE T
ON T.ID_CLIENTE = C.IDCLIENTE
WHERE SEXO = 'M'
ORDER BY C.IDCLIENTE;

+-----------+---------+------+-------------------+-------------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | IDENDERECO | RUA                | NUMERO | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-------------------+-------------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES |   3214 | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      |   2134 | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     |   1765 | CENTRO     | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         |   1987 | CASCADURA  | B. HORIZONTE   | MG     |          9 |         11 | RES  | 68976565 |          9 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         13 | CEL  | 33567765 |         11 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |         11 | RUA NELSON MANDELA |   1765 | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         16 | COM  | 88687979 |         12 |
|        13 | LORENA  | M    | NULL              | 774557887   |         12 | RUA ARAUJO LIMA    |   1236 | CENTRO     | VITORIA        | ES     |         13 |         17 | COM  | 88965676 |         13 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |         15 | AV CARLOS BARROSO  |   1087 | JARDINS    | SAO PAULO      | SP     |         16 |         19 | COM  | 88679978 |         16 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |         16 | ALAMEDA SAMPAIO    |   1065 | BOM RETIRO | CURITIBA       | PR     |         17 |         20 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         17 | RUA DA LAPA        |   1769 | LAPA       | SAO PAULO      | SP     |         18 |         21 | RES  | 89955665 |         18 |
+-----------+---------+------+-------------------+-------------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+

UPDATE CLIENTE
SET SEXO = 'F' 
WHERE IDCLIENTE IN (11, 12, 13, 17, 18);

+-----------+---------+------+-----------------+-------------+--------------------+--------+-----------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL           | CPF         | RUA                | NUMERO | BAIRRO    | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-----------------+-------------+--------------------+--------+-----------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO    | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO    | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES |   3214 | CENTRO    | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      |   2134 | ESTACIO   | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      |   2134 | ESTACIO   | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO    | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO    | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     |   1765 | CENTRO    | VITORIA        | ES     | RES  | 89986668 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     | RUA GUEDES         |   1987 | CASCADURA | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     | RUA GUEDES         |   1987 | CASCADURA | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        15 | ANTONIO | M    | ANTONIO@IG.COM  | 12436767    | AV CAPITAO ANTUNES |   1254 | CENTRO    | CURITIBA       | PR     | CEL  | 89966809 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM | 3423565     | AV CARLOS BARROSO  |   1087 | JARDINS   | SAO PAULO      | SP     | COM  | 88679978 |
+-----------+---------+------+-----------------+-------------+--------------------+--------+-----------+----------------+--------+------+----------+

/* RELATÓRIO DE MULHERES */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
       E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO, 
       T.TIPO, T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON E.ID_CLIENTE = C.IDCLIENTE
INNER JOIN TELEFONE T
ON T.ID_CLIENTE = C.IDCLIENTE
WHERE SEXO = 'F'
ORDER BY C.IDCLIENTE;

+-----------+---------+------+-------------------+-----------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | IDENDERECO | RUA                | NUMERO | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE | IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+-----------+---------+------+-------------------+-----------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     |          3 |          6 | CEL  | 78989765 |          3 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         13 | CEL  | 33567765 |         11 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  |         11 | RUA NELSON MANDELA |   1765 | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         16 | COM  | 88687979 |         12 |
|        13 | LORENA  | F    | NULL              | 774557887 |         12 | RUA ARAUJO LIMA    |   1236 | CENTRO     | VITORIA        | ES     |         13 |         17 | COM  | 88965676 |         13 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767  |         14 | AV CAPITAO ANTUNES |   1254 | CENTRO     | CURITIBA       | PR     |         15 |         18 | CEL  | 89966809 |         15 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  |         16 | ALAMEDA SAMPAIO    |   1065 | BOM RETIRO | CURITIBA       | PR     |         17 |         20 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 |         17 | RUA DA LAPA        |   1769 | LAPA       | SAO PAULO      | SP     |         18 |         21 | RES  | 89955665 |         18 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         22 | RES  | 77455786 |         19 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         24 | RES  | 77755785 |         20 |
+-----------+---------+------+-------------------+-----------+------------+--------------------+--------+------------+----------------+--------+------------+------------+------+----------+------------+

UPDATE CLIENTE
SET SEXO = 'M' 
WHERE IDCLIENTE = 15;

+-----------+---------+------+-------------------+-----------+--------------------+--------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | RUA                | NUMERO | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+-----------+--------------------+--------+------------+----------------+--------+------+----------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    |   1432 | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | RUA VISCONDESSA    |   1652 | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  | RUA NELSON MANDELA |   1765 | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | LORENA  | F    | NULL              | 774557887 | RUA ARAUJO LIMA    |   1236 | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  | ALAMEDA SAMPAIO    |   1065 | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RUA DA LAPA        |   1769 | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RUA GERONIMO       |   1543 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RUA GOMES FREIRE   |   1654 | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
+-----------+---------+------+-------------------+-----------+--------------------+--------+------------+----------------+--------+------+----------+

/* QUANTIDADE DE HOMENS E MULHERES */

SELECT COUNT(*) AS QTD, SEXO
FROM CLIENTE
GROUP BY SEXO;

+-----+------+
| QTD | SEXO |
+-----+------+
|   9 | M    |
|  11 | F    |
+-----+------+

/* IDS E EMAIL DAS MULHERES QUE MORAM NO CENTRO DO RJ E NÃO TENHAM CELULAR */

SELECT C.IDCLIENTE, C.EMAIL, E.BAIRRO, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
AND E.CIDADE = 'RIO DE JANEIRO' AND E.BAIRRO = 'CENTRO'
AND (T.TIPO = 'RES' OR T.TIPO = 'COM'); 

+-----------+-------------------+--------+---------+------+------+--------+----------------+
| IDCLIENTE | EMAIL             | BAIRRO | NOME    | SEXO | TIPO | BAIRRO | CIDADE         |
+-----------+-------------------+--------+---------+------+------+--------+----------------+
|        11 | KARLA@GMAIL.COM   | CENTRO | KARLA   | F    | COM  | CENTRO | RIO DE JANEIRO |
|        19 | ADRIANA@GMAIL.COM | CENTRO | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
|        19 | ADRIANA@GMAIL.COM | CENTRO | ADRIANA | F    | RES  | CENTRO | RIO DE JANEIRO |
|        20 | JOICE@GMAIL.COM   | CENTRO | JOICE   | F    | RES  | CENTRO | RIO DE JANEIRO |
|        20 | JOICE@GMAIL.COM   | CENTRO | JOICE   | F    | COM  | CENTRO | RIO DE JANEIRO |
+-----------+-------------------+--------+---------+------+------+--------+----------------+

SELECT C.IDCLIENTE, C.EMAIL
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
AND E.CIDADE = 'RIO DE JANEIRO' AND E.BAIRRO = 'CENTRO'
AND (T.TIPO = 'RES' OR T.TIPO = 'COM');

+-----------+-------------------+
| IDCLIENTE | EMAIL             |
+-----------+-------------------+
|        11 | KARLA@GMAIL.COM   |
|        19 | ADRIANA@GMAIL.COM |
|        19 | ADRIANA@GMAIL.COM |
|        20 | JOICE@GMAIL.COM   |
|        20 | JOICE@GMAIL.COM   |
+-----------+-------------------+

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM
NOME, EMAIL E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO
RIO DE JANEIRO VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.TIPO, T.NUMERO, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'RJ' AND T.TIPO = 'CEL';

+--------+-----------------+------+----------+--------+
| NOME   | EMAIL           | TIPO | NUMERO   | ESTADO |
+--------+-----------------+------+----------+--------+
| JOAO   | JOAOA@IG.COM    | CEL  | 87866896 | RJ     |
| CARLOS | CARLOSA@IG.COM  | CEL  | 88687909 | RJ     |
| KARLA  | KARLA@GMAIL.COM | CEL  | 33567765 | RJ     |
| KARLA  | KARLA@GMAIL.COM | CEL  | 88668786 | RJ     |
+--------+-----------------+------+----------+--------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'RJ' AND T.TIPO = 'CEL';

+--------+-----------------+----------+
| NOME   | EMAIL           | CELULAR  |
+--------+-----------------+----------+
| JOAO   | JOAOA@IG.COM    | 87866896 |
| CARLOS | CARLOSA@IG.COM  | 88687909 |
| KARLA  | KARLA@GMAIL.COM | 33567765 |
| KARLA  | KARLA@GMAIL.COM | 88668786 |
+--------+-----------------+----------+

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM 
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.TIPO, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F' AND ESTADO = 'SP' AND TIPO = 'CEL';

+------+------------+------+--------+
| NOME | EMAIL      | TIPO | ESTADO |
+------+------------+------+--------+
| ANA  | ANA@IG.COM | CEL  | SP     |
| ANA  | ANA@IG.COM | CEL  | SP     |
+------+------------+------+--------+

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F' AND ESTADO = 'SP' AND TIPO = 'CEL';

+------+------------+----------+
| NOME | EMAIL      | CELULAR  |
+------+------------+----------+
| ANA  | ANA@IG.COM | 78989765 |
| ANA  | ANA@IG.COM | 99766676 |
+------+------------+----------+

/* NOME, EMAIL, ESTADO, NUMERO */

SELECT C.NOME, IFNULL(C.EMAIL, '***********') AS "E-MAIL", E.ESTADO, T.NUMERO AS TELEFONE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN  TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.IDCLIENTE, C.NOME, IFNULL(C.EMAIL, '***********') AS "E-MAIL", E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY C.IDCLIENTE;

SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL, '************') AS "E-MAIL", 
       T.TIPO, T.NUMERO AS "TELEFONE", 
       E.RUA, E.BAIRRO, E.NUMERO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* VIEW */

CREATE VIEW RELATORIO AS
SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL, '************') AS "E-MAIL", 
       T.TIPO, T.NUMERO AS "TELEFONE", 
       E.RUA, E.BAIRRO, E.NUMERO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT * FROM RELATORIO;

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;

/* INSERINDO PREFIXO */

CREATE VIEW V_RELATORIO AS
SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL, '************') AS "EMAIL", -- NÃO INSERIR SIMBOLOS NO ALIAS.
       T.TIPO, T.NUMERO AS "TELEFONE", 
       E.RUA, E.BAIRRO, E.NUMERO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT NOME, SEXO, EMAIL, ESTADO
FROM V_RELATORIO;

DROP VIEW V_RELATORIO;

/* UPDATE, INSERT E DELETE - DML */

-- INSERT E DELETE NÃO SÃO PERMITIDOS NA VIEW QUE CONTENHAM JOIN, FUNCIONA APENAS SE FOR O CASO DE UMA ÚNICA TABELA

/* É PERMITIDO FAZER UPDATE NA VIEW COM JOIN, PORÉM O VALOR DA TABELA PRIMARIA TBM É AFETADO. */

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT ID_CLIENTE, NUMERO
FROM TELEFONE
ORDER BY 1, 2; -- INDEXAÇÃO POR COLUNAS

SELECT NUMERO
FROM TELEFONE
ORDER BY 1, 2; -- NÃO FUNCIONA, NÃO RECONHECE A SEGUNDA COLUNA NO ENUNCIADO

SELECT NUMERO
FROM TELEFONE
ORDER BY ID_CLIENTE, NUMERO; -- INDEXAÇÃO POR NOME FUNCIONA EM TODOS OS CASOS

/* ORDER BY DESC / ASC */

SELECT * FROM TELEFONE
ORDER BY 4 ASC; -- ASC JÁ É PADRÃO

SELECT * FROM TELEFONE
ORDER BY 4 DESC;

SELECT * FROM TELEFONE
ORDER BY 4, 3 DESC;

SELECT * FROM TELEFONE
ORDER BY 4 DESC, 3 DESC;

/* ORDENANDO COM JOIN */

SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL, '************') AS "EMAIL", -- NÃO INSERIR SIMBOLOS NO ALIAS.
       T.TIPO, T.NUMERO AS "TELEFONE", 
       E.RUA, E.BAIRRO, E.NUMERO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY 1;

SELECT * FROM V_RELATORIO
ORDER BY 1;

/* DELIMITADOR */

/* O DELIMITADOR NATURAL DE CÓDIGO É O ";" */

DELIMITER $ -- ALTERA O DELIMITADOR DO CÓDIGO.

/* STORED PROCEDURES */

DELIMITER $ -- NESTE CASO O DELIMITER É ALTERADO PARA QUE O TODO O BLOCO DE CÓDIGO SEJA EXECUTADO SEM INTERRUPÇÕES POR CONTA DO ";" DENTRO DO ESCOPO DE PROGRAMAÇÃO. 

CREATE PROCEDURE NOME()
BEGIN
       QUALQUER PROGRAMAÇÃO;
END $

CREATE PROCEDURE NOME_CODER()
BEGIN
       SELECT 'JEFERSON' AS CODER;
END $

/* CHAMANDO UMA PROCEDURE */

CALL NOME_CODER $ 

DELIMITER ;

--APAGANDO PROCEDURE
DROP PROCEDURE CODER;

-- PROCEDURE COM PARAMETROS
DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
       SELECT NUMERO1 + NUMERO2;
END $

CALL CONTA(100, 50);

CREATE DATABASE PLAT_CURSOS;

USE PLAT_CURSOS;

CREATE TABLE CURSOS(
       IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
       NOME VARCHAR(40) NOT NULL,
       HORAS INT(3) NOT NULL,
       VALOR FLOAT(5, 2) NOT NULL  
);

INSERT INTO CURSOS (IDCURSO, NOME, HORAS, VALOR)
VALUES (NULL, 'JAVA', 30, 500.00),
       (NULL, 'BD E SQL', 40, 650.00),
       (NULL, 'REACTJS', 45, 700.00);

DELIMITER #

CREATE PROCEDURE CAD_CURSOS(P_NOME VARCHAR(40), P_HORAS INT(3), P_VALOR FLOAT(5, 2))
BEGIN
     INSERT INTO CURSOS VALUES (NULL, P_NOME, P_HORAS, P_VALOR);  
END # 

DELIMITER ;

CALL CAD_CURSOS('JAVASCRIPT', 50, 250.00);
CALL CAD_CURSOS('PYTHON', 67, 370.00);
CALL CAD_CURSOS('MACHINE LEARNING', 70, 850.00);
CALL CAD_CURSOS('GO', 46, 455.00);
CALL CAD_CURSOS('POWER BI', 70, 950.90);
CALL CAD_CURSOS('NODEJS', 35, 370.00);
CALL CAD_CURSOS('REACTJS', 90, 990.00);
CALL CAD_CURSOS('REACT NATIVE', 80, 780.00);

DELIMITER #

CREATE PROCEDURE VER_CURSOS()
BEGIN
       SELECT IDCURSO, NOME, HORAS, VALOR FROM CURSOS;
END #

DELIMITER ;

/* FUNÇÕES DE AGREGAÇÃO NUMÉRICAS */

CREATE TABLE VENDEDORES(
       IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
       NOME VARCHAR (30),
       SEXO CHAR(1),
       JANEIRO FLOAT(8, 2),
       FEVEREIRO FLOAT(8, 2),
       MARCO FLOAT(8, 2)    
);

INSERT INTO VENDEDORES (IDVENDEDOR, NOME, SEXO, JANEIRO, FEVEREIRO, MARCO)
VALUES (NULL, 'CARLOS', 'M', 2345.87, 3456.45, 2876.45),
       (NULL, 'JOAQUIM', 'M', 1345.87, 4567.45, 3456.45),
       (NULL, 'ANA', 'F', 3452.87, 2456.45, 3567.45),
       (NULL, 'LAURA', 'F', 3567.87, 6543.45, 2654.45),
       (NULL, 'KARINA', 'F', 1876.87, 5434.45, 3876.45),
       (NULL, 'MARCOS', 'M', 3456.87, 2543.45, 2654.45),
       (NULL, 'JANAINA', 'F', 3654.87, 3241.45, 2987.45),
       (NULL, 'RONALDO', 'M', 4532.87, 1543.45, 3453.45);

/* MAX - TRAZ O VALOR MÁXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */

SELECT MIN(FEVEREIRO) AS MENOR_FEV
FROM VENDEDORES;

/* AVG - TRAZ O VALOR MÉDIO DE UMA COLUNA */

SELECT AVG(FEVEREIRO) AS MÉDIA_FEV
FROM VENDEDORES;

/* TRUNCATE */

SELECT MIN(JANEIRO) AS MIN_JAN,
       MAX(JANEIRO) AS MAX_JAN,
       TRUNCATE(AVG(JANEIRO), 2) AS MEDIA_JAN
FROM VENDEDORES;

/* AGREGAÇÃO COM SUM() */

SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

SELECT SUM(JANEIRO) AS TOTAL_JAN,
       SUM(FEVEREIRO) AS TOTAL_FEV,
       SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

SELECT SEXO, SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES
GROUP BY SEXO;