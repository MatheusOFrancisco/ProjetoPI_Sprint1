CREATE DATABASE monitoramento_solar;
USE monitoramento_solar;


-- cadastro das empresas clientes 

CREATE TABLE empresa_cliente (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(60) NOT NULL,
    cnpj VARCHAR(20),
    cidade VARCHAR(40),
    estado CHAR(2),
    email_contato VARCHAR(60),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO empresa_cliente (nome_empresa, cnpj, cidade, estado, email_contato) VALUES
('Caramicol Alimentos S.A.', '11.222.333/0001-44', 'Sao Paulo', 'SP', 'contato@caramicol.com.br'),
('Industrias Grao-Para', '22.333.444/0001-55', 'Belem', 'PA', 'contato@metalgraopara.com.br'),
('Industrias Vale Verde', '33.444.555/0001-66', 'Uberlandia', 'MG', 'contato@valeverde.com.br');


-- placas solares de cada empresa cliente 

CREATE TABLE placa_solar (
    id_placa INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    codigo_placa VARCHAR(20),
    potencia_nominal_w DECIMAL(6,2) DEFAULT 550.00,
    local_instalacao VARCHAR(60),
    data_instalacao DATE
);

INSERT INTO placa_solar (id_empresa, codigo_placa, local_instalacao, data_instalacao) VALUES
(1, 'CAR-001', 'Telhado - Fabrica SP', '2025-02-10'),
(1, 'CAR-002', 'Telhado - Fabrica SP', '2025-02-10'),
(2, 'MGP-001', 'Patio - Unidade Belem', '2024-11-05'),
(2, 'MGP-002', 'Patio - Unidade Belem', '2024-11-05'),
(3, 'VVD-001', 'Cobertura - Centro de Distribuicao', '2025-06-20');


-- sensores de luminosidade, cada placa tem 2

CREATE TABLE sensor_luminosidade (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    id_placa INT,
    tipo_sensor VARCHAR(15),
    modelo VARCHAR(40),
    status VARCHAR(20) DEFAULT 'ativo',
    CONSTRAINT chk_tipo_sensor CHECK (tipo_sensor IN ('referencia', 'exposto')),
    CONSTRAINT chk_status_sensor CHECK (status IN ('ativo', 'inativo', 'manutencao'))
);

INSERT INTO sensor_luminosidade (id_placa, tipo_sensor, modelo, status) VALUES
(1, 'referencia', 'LDR-100', 'ativo'),
(1, 'exposto', 'LDR-100', 'ativo'),
(2, 'referencia', 'LDR-100', 'ativo'),
(2, 'exposto', 'LDR-100', 'ativo'),
(3, 'referencia', 'LDR-100', 'ativo'),
(3, 'exposto', 'LDR-100', 'manutencao');


-- leituras de luminosidade o sensor transmite a leitura já em porcentagem 

CREATE TABLE leitura_luminosidade (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor INT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    luminosidade_percentual DECIMAL(5,2),
    CONSTRAINT chk_percentual CHECK (luminosidade_percentual BETWEEN 0 AND 100)
);

INSERT INTO leitura_luminosidade (id_sensor, data_hora, luminosidade_percentual) VALUES
(1, '2026-08-01 12:00:00', 98.50),
(2, '2026-08-01 12:00:00', 81.20),
(3, '2026-08-01 12:00:00', 97.80),
(4, '2026-08-01 12:00:00', 90.10),
(5, '2026-08-01 12:00:00', 96.00),
(6, '2026-08-01 12:00:00', 70.40);


-- TABELA 5: geração de energia de cada placa dado que vem do inversor


CREATE TABLE leitura_geracao (
    id_geracao INT PRIMARY KEY AUTO_INCREMENT,
    id_placa INT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    geracao_real_kwh DECIMAL(10,2),
    geracao_potencial_kwh DECIMAL(10,2)
);

INSERT INTO leitura_geracao (id_placa, data_hora, geracao_real_kwh, geracao_potencial_kwh) VALUES
(1, '2026-08-01 12:00:00', 2.65, 2.75),
(2, '2026-08-01 12:00:00', 2.20, 2.75),
(3, '2026-08-01 12:00:00', 2.70, 2.75),
(4, '2026-08-01 12:00:00', 2.45, 2.75),
(5, '2026-08-01 12:00:00', 2.68, 2.75);


SELECT * FROM empresa_cliente;
SELECT * FROM placa_solar;
SELECT * FROM sensor_luminosidade;
SELECT * FROM leitura_luminosidade;
SELECT * FROM leitura_geracao;


-- Dados da empresa cliente

SELECT * FROM empresa_cliente   WHERE nome_empresa = 'Caramicol Alimentos S.A.';

-- Placas que pertencem a essa empresa

SELECT * FROM placa_sola  WHERE nome_empresa = 'Caramicol Alimentos S.A.';

-- Sensores instalados nessas placas 

SELECT * FROM sensor_luminosidade WHERE id_placa IN (1, 2);

-- Leituras de luminosidade desses sensores 

SELECT * FROM leitura_luminosidade WHERE id_sensor IN (1, 2, 3, 4);

-- Geração de energia dessas placas

SELECT * FROM leitura_geracao WHERE id_placa IN (1, 2);

