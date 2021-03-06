/* Modelagem Básica */
/* ENTIDADE = TABELA */
/* ATRIBUTOS = CAMPOS */
/* REGISTROS = TUPLAS/ LINHAS COMPLETAS */

CLIENTE

NOME - CARACTER (30)
CPF - NUMERICO (11)
EMAIL - CARACTER (30)
TELEFONE - CARACTER (30)
ENDERECO - CARACTER (100)
SEXO - CARACTER (1)

/* PROCESSOS DE MODELAGEM */
/* FASE 01 E FASE 02 - AD - ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */
MODELAGEM FÍSICA - SCRIPTS DE BANCO DE DADOS

/* INICIANDO MODELAGEM FÍSICA */

/* CRIANDO O BD */

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BD */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE (
    NOME VARCHAR(30),
    CPF INT(11),
    EMAIL VARCHAR(30),
    ENDERECO VARCHAR(100),
    TELEFONE VARCHAR(30),
    SEXO CHAR(1)
);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES; /* APENAS MYSQL */

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

/* SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO COLUNAS */

INSERT INTO CLIENTE VALUES ('JOÃO', 988638258, 'JOAO@GMAIL.COM', 
'MAIA LACERDA - ESTACIO - RIO DE JANEIRO-RJ', '(17)96535-2356', 'M');
INSERT INTO CLIENTE VALUES ('CELIA', 547896821, 'CELIA@GMAIL.COM',
 'RIACHUELO - CENTRO - RIO DE JANEIRO-RJ', '(17)98687-69850', 'F');
INSERT INTO CLIENTE VALUES ('JORGE', 682537475, NULL, 
'OSCAR CURY - BOM RETIRO - PATO DE MINAS-MG', '(17)92257-6898', 'M');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE (NOME, CPF, EMAIL, ENDERECO, TELEFONE, SEXO) 
VALUES ('LILIAN', 398654721, 'LILIAN@GMAIL.COM', 
'SENADOR SOARES - TIJUCA - RIO DE JANEIRO-RJ','(21)92568-6585', 'F');

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES ('ANA', 958725419, 'ANA@GMAIL.COM', 'PRES ANTONIO CARLOS - CENTRO - SÃO PAULO-SP', '(11)96854-5274', 'F'),
    ('CARLA', 685745892, 'CARLA@GMAIL.COM', 'SAMULE SILVA - CENTRO - BELO HORIZONTE-MG', '(17)96854-6325', 'F');

/* O COMANDO SELECT */
/* SELEÇÃO, PROJEÇÃO E JUNÇÃO */

/* SELECT - PROJEÇÃO */
SELECT NOW();

SELECT 'JEFERSON LIMA';
SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

/* APENAS PARA FINS ACADÊMICOS */

SELECT * FROM CLIENTE;

/* FILTRANDO DADOS COM WHERE E LIKE */
/* WHERE - SELEÇÃO */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENETE WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE WHERE ENDEECO = 'RJ';

/* UTILIZANDO LIKE */

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'OSCAR CURY%';
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%CENTRO%';

/* OPERADORES LÓGICOS */
/* OR - OU */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LÓGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) AS 'QUANT. REGISTROS' FROM CLIENTES;

/* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*)
FROM CLIENTE GROUP BY SEXO;

/* CASO PERFORMANCE: MELHORA NA PERFORMANCE.
OR - TRAZER PRIMEIRAMENTE OS DADOS COM MAIORES POSSIBILIDADES DE SER VERDADEIROS,
DEIXANDO PRA DEPOIS OS DADOS COM MENORES POSSIBILIDADES.
AND - TRAZER PRIMEIRAMENTE OS DADOS COM MENORES POSSIBILIDADES DE SEREM VERDADEIROS,
DEIXANDO PRA DEPOIS OS COM MAIORES POSSIBILIDADES.*/


/* Filtrando valores nulos */

/* RETORNA OS VALORES NUL0S */
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

/* RETORNA OS VALORES NÃO NUL0S */
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* UTILIZANDO UPDATE PARA ATUALIZAR VALORES NULOS */

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'JORGE@GMAIL.COM';

/* WHERE - VAI SER O SEU MELHOR AMIGO PRA VIDA INTEIRA */

SELECT * FROM CLIENTE
WHERE NOME = 'JOÃO';

UPDATE CLIENTE
SET EMAIL ='JORGE@GMAIL.COM'
WHERE NOME = 'JORGE';

SELECT NOME, EMAIL
FROM CLIENTE;

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

DELETE FROM CLIENTE;

SELECT * FROM CLIENTE WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'ANA';   -- TOTAL DELETADO 

DELETE FROM CLIENTE
WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE;

INSERT INTO CLIENTE VALUES (
    'CARLA', 254789658,'C.LOPES@GMAIL.COM','RUA SEI LÁ - NUM SEI AONDE - LUGAR ALGUM', '(17 98578-3652)', 'F'
);

SELECT * FROM CLIENTE;

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM';

/* CUIDADO AO USAR O OR */
DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM'; -- TRAS TODOS COM PELO MENOS UMA DAS 2 CONDIÇÕES

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM'; -- AND - TRAS APENAS O REGISTRO QUE SATISFAZ AS 2 CONDIÇÕES

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM';

/* MODELAGEM */

/* PRIMEIRA FORMA NORMAL */

/* 
    1 - TODO CAMPO VETORIZADO SE TORNARÁ A OUTRA TABELA
    2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA - QUANDO O CAMPO FOR DIVISÍVEL
    3 - TODA TABELA NECESSITA DE PELO MENOS 1 CAMPO Q IDENTIFIQUE TODO O REGISTRO
    COMO SENDO ÚNICO. CHAVE PRIMARIA - PRIMARY KEY.
*/