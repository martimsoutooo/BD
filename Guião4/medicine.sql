CREATE SCHEMA medicine;

GO

CREATE TABLE medicine.Farmacia (
    NIF INT PRIMARY KEY NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL
);

CREATE TABLE medicine.Medico (
    ID INT PRIMARY KEY NOT NULL,
    Especialidade VARCHAR(20) NOT NULL,
    Nome VARCHAR(20)NOT NULL
);

CREATE TABLE medicine.Farmaceutica (
    Numero_Registo INT PRIMARY KEY NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL
);

CREATE TABLE medicine.Paciente (
    N_Utente INT PRIMARY KEY NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    ID_Medico INT NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES medicine.Medico(ID)
);

CREATE TABLE medicine.Prescricao (
    Numero INT PRIMARY KEY NOT NULL,
    Data DATE NOT NULL,
    ID_Medico INT NOT NULL,
    N_Paciente INT NOT NULL,
    Nome_Farmaco VARCHAR(20) NOT NULL,
    NIF_Farmacia INT NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES medicine.Medico(ID),
    FOREIGN KEY (N_Paciente) REFERENCES medicine.Paciente(N_Utente),
    FOREIGN KEY (NIF_Farmacia) REFERENCES medicine.Farmacia(NIF)
);

CREATE TABLE medicine.Farmaco (
    Nome_Comercial VARCHAR(20) PRIMARY KEY NOT NULL,
    Formula VARCHAR(100) NOT NULL,
    NIF_Farmacia INT NOT NULL,
    N_Registo_Farm INT NOT NULL,
    FOREIGN KEY (NIF_Farmacia) REFERENCES medicine.Farmacia(NIF),
	FOREIGN KEY (N_Registo_Farm) REFERENCES medicine.Farmaceutica(Numero_Registo)
);


