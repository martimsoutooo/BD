CREATE SCHEMA stockmanager
GO
CREATE TABLE stockmanager.Produto(
	Codigo	INT NOT NULL,
	Nome	VARCHAR(10) NOT NULL,
	Preco	INT NOT NULL,
	IVA		INT NOT NULL,
	Stock	INT NOT NULL,
	PRIMARY KEY(Codigo)
);

CREATE TABLE stockmanager.TipoFornecedor(
	ID INT NOT NULL,
	Designacao VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID)
);

CREATE TABLE stockmanager.Fornecedor(
	NIF INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Endereco VARCHAR(30) NOT NULL,
	Numero_FAX INT NOT NULL,
	Cond_Pagamento VARCHAR(50) NOT NULL,
	ID_tipoFornecedor INT NOT NULL,
	PRIMARY KEY(NIF),
	FOREIGN KEY(ID_tipoFornecedor) REFERENCES stockmanager.TipoFornecedor(ID),
);

CREATE TABLE stockmanager.Encomenda(
	Numero INT NOT NULL,
	Data_Encomenda DATE NOT NULL,
	NIF_Fornecedor INT NOT NULL,
	Num_Itens INT NOT NULL,
	Codigo_Produto INT NOT NULL,
	PRIMARY KEY(Numero),
	FOREIGN KEY(NIF_Fornecedor) REFERENCES stockmanager.Fornecedor(NIF),
	FOREIGN KEY(Codigo_Produto) REFERENCES stockmanager.Produto(Codigo)
);

