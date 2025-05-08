CREATE DATABASE GCPJW;
USE GCPJW;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2)
);

CREATE TABLE cliente_produto (
    cliente_id INT,
    produto_id INT,
    PRIMARY KEY (cliente_id, produto_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto(id) ON DELETE CASCADE
);
