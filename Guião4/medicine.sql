CREATE SCHEMA medicine;

GO

CREATE TABLE Paciente (
    N_Utente INT PRIMARY KEY NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    ID_Medico INT NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID)
);

CREATE TABLE Farmacia (
    NIF INT PRIMARY KEY NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL
);

CREATE TABLE Medico (
    ID INT PRIMARY KEY NOT NULL,
    Especialidade VARCHAR(20) NOT NULL,
    Nome VARCHAR(20)NOT NULL
);

CREATE TABLE Prescricao (
    Numero INT PRIMARY KEY NOT NULL,
    Data DATE NOT NULL,
    ID_Medico INT NOT NULL,
    N_Paciente INT NOT NULL,
    Nome_Farmaco VARCHAR(20) NOT NULL,
    NIF_Farmacia INT NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID),
    FOREIGN KEY (N_Paciente) REFERENCES Paciente(N_Utente),
    FOREIGN KEY (NIF_Farmacia) REFERENCES Farmacia(NIF)
);

CREATE TABLE Farmaco (
    Nome_Comercial VARCHAR(20) PRIMARY KEY NOT NULL,
    Formula VARCHAR(100) NOT NULL,
    NIF_Farmacia INT NOT NULL,
    N_Registo_Farm INT NOT NULL,
    FOREIGN KEY (NIF_Farmacia) REFERENCES Farmacia(NIF)
);

CREATE TABLE Farmaceutica (
    Numero_Registo INT PRIMARY KEY NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL
);
