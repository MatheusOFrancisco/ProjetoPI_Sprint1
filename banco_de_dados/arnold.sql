CREATE DATABASE monitoramento_solar;
USE monitoramento_solar;
-- =========================================================
-- 1. EMPRESAS
-- Cadastro do cliente (ex: rede de supermercados)
-- =========================================================

CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
 
-- =========================================================
-- 2. INSTALACOES
-- Cada empresa pode ter mais de uma instalação
-- (ex: uma rede de supermercados tem uma instalação por loja)
-- =========================================================

CREATE TABLE instalacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empresa_id INT NOT NULL,
    nome_instalacao VARCHAR(150) NOT NULL,   -- ex: "Loja Tatuapé"
    potencia_instalada_kwp DECIMAL(6,2) NOT NULL,
    regiao VARCHAR(20) NOT NULL,             -- Norte, Nordeste, Centro-Oeste, Sudeste, Sul
    data_instalacao DATE,
 
    
);
-- =========================================================
-- 3. SENSORES
-- Cada instalação tem um (ou mais) sensor de luminosidade
-- (o dispositivo físico: Arduino/ESP32 + sensor)
-- =========================================================
CREATE TABLE sensores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    instalacao_id INT NOT NULL,
    codigo_dispositivo VARCHAR(50) NOT NULL,  -- identificador do ESP32/Arduino
    data_instalacao_sensor DATE,
);
 
 
-- =========================================================
-- 4. LEITURAS_SENSOR
-- Cada medição de irradiância feita pelo sensor de luminosidade
-- =========================================================

CREATE TABLE leituras_sensor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    irradiancia_wm2 DECIMAL(7,2) NOT NULL,   -- irradiância medida em W/m²
    data_hora_leitura DATETIME DEFAULT CURRENT_TIMESTAMP,
);

========================================================
-- 5. ALERTAS
-- Gerado quando o sistema detecta uma perda de eficiência
-- (comparando leituras_sensor esperado x leituras_inversor real)
-- =========================================================
CREATE TABLE alertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    instalacao_id INT NOT NULL,
    tipo_causa_provavel VARCHAR(30) NOT NULL,  -- sujeira, sombreamento, normal
    perda_percentual DECIMAL(5,2) NOT NULL,
    data_hora_alerta DATETIME DEFAULT CURRENT_TIMESTAMP,
 
);
 
 
