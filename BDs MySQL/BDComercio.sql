CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, -- OS DADOS (VALORES) DESSE CAMPO IRAM SER PREENCHIDOS AUTOMATICAMENTE
    NOME VARCHAR(30) NOT NULL, -- NOT NULL - NÃO PODE SER VALOR NULOS
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(50) UNIQUE, -- USADO PARA DIZER QUE O DADO RECEBIDO É ÚNICO, NÃO SIGNIFICA QUE ELE TEM QUE SER OBRIGATÓRIO.
    CPF VARCHAR(15) UNIQUE 
);

DROP TABLE CLIENTE; -- APAGA A TABELA

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

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    ID_CLIENTE INT, 
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

DESC CLIENTE; -- VERIFICAR OS ATRIBUTOS DENTRO DE UMA ENTIDADE E SEUS RESPECTIVOS DETALHES

/* ENDERECO - OBRIGATORIO - CADASTRO SOMENTE 1

TELEFONE - NÃO OBRIGATÓRIO - CADASTRO DE MAIS DE 1 (OPCIONAL)

*/

/* CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA QUE VAI
ATÉ A OUTRA TABELA PARA FAZER REFERÊNCIA DE REGISTROS */

/* EM RELACIONAMENTO 1X1 A CHAVE ESTRANGEIRA (FK) FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1XN A CHAVE ESTRANGEIRA FICARÁ SEMPRE NA CARDINALIDADE N */

/* INSERINDO DADOS AOS ATRIBUTOS DA ENTIDADE CLIENTE */

DESC CLIENTE;

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'JOÃO', 'M', 'JOÃO@GMAIL.COM', '654.456.456-56'
);
INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'CARLOS', 'M', 'CARLOS@GMAIL.COM', '457.254.856-52'
);
INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '528.578.358-85'
);
INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'CLARA', 'F', NULL, '985.356.854-12'
);
INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'JORGE', 'F', 'JORGE@GMAIL.COM', '256.485.589-56'
);
INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES (
    NULL, 'JOAQUIM', 'M', 'JOAQUIM@GMAIL.COM', '652.587.235-57'
);

SELECT * FROM CLIENTE;

UPDATE CLIENTE  -- ALTERANDO UM DADO DENTRO DA ENTIDADE
SET SEXO ='M'
WHERE NOME = 'JORGE';

SELECT* FROM CLIENTE;

+-----------+---------+------+-------------------+----------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF            |
+-----------+---------+------+-------------------+----------------+
|         1 | JOÃO    | M    | JOÃO@GMAIL.COM    | 654.456.456-56 |
|         2 | CARLOS  | M    | CARLOS@GMAIL.COM  | 457.254.856-52 |
|         3 | ANA     | F    | ANA@GMAIL.COM     | 528.578.358-85 |
|         4 | CLARA   | F    | NULL              | 985.356.854-12 |
|         5 | JORGE   | M    | JORGE@GMAIL.COM   | 256.485.589-56 |
|         6 | VERA    | F    | VERA@GMAIL.COM    | 356.456.369-58 |
|         7 | JOAQUIM | M    | JOAQUIM@GMAIL.COM | 652.587.235-57 |
+-----------+---------+------+-------------------+----------------+

/* INSERINDO DADOS NOS ATRIBUTOS DA TABELA ENDERECO */

DESC ENDERECO;

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

INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA 1', 1234, 'JD. DAS FLORES', 'BEBEDOURO', 'SP', 2
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA 2', 1658, 'CENTRO', 'MATÃO', 'SP', 1
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA 1', 2589, 'JD. EXPLANADA', 'BEBEDOURO', 'SP', 4 
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA 5', 1456, 'CENTRO', 'BELO HORIZONTE', 'MG', 6
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA TRÊS', 1986, 'COPACABANA', 'RIO DE JANEIRO', 'RJ', 7
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA 10', 1689, 'VILA MARIA', 'SÃO PAULO', 'SP', 3
);
INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (
    NULL, 'RUA DEZESSETE', 1234, 'MOEMA', 'SÃO PAULO', 'SP', 5
);

