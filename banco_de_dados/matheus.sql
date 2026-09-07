CREATE DATABASE projeto_sprint1_ind;
USE projeto_sprint1_ind;

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    email VARCHAR(100),
    plano TINYINT
);

CREATE TABLE sede (
    endereco VARCHAR(150),
    cidade VARCHAR(60),
    estado VARCHAR(2),
    quantidade_paineis_setor INT
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    acesso TINYINT DEFAULT(1),
    telefone VARCHAR(20)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    ipSensor VARCHAR(50) NOT NULL,
    dataInstalacao DATE,
    dataManutencao DATE,
    statusSensor VARCHAR(20),
    ultimaLeitura DATETIME,
    valorLeitura DECIMAL(10,2)
);

CREATE TABLE setor (
    idSetor INT PRIMARY KEY AUTO_INCREMENT,
    identificador VARCHAR(4) NOT NULL,
    idempresa INT,
    idsensor INT
);

CREATE TABLE painel_solar (
    idPainel INT PRIMARY KEY AUTO_INCREMENT,
    potenciaW DECIMAL(10,2),
	id_empresa INT NOT NULL
);