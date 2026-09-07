-- BD PI - Projeto Cellara -
CREATE DATABASE cellara;
USE cellara;
-- TABLES
CREATE TABLE empresa (
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(50) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email_empresa VARCHAR(50),
    CONSTRAINT chk_email_empresa CHECK(email_empresa LIKE('%@%','%.%')),
    dt_cadastro DATE DEFAULT CURRENT_TIMESTAMP,
    ativo TINYINT DEFAULT 1 -- -1: INATIVO / 0: PENDENTE / 1: ATIVO
);
CREATE TABLE contrato (
	id_contrato INT PRIMARY KEY AUTO_INCREMENT,
    contratante VARCHAR(100) NOT NULL,
    dt_contrato DATETIME DEFAULT CURRENT_TIMESTAMP,
    plano VARCHAR(10), -- FIXO, MANUTENÇÂO, RECORRENTE
    CONSTRAINT chk_plano CHECK(plano IN('fixo', 'manutenção', 'recorrente')),
    id_empresa INT NOT NULL
);

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(40) NOT NULL,
    sobrenome_usuario VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT chk_email CHECK(email LIKE('%@%', '%.%')),
    senha VARCHAR(50),
    phone VARCHAR(15),
    permissao TINYINT DEFAULT 1, -- 3: Permissão total (+Solicitações) / 2: Downloads e Visualização / 1: Apenas Visualização / 0: Sem permissões
    id_empresa INT NOT NULL
);

CREATE TABLE sensor (
	id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    ip VARCHAR(10),
    setor TINYINT NOT NULL,
    dt_instalacao DATETIME NOT NULL,
    dt_manutencao DATETIME,
    id_empresa INT NOT NULL
);
CREATE TABLE medicao_ldr (
	id_medicao_ldr INT PRIMARY KEY AUTO_INCREMENT,
    lux_percent DECIMAL(5,2),
    dt_medicao_ldr DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_sensor INT NOT NULL
);
CREATE TABLE painel (
	id_painel INT PRIMARY KEY AUTO_INCREMENT,
    geracao_max DECIMAL (5,2),
    id_sensor INT NOT NULL
);

CREATE TABLE medicao_painel (
	id_medicao_painel INT PRIMARY KEY AUTO_INCREMENT,
	tensao_medida DECIMAL (5,2),
    corrente_medida DECIMAL (5,2),
    dt_medicao_painel DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_painel INT NOT NULL
);

-- INSERTS
INSERT INTO empresa (nome_empresa, cnpj, email_empresa, ativo) VALUES
('SPTECH','12345678901234','sptech@sptech.school', 1),
('Claro','09876543212345', 'claro@solar.com', 0),
('Natura','01928374657483', 'natura@natural.com', 0);

INSERT INTO usuario (nome_usuario, sobrenome_usuario, email, senha, id_empresa) VALUES
('Fernanda', 'Caramico', 'fernanda.caramico@sptech.school','SPTECH@pi10!',1),
('Clara', 'Faria','clara.faria@sptech.school', 'SPTECH@123sennha',1),
('Isabela', 'Noronha', 'isabela.noronha@sptech.school', 'SpTeCh@100%',1),
('Claro','CEO','ceo@claro.com', 'Claro!512'),
('Natura','CEO','ceo@natura.com','N@tur4CEO');

INSERT INTO contrato (contratante, plano, id_empresa) VALUES
('Fernanda Caramico', 'recorrente', 1);

