CREATE SCHEMA conference
GO
CREATE TABLE conference.Instituicao (
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50),
    PRIMARY KEY (Nome)
);

CREATE TABLE conference.Autor (
    Email VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50),
    FOREIGN KEY (Instituicao_Nome) REFERENCES conference.Instituicao(Nome),
    PRIMARY KEY (Email)
);

CREATE TABLE conference.ArtigoCientifico (
    Numero_de_Registro INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Autor_Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Autor_Email) REFERENCES conference.Autor(Email),
    PRIMARY KEY (Numero_de_Registro)
);

CREATE TABLE conference.Conferencia (
    Artigo_FK INT,
    FOREIGN KEY (Artigo_FK) REFERENCES conference.ArtigoCientifico(Numero_de_Registro)
);

CREATE TABLE conference.Participantes (
    Email VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50),
    Morada VARCHAR(50),
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    FOREIGN KEY (Instituicao_Nome) REFERENCES conference.Instituicao(Nome),
    PRIMARY KEY (Email)
);

CREATE TABLE conference.NaoEstudante (
    Email VARCHAR(50) NOT NULL,
    Morada VARCHAR(50),
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    Referencia_Transacao VARCHAR(50),
    FOREIGN KEY (Email) REFERENCES conference.Participantes(Email),
    PRIMARY KEY (Email)
);

CREATE TABLE conference.Estudante (
    Email VARCHAR(50) NOT NULL,
    Instituicao_Nome VARCHAR(50)  NOT NULL,
    Morada VARCHAR(50)  NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Data_de_Inscricao DATE NOT NULL,
    FOREIGN KEY (Email) REFERENCES conference.Participantes(Email),
    PRIMARY KEY (Email)
);