+------------+---------------+--------+----------------+----------------+--------+------------+
| IDENDERECO | RUA           | NUMERO | BAIRRO         | CIDADE         | ESTADO | ID_CLIENTE |
+------------+---------------+--------+----------------+----------------+--------+------------+
|          1 | RUA 1         |   1234 | JD. DAS FLORES | BEBEDOURO      | SP     |          2 |
|          2 | RUA 2         |   1658 | CENTRO         | MATÃO          | SP     |          1 |
|          3 | RUA 1         |   2589 | JD. EXPLANADA  | BEBEDOURO      | SP     |          4 |
|          4 | RUA 5         |   1456 | CENTRO         | BELO HORIZONTE | MG     |          6 |
|          5 | RUA TRÊS      |   1986 | COPACABANA     | RIO DE JANEIRO | RJ     |          7 |
|          6 | RUA 10        |   1689 | VILA MARIA     | SÃO PAULO      | SP     |          3 |
|          7 | RUA DEZESSETE |   1234 | MOEMA          | SÃO PAULO      | SP     |          5 |
+------------+---------------+--------+----------------+----------------+--------+------------+

/* INSERINDO DADOS NOS ATRIBUTOS DA ENTIDADE TELEFONE */

SELECT IDCLIENTE, NOME FROM CLIENTE;

/* É NECESSÁRIA A PROJEÇÃO DOS DADOS ID E NOME DO CLIENTE PARA USAR O ID NO ATRIBUTO ID_CLIENTE */
+-----------+---------+
| IDCLIENTE | NOME    |
+-----------+---------+
|         1 | JOÃO    |
|         2 | CARLOS  |
|         3 | ANA     |
|         4 | CLARA   |
|         5 | JORGE   |
|         6 | VERA    |
|         7 | JOAQUIM |
+-----------+---------+

DESC TELEFONE;

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'CEL', '99999-9999', 4
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'RES', '3333-3333', 4
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'COM', '5555-9999', 2
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'CEL', '99999-4444', 3
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'RES', '8888-9999', 3
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'CEL', '99999-3333', 4
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'COM', '1234-9999', 5
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'RES', '3456-9999', 7
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'CEL', '99999-2222', 7
);
INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) VALUES (
    NULL, 'CEL', '99999-7890', 5
);

SELECT * FROM TELEFONE;

+------------+------+------------+------------+
| IDTELEFONE | TIPO | NUMERO     | ID_CLIENTE |
+------------+------+------------+------------+
|          1 | CEL  | 99999-9999 |          4 |
|          2 | RES  | 3333-3333  |          4 |
|          3 | COM  | 5555-9999  |          2 |
|          4 | CEL  | 99999-4444 |          3 |
|          5 | RES  | 8888-9999  |          3 |
|          6 | CEL  | 99999-3333 |          4 |
|          7 | COM  | 1234-9999  |          5 |
|          8 | RES  | 3456-9999  |          7 |
|          9 | CEL  | 99999-2222 |          7 |
|         10 | CEL  | 99999-7890 |          5 |
+------------+------+------------+------------+

/* Seleção, Projeção e Junção */

/* PROJEÇÃO -> É tudo que você quer ver na tela */

SELECT NOW() AS DATA_ATUAL;

SELECT * FROM CLIENTE;

SELECT 2 + 2 AS SOMA;

SELECT 2 +2 AS SOMA, NOME, NOW() FROM CLIENTE;

/* SELEÇÃO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE UMA SELEÇÃO É O WHERE 
 */

SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELEÇÃO */

SELECT NUMERO, TIPO
FROM TELEFONE
WHERE TIPO = 'CEL';

/* JUNÇÃO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+---------+-------------------+-----------+
| NOME    | EMAIL             | IDCLIENTE |
+---------+-------------------+-----------+
| JOÃO    | JOÃO@GMAIL.COM    |         1 |
| CARLOS  | CARLOS@GMAIL.COM  |         2 |
| ANA     | ANA@GMAIL.COM     |         3 |
| CLARA   | NULL              |         4 |
| JORGE   | JORGE@GMAIL.COM   |         5 |
| VERA    | VERA@GMAIL.COM    |         6 |
| JOAQUIM | JOAQUIM@GMAIL.COM |         7 |
+---------+-------------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+------------+----------------+----------------+
| ID_CLIENTE | BAIRRO         | CIDADE         |
+------------+----------------+----------------+
|          2 | JD. DAS FLORES | BEBEDOURO      |
|          1 | CENTRO         | MATÃO          |
|          4 | JD. EXPLANADA  | BEBEDOURO      |
|          6 | CENTRO         | BELO HORIZONTE |
|          7 | COPACABANA     | RIO DE JANEIRO |
|          3 | VILA MARIA     | SÃO PAULO      |
|          5 | MOEMA          | SÃO PAULO      |
+------------+----------------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

-- NUNCA FAZER ISSO !!!!
SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE, ENDERECO /* ORIGEM */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNÇÃO */

