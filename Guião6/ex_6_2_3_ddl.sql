CREATE SCHEMA prescricao;
GO

CREATE TABLE prescricao.medico (
    id INT PRIMARY KEY,
    especialidade VARCHAR(255),
    nome VARCHAR(255)
);

CREATE TABLE prescricao.paciente (
    n_utente INT PRIMARY KEY,
    data_nascimento DATE,
    endereco VARCHAR(255),
    nome VARCHAR(255),
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES prescricao.medico(id)
);

CREATE TABLE prescricao.farmacia (
    nif INT PRIMARY KEY,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    nome VARCHAR(255)
);

CREATE TABLE prescricao.prescricao (
    numero INT PRIMARY KEY,
    data DATE,
    id_medico INT,
    n_paciente INT,
    nome_farmaco VARCHAR(255),
    nif_farmacia INT,
    FOREIGN KEY (id_medico) REFERENCES prescricao.medico(id),
    FOREIGN KEY (n_paciente) REFERENCES prescricao.paciente(n_utente),
    FOREIGN KEY (nif_farmacia) REFERENCES prescricao.farmacia(nif)
);

CREATE TABLE prescricao.farmaceutica (
    numero_registro INT PRIMARY KEY,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    nome VARCHAR(255)
);

CREATE TABLE prescricao.farmaco (
    nome_comercial VARCHAR(255),
    formula VARCHAR(255),
    nif_farmacia INT,
    n_registro_farm INT,
    FOREIGN KEY (nif_farmacia) REFERENCES prescricao.farmacia(nif),
    FOREIGN KEY (n_registro_farm) REFERENCES prescricao.farmaceutica(numero_registro)
);