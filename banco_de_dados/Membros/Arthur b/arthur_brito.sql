

CREATE DATABASE Cellara;
USE Cellara;


CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ativo TINYINT DEFAULT 1  -- 0: INATIVO / 1: ATIVO
);


CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nivel_permissao TINYINT DEFAULT 1,  -- 1: Vizualizador / 2: Administrador
    dt_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chkEmail CHECK(email LIKE '%@%.%'),
    CONSTRAINT chkNivelPermissao CHECK(nivel_permissao IN (1, 2))
);




CREATE TABLE sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_setor VARCHAR(50) NOT NULL,
    dt_instalacao DATE NOT NULL,
    status_sensor TINYINT DEFAULT 1,  -- 0: INATIVO / 1: ATIVO
    CONSTRAINT chkStatusSensor CHECK(status_sensor IN (0, 1))
);


CREATE TABLE setor (
id_setor INT PRIMARY KEY AUTO_INCREMENT,
nome_setor VARCHAR(7) NOT NULL,
id_empresa INT NOT NULL, 
id_sensor INT NOT NULL
);


CREATE TABLE leitura_sensor(
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_sensor INT NOT NULL,             
    dt_leitura DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    valor INT NOT NULL
);

CREATE TABLE painel(
id_painel INT PRIMARY KEY AUTO_INCREMENT,
id_emrpesa INT NOT NULL,
id_setor INT NOT NULL,
potencia_W DECIMAL (7,2)
);
SHOW TABLES;