+---------+------+----------------+----------------+
| NOME    | SEXO | BAIRRO         | CIDADE         |
+---------+------+----------------+----------------+
| JOÃO    | M    | CENTRO         | MATÃO          |
| CARLOS  | M    | JD. DAS FLORES | BEBEDOURO      |
| ANA     | F    | VILA MARIA     | SÃO PAULO      |
| CLARA   | F    | JD. EXPLANADA  | BEBEDOURO      |
| JORGE   | M    | MOEMA          | SÃO PAULO      |
| VERA    | F    | CENTRO         | BELO HORIZONTE |
| JOAQUIM | M    | COPACABANA     | RIO DE JANEIRO |
+---------+------+----------------+----------------+

/* WHERE = SELEÇÃO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE AND SEXO = 'F';

+-------+------+---------------+----------------+
| NOME  | SEXO | BAIRRO        | CIDADE         |
+-------+------+---------------+----------------+
| ANA   | F    | VILA MARIA    | SÃO PAULO      |
| CLARA | F    | JD. EXPLANADA | BEBEDOURO      |
| VERA  | F    | CENTRO        | BELO HORIZONTE |
+-------+------+---------------+----------------+

/* WHERE IDCLIENTE = ID_CLIENTE AND SEXO = 'F'; -> TABELA VERDADE */

/* JUNÇÃ0 */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO ON IDCLIENTE = ID_CLIENTE;

+---------+------+----------------+----------------+
| NOME    | SEXO | BAIRRO         | CIDADE         |
+---------+------+----------------+----------------+
| JOÃO    | M    | CENTRO         | MATÃO          |
| CARLOS  | M    | JD. DAS FLORES | BEBEDOURO      |
| ANA     | F    | VILA MARIA     | SÃO PAULO      |
| CLARA   | F    | JD. EXPLANADA  | BEBEDOURO      |
| JORGE   | M    | MOEMA          | SÃO PAULO      |
| VERA    | F    | CENTRO         | BELO HORIZONTE |
| JOAQUIM | M    | COPACABANA     | RIO DE JANEIRO |
+---------+------+----------------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE --PROJEÇÃO
FROM CLIENTE   -- ORIGEM
    INNER JOIN ENDERECO  --JUNÇÃO
    ON IDCLIENTE = ID_CLIENTE  -- CONDIÇÃO DA JUNÇÃO
WHERE SEXO = 'F';   -- SELEÇÃO

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
    INNER JOIN TELEFONE 
    ON IDCLIENTE = ID_CLIENTE;

