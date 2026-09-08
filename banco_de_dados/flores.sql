-- 1. Criação da tabela EMPRESA
CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

-- 2. Criação da tabela SEDE
CREATE TABLE sede (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10),
    cep VARCHAR(9) NOT NULL,
    complemento VARCHAR(50),
    qnt_paineis INT DEFAULT 0,
    id_empresa INT NOT NULL
);

-- 3. Criação da tabela USUARIO
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    senha VARCHAR(255) NOT NULL,
    nivel_permissao VARCHAR(20) NOT NULL,
    id_empresa INT NOT NULL
);

-- 4. Criação da tabela CONTRATO
CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    id_usuario INT NOT NULL,
    id_sede INT NOT NULL,
    dt_contrato DATE NOT NULL,
    tipo_de_contrato VARCHAR(50) NOT NULL,
    dt_final_contrato DATE
);

-- 5. Criação da tabela SENSOR
CREATE TABLE sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    setor VARCHAR(50) NOT NULL,
    ip_sensor VARCHAR(45),
    dt_instalacao DATE NOT NULL,
    dt_manutencao DATE,
    status_sensor VARCHAR(20) DEFAULT 'Ativo',
    id_empresa INT NOT NULL,
    id_sede INT NOT NULL
);

-- 6. Criação da tabela PAINEL
CREATE TABLE painel (
    id_painel INT AUTO_INCREMENT PRIMARY KEY,
    potencia DECIMAL(10, 2) NOT NULL,
    id_sensor INT NOT NULL
);

-- 7. Criação da tabela MEDICAO_SENSOR
CREATE TABLE medicao_sensor (
    id_medicao_sensor INT AUTO_INCREMENT PRIMARY KEY,
    result_medicao DECIMAL(10, 2) NOT NULL,
    dt_hr_medicao DATETIME NOT NULL,
    id_sensor INT NOT NULL
);

-- 8. Criação da tabela MEDICAO_PAINEL
CREATE TABLE medicao_painel (
    id_medicao_painel INT AUTO_INCREMENT PRIMARY KEY,
    qnt_energia_gerada DECIMAL(10, 2) NOT NULL,
    dt_medicao DATETIME NOT NULL,
    id_painel INT NOT NULL
);

-- 9. Criação da tabela ALERTA
CREATE TABLE alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    dt_alerta DATETIME NOT NULL,
    id_sensor INT NOT NULL
);