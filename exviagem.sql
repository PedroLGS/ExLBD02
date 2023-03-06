CREATE DATABASE exviagem

USE exviagem

CREATE TABLE motorista(
codigo		  INT			NOT NULL,
nome          VARCHAR(40)   NOT NULL,
naturalidade  VARCHAR(40)   NOT NULL
PRIMARY KEY(codigo)
)

CREATE TABLE onibus(
placa         CHAR(07)      NOT NULL,
marca         VARCHAR(15)   NOT NULL,
ano           INT           NOT NULL,
descricao     VARCHAR(20)   NOT NULL
PRIMARY KEY(placa)
)

CREATE TABLE viagem(
codigo	      INT           NOT NULL,
onibus        CHAR(07)      NOT NULL,
motorista     INT           NOT NULL,
hora_saida    INT           NOT NULL   CHECK(hora_saida >= 0),
hora_chegada  INT           NOT NULL   CHECK(hora_chegada >= 0),
partida       VARCHAR(40)   NOT NULL,
destino       VARCHAR(40)   NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY(onibus) REFERENCES onibus(placa),
FOREIGN KEY(motorista) REFERENCES motorista(codigo)
)

INSERT INTO motorista VALUES
(12341, 'Julio Cesar', 'S�o Paulo'),
(12342,	'Mario Carmo', 'Americana'),
(12343,	'Lucio Castro', 'Campinas'),
(12344,	'Andr� Figueiredo',	'S�o Paulo'),
(12345,	'Luiz Carlos', 'S�o Paulo'),
(12346,	'Carlos Roberto', 'Campinas'),
(12347,	'Jo�o Paulo', 'S�o Paulo')

INSERT INTO onibus VALUES
('adf0965',	'Mercedes',	2009, 'Leito'),
('bhg7654',	'Mercedes',	2012, 'Sem Banheiro'),
('dtr2093',	'Mercedes',	2017, 'Ar Condicionado'),
('gui7625',	'Volvo', 2014, 'Ar Condicionado'),
('jhy9425',	'Volvo', 2018, 'Leito'),
('lmk7485',	'Mercedes',	2015, 'Ar Condicionado'),
('aqw2374',	'Volvo', 2014, 'Leito')

INSERT INTO viagem VALUES
(101, 'adf0965', 12343,	10,	12,	'S�o Paulo', 'Campinas'),
(102, 'gui7625', 12341,	7,	12,	'S�o Paulo', 'Araraquara'),
(103, 'bhg7654', 12345,	14,	22,	'S�o Paulo', 'Rio de Janeiro'),
(104, 'dtr2093', 12344,	18,	21,	'S�o Paulo', 'Sorocaba'),
(105, 'aqw2374', 12342,	11,	17,	'S�o Paulo', 'Ribeir�o Preto'),
(106, 'jhy9425', 12347,	10,	19,	'S�o Paulo', 'S�o Jos� do Rio Preto'),
(107, 'lmk7485', 12346,	13,	20,	'S�o Paulo', 'Curitiba'),
(108, 'adf0965', 12343,	14,	16,	'Campinas',	'S�o Paulo'),
(109, 'gui7625', 12341,	14,	19,	'Araraquara', 'S�o Paulo'),
(110, 'bhg7654', 12345,	0,	8, 'Rio de Janeiro', 'S�o Paulo'),
(111, 'dtr2093', 12344,	22,	1, 'Sorocaba', 'S�o Paulo'),
(112, 'aqw2374', 12342,	19,	5, 'Ribeir�o Preto', 'S�o Paulo'),
(113, 'jhy9425', 12347,	22,	7,	'S�o Jos� do Rio Preto', 'S�o Paulo'),
(114, 'lmk7485', 12346,	0,	7,	'Curitiba', 'S�o Paulo')

SELECT * FROM onibus
SELECT * FROM motorista
SELECT * FROM viagem

--Exerc�cio:															
--1) Criar um Union das tabelas Motorista e �nibus, com as colunas ID (C�digo e Placa) e Nome (Nome e Marca)															
--2) Criar uma View (Chamada v_motorista_onibus) do Union acima															
--3) Criar uma View (Chamada v_descricao_onibus) que mostre o C�digo da Viagem, o Nome do motorista, a placa do �nibus (Formato XXX-0000), a Marca do �nibus, o Ano do �nibus e a descri��o do onibus															
--4) Criar uma View (Chamada v_descricao_viagem) que mostre o C�digo da viagem, a placa do �nibus(Formato XXX-0000), a Hora da Sa�da da viagem (Formato HH:00), a Hora da Chegada da viagem (Formato HH:00), partida e destino															

SELECT CONVERT(VARCHAR(07), m.codigo) AS codigo, m.nome AS nome
FROM motorista m
UNION 
SELECT o.placa AS placa, o.marca AS marca
FROM onibus o

CREATE VIEW v_motorista_onibus
AS
SELECT CONVERT(VARCHAR(07), m.codigo) AS codigo, m.nome AS nome
FROM motorista m
UNION 
SELECT o.placa AS placa, o.marca AS marca
FROM onibus o

SELECT * FROM v_motorista_onibus

CREATE VIEW v_descricao_onibus
AS
SELECT v.codigo AS codigo_viagem, m.nome AS nome_motorista, 
SUBSTRING(o.placa,1,3)+'-'+
SUBSTRING(o.placa,4,4) AS placa, o.marca, o.ano, o.descricao
FROM onibus o
INNER JOIN viagem v
ON o.placa = v.onibus
INNER JOIN motorista m
ON m.codigo = v.motorista

SELECT * FROM v_descricao_onibus

CREATE VIEW v_descricao_viagem
AS
SELECT v.codigo, 
SUBSTRING(o.placa,1,3)+'-'+
SUBSTRING(o.placa,4,4) AS onibus,
CONVERT(VARCHAR(05), v.hora_saida)+':00' AS hora_saida,
CONVERT(VARCHAR(05), v.hora_chegada)+':00' AS hora_chegada,
v.partida, v.destino
FROM onibus o
INNER JOIN viagem v
ON o.placa = v.onibus
INNER JOIN motorista m
ON m.codigo = v.motorista

SELECT * FROM v_descricao_viagem