+---------+------+-------------------+------+------------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO     |
+---------+------+-------------------+------+------------+
| CLARA   | F    | NULL              | CEL  | 99999-9999 |
| CLARA   | F    | NULL              | RES  | 3333-3333  |
| CARLOS  | M    | CARLOS@GMAIL.COM  | COM  | 5555-9999  |
| ANA     | F    | ANA@GMAIL.COM     | CEL  | 99999-4444 |
| ANA     | F    | ANA@GMAIL.COM     | RES  | 8888-9999  |
| CLARA   | F    | NULL              | CEL  | 99999-3333 |
| JORGE   | M    | JORGE@GMAIL.COM   | COM  | 1234-9999  |
| JOAQUIM | M    | JOAQUIM@GMAIL.COM | RES  | 3456-9999  |
| JOAQUIM | M    | JOAQUIM@GMAIL.COM | CEL  | 99999-2222 |
| JORGE   | M    | JORGE@GMAIL.COM   | CEL  | 99999-7890 |
+---------+------+-------------------+------+------------+    

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+------+----------------+----------------+------+------------+
| NOME    | SEXO | BAIRRO         | CIDADE         | TIPO | NUMERO     |
+---------+------+----------------+----------------+------+------------+
| CLARA   | F    | JD. EXPLANADA  | BEBEDOURO      | CEL  | 99999-9999 |
| CLARA   | F    | JD. EXPLANADA  | BEBEDOURO      | RES  | 3333-3333  |
| CARLOS  | M    | JD. DAS FLORES | BEBEDOURO      | COM  | 5555-9999  |
| ANA     | F    | VILA MARIA     | SÃO PAULO      | CEL  | 99999-4444 |
| ANA     | F    | VILA MARIA     | SÃO PAULO      | RES  | 8888-9999  |
| CLARA   | F    | JD. EXPLANADA  | BEBEDOURO      | CEL  | 99999-3333 |
| JORGE   | M    | MOEMA          | SÃO PAULO      | COM  | 1234-9999  |
| JOAQUIM | M    | COPACABANA     | RIO DE JANEIRO | RES  | 3456-9999  |
| JOAQUIM | M    | COPACABANA     | RIO DE JANEIRO | CEL  | 99999-2222 |
| JORGE   | M    | MOEMA          | SÃO PAULO      | CEL  | 99999-7890 |
+---------+------+----------------+----------------+------+------------+

/* PONTERAMENTO */
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
 
 /*
    DML - DATA MANIPULATION LANGUAGE - MANIPULAÇÃO DE DADOS
    DDL - DATA DEFINITION LANGUAGE - DEFINIÇÃO (TIPO) DE DADOS
    DCL - DATA CONTROL LANGUAGE - CONTROLE DE ACESSO AOS DADOS
    TCL - TRANSACTION CONTROL LANGUAGE - CONTROLE DE TRANSAÇÃO
 */

 /* DML */

 -- INSERT 

INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) 
VALUES (NULL, 'MARTA', 'M', NULL, '356.484.589-76');

SELECT * FROM CLIENTE;

INSERT INTO ENDERECO (IDENDERECO, RUA, NUMERO, BAIRRO, CIDADE, ESTADO, ID_CLIENTE)
VALUES (NULL, 'RUA 15', 1056, 'CENTRO', 'JARDINÓPOLIS', 'SP', 9);

INSERT INTO TELEFONE (IDTELEFONE, TIPO, NUMERO, ID_CLIENTE) 
VALUES (NULL, 'RES', '3333-7890', 9);

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 9;

UPDATE CLIENTE
SET SEXO ='F'
WHERE IDCLIENTE = 9;

/* DELETE */

INSERT INTO CLIENTE (IDCLIENTE, NOME, SEXO, EMAIL, CPF) 
VALUES (NULL, 'XXXXX', 'M', NULL, 'XXXXXXXXXXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 10;

DELETE FROM CLIENTE
WHERE IDCLIENTE = 10;

/* DDL */

CREATE TABLE PRODUTO (
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR(30) NOT NULL,
    PRECO INT,
    FRETE FLOAT (10, 2) NOT NULL  
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNIT INT NOT NULL;

DESC PRODUTO;

+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNIT   | int(11)     | NO   |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNIT VALOR_UNIT FLOAT(10, 2) NOT NULL; -- NÃO É A MELHOR FORMA PARA ALTERAR TIPOS

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNIT FLOAT(10, 2) NOT NULL;

+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNIT   | float(10,2) | NO   |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10, 2) NOT NULL;

/* APAGANDO COLUNA - DROPANDO */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA EM ORDEM ESPECÍFICA - APENAS MYSQL */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10, 2) NOT NULL
AFTER VALOR_UNIT;

/* COLOCANDO COMO PRIMEIRA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10, 2) NOT NULL 
FIRST;

ALTER TABLE PRODUTO
MODIFY VALOR_UNIT FLOAT(8, 2) NOT NULL;

ALTER TABLE PRODUTO
MODIFY PESO FLOAT(5, 2) NOT NULL;

ALTER TABLE PRODUTO
MODIFY FRETE FLOAT(5, 2) NOT NULL;

ALTER TABLE PRODUTO
ADD COLUMN ID_CLIENTE INT,
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);