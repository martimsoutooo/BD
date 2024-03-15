CREATE SCHEMA rentacar;

GO

CREATE TABLE rentacar.Cliente (
    NIF INT NOT NULL PRIMARY KEY,
    Endereco VARCHAR(50) NOT NULL,
    Num_carta INT NOT NULL,
    Nome VARCHAR(50) NOT NULL
);


CREATE TABLE rentacar.Balcao (
    Numero INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL
);


CREATE TABLE rentacar.Tipo_Veiculo (
    Codigo INT NOT NULL PRIMARY KEY,
    Arcondicionado BIT NOT NULL,
    Designacao VARCHAR(20) NOT NULL
);


CREATE TABLE rentacar.Veiculo (
    Matricula VARCHAR(20) NOT NULL, 
    Ano INT NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    Codigo INT NOT NULL 
	PRIMARY KEY(Matricula),
	FOREIGN KEY(Codigo) REFERENCES rentacar.Tipo_Veiculo(Codigo),
);


CREATE TABLE rentacar.Aluguer (
    Numero INT NOT NULL,
    Duracao INT NOT NULL,
    data_comeco DATE NOT NULL,
    cliente_NIF INT NOT NULL, 
    balcao_numero INT NOT NULL, 
    veiculo_matricula VARCHAR(20) NOT NULL, 
	PRIMARY KEY(Numero),
	FOREIGN KEY(cliente_NIF) REFERENCES rentacar.Cliente(NIF),
	FOREIGN KEY(balcao_numero) REFERENCES rentacar.Balcao(Numero),
	FOREIGN KEY(veiculo_matricula) REFERENCES rentacar.Veiculo(Matricula)
);


CREATE TABLE rentacar.Similaridade (
    Similar1 INT NOT NULL, 
    Similar2 INT NOT NULL, 
    PRIMARY KEY (Similar1, Similar2),
	FOREIGN KEY(Similar1) REFERENCES rentacar.Tipo_Veiculo(Codigo),
	FOREIGN KEY(Similar2) REFERENCES rentacar.Tipo_Veiculo(Codigo)
);


CREATE TABLE rentacar.Ligeiro (
    codigo_tipoveiculo INT NOT NULL,
    Num_Lugares INT NOT NULL,
    Portas INT NOT NULL,
    Combustivel INT NOT NULL,
	PRIMARY KEY(codigo_tipoveiculo),
	FOREIGN KEY(codigo_tipoveiculo) REFERENCES rentacar.Tipo_Veiculo(Codigo),
);


CREATE TABLE rentacar.Pesado (
    codigo_tipoveiculo INT NOT NULL,
    Peso INT NOT NULL,
    Passageiros INT NOT NULL,
	PRIMARY KEY(codigo_tipoveiculo),
	FOREIGN KEY(codigo_tipoveiculo) REFERENCES rentacar.Tipo_Veiculo(Codigo),
    
);
