CREATE SCHEMA atlmanager
GO 
CREATE TABLE atlmanager.Pessoa(
CC			INT NOT NULL,
Contacto	INT NOT NULL,
Email		VARCHAR(20) NOT NULL,
Data_Nascimento DATE NOT NULL,
Morada		VARCHAR(20) NOT NULL,
PRIMARY KEY(CC)
);

CREATE TABLE atlmanager.Professor(
CC_Pessoa	INT NOT NULL,
Num_Funcionario	INT NOT NULL,
PRIMARY KEY(CC_Pessoa),
FOREIGN KEY(CC_Pessoa) REFERENCES atlmanager.Pessoa(CC)
);

CREATE TABLE atlmanager.ResponsavelLevantamento(
CC_Pessoa INT NOT NULL,
PRIMARY KEY(CC_Pessoa),
FOREIGN KEY(CC_Pessoa) REFERENCES atlmanager.Pessoa(CC)
);

CREATE TABLE atlmanager.Turma(
ID INT NOT NULL,
Classe INT NOT NULL,
Ano_Letivo INT NOT NULL,
Designacao VARCHAR(20) NOT NULL,
Num_Max_Alunos INT NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE atlmanager.Aluno(
CC_Pessoa INT NOT NULL,
ID_Turma INT NOT NULL,
PRIMARY KEY(CC_PESSOA),
FOREIGN KEY(CC_Pessoa) REFERENCES atlmanager.Pessoa(CC),
FOREIGN KEY(ID_Turma) REFERENCES atlmanager.Turma(ID)
);

CREATE TABLE atlmanager.Atividade(
ID INT NOT NULL,
Custo INT NOT NULL,
Designacao VARCHAR(20) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE atlmanager.Participa(
ID_Atividade INT NOT NULL,
CCParticipante_Aluno INT NOT NULL,
PRIMARY KEY(ID_Atividade),
FOREIGN KEY(CCParticipante_Aluno) REFERENCES atlmanager.Aluno(CC_Pessoa),
FOREIGN KEY(ID_Atividade) REFERENCES atlmanager.Atividade(ID)
);

CREATE TABLE atlmanager.Faz(
IDFaz_Turma INT NOT NULL,
IDFaz_Atividade INT NOT NULL,
FOREIGN KEY(IDFaz_Turma) REFERENCES atlmanager.Turma(ID),
FOREIGN KEY(IDFaz_Atividade) REFERENCES atlmanager.Atividade(ID)
);

CREATE TABLE atlmanager.Levanta(
CCLevanta_Responsável INT NOT NULL,
CCLevanta_Aluno INT NOT NULL,
FOREIGN KEY(CCLevanta_Responsável) REFERENCES atlmanager.ResponsavelLevantamento(CC_Pessoa),
FOREIGN KEY(CCLevanta_Aluno) REFERENCES atlmanager.Aluno(CC_Pessoa)

);