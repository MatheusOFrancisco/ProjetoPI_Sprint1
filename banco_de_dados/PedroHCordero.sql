create database Cellara;

CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    endereco VARCHAR(150),
    cidade VARCHAR(60),
    estado CHAR(2),
    data_cadastro DATE 
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_admissao DATE DEFAULT CURRENT_TIMESTAMP,
    empresa_nome VARCHAR(100)
);

CREATE TABLE sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(30) NOT NULL,
    modelo VARCHAR(60),
    localizacao VARCHAR(100),
    unidade_medida VARCHAR(20) DEFAULT 'lux',
    Status_Sensor VARCHAR(20) NOT NULL,
    data_instalacao DATE
    constraint CkSensor CHECK (Status_Sensor IN ('ativo', 'inativo', 'manutenção'))
);

CREATE TABLE dados_sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_codigo VARCHAR(30),
    valor_luminosidade DECIMAL(10,2) NOT NULL,
    unidade_medida VARCHAR(20) DEFAULT 'lux',
    data_hora_leitura DATETIME DEFAULT CURRENT_TIMESTAMP,
    condicao_climatica VARCHAR(50)
);