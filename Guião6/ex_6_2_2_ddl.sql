CREATE SCHEMA stock;
GO

CREATE TABLE stock.tipo_fornecedor(
	id INT NOT NULL,
	designacao	VARCHAR(20),
	PRIMARY KEY(id),
	UNIQUE(id),
);

CREATE TABLE stock.fornecedor(
	nif INT NOT NULL CHECK(nif> 0),	
	nome VARCHAR(15),
	fax INT,	
	endereco VARCHAR(40),
	cond_pagamento VARCHAR(100),
	tipo_fornecedor INT,
	PRIMARY KEY(nif),
	UNIQUE(nif),
	FOREIGN KEY(tipo_fornecedor) REFERENCES stock.tipo_fornecedor(id)
);

CREATE TABLE stock.produto(
	codigo INT NOT NULL CHECK(codigo> 0),	
	nome VARCHAR(30) NOT NULL,
	preco SMALLMONEY NOT NULL CHECK(preco> 0),	
	taxa_iva INT DEFAULT 23,
	stock INT CHECK(unidades> 0),
	PRIMARY KEY(codigo),
	UNIQUE(codigo)
);

CREATE TABLE stock.encomenda(
	numero INT NOT NULL CHECK(numero> 0),	
	data_encomenda DATE,
	fornecedor INT,
	produto INT,
	num_itens INT CHECK(num_itens> 0),
	PRIMARY KEY(numero),
	UNIQUE(numero),
	FOREIGN KEY(fornecedor) REFERENCES stock.fornecedor(nif),
	FOREIGN KEY(produto) REFERENCES stock.produto(codigo)
);