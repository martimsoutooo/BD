CREATE TABLE Instituicao (
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50),
    PRIMARY KEY (Nome)
);

CREATE TABLE Autor (
    Email VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50),
    FOREIGN KEY (Instituicao_Nome) REFERENCES Instituicao(Nome),
    PRIMARY KEY (Email)
);

CREATE TABLE ArtigoCientifico (
    Numero_de_Registro INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Autor_Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Autor_Email) REFERENCES Autor(Email),
    PRIMARY KEY (Numero_de_Registro)
);

CREATE TABLE Conferencia (
    Artigo_FK INT,
    FOREIGN KEY (Artigo_FK) REFERENCES ArtigoCientifico(Numero_de_Registro)
);

CREATE TABLE Participantes (
    Email VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50),
    Morada VARCHAR(50),
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    FOREIGN KEY (Instituicao_Nome) REFERENCES Instituicao(Nome),
    PRIMARY KEY (Email)
);

CREATE TABLE NaoEstudante (
    Email VARCHAR(50) NOT NULL,
    Morada VARCHAR(50),
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    Referencia_Transacao VARCHAR(50),
    FOREIGN KEY (Email) REFERENCES Participantes(Email),
    PRIMARY KEY (Email)
);

CREATE TABLE Estudante (
    Email VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50)  NOT NULL,
    Morada VARCHAR(50)  NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    FOREIGN KEY (Email) REFERENCES Participantes(Email),
    PRIMARY KEY (Email)
);
