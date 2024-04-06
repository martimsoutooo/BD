INSERT INTO prescricao.medico(id, nome, especialidade) VALUES (106, 'Carlos Pereira', 'Gastroenterologia');
INSERT INTO prescricao.medico(id, nome, especialidade) VALUES (107, 'Maria João', 'Dermatologia');
INSERT INTO prescricao.medico(id, nome, especialidade) VALUES (108, 'Patricia Santos', 'Endocrinologia');
INSERT INTO prescricao.medico(id, nome, especialidade) VALUES (109, 'Luis António', 'Otorrinolaringologia');
INSERT INTO prescricao.medico(id, nome, especialidade) VALUES (110, 'Susana Marques', 'Pediatria');

INSERT INTO prescricao.paciente(n_utente, nome, data_nascimento, endereco, id_medico) VALUES (6, 'Joana Almeida', '1983-02-15', 'Avenida dos Aliados 27', 106);
INSERT INTO prescricao.paciente(n_utente, nome, data_nascimento, endereco, id_medico) VALUES (7, 'Antonio Gomes', '1964-07-22', 'Rua de Santa Catarina 105', 107);
INSERT INTO prescricao.paciente(n_utente, nome, data_nascimento, endereco, id_medico) VALUES (8, 'Teresa Silva', '1992-11-05', 'Praceta do Mar 8', 108);
INSERT INTO prescricao.paciente(n_utente, nome, data_nascimento, endereco, id_medico) VALUES (9, 'Ricardo Sousa', '1975-09-09', 'Largo do Toural 45', 109);
INSERT INTO prescricao.paciente(n_utente, nome, data_nascimento, endereco, id_medico) VALUES (10, 'Miguel Costa', '2001-04-19', 'Rua das Flores 76', 110);

INSERT INTO prescricao.farmacia(nif, nome, telefone, endereco) VALUES (123456789, 'Farmacia Nova', '251234567', 'Rua Nova 50');
INSERT INTO prescricao.farmacia(nif, nome, telefone, endereco) VALUES (987654321, 'Farmacia do Povo', '253765432', 'Rua do Comércio 120');
INSERT INTO prescricao.farmacia(nif, nome, telefone, endereco) VALUES (111222333, 'Farmacia Moderna', '254123456', 'Praceta Moderna 10');
INSERT INTO prescricao.farmacia(nif, nome, telefone, endereco) VALUES (444555666, 'Farmacia do Sol', '252346578', 'Avenida do Sol 99');

INSERT INTO prescricao.farmaceutica(numero_registro, nome, telefone, endereco) VALUES (909, 'Novartis', '258765432', 'Rua das Indústrias 34');
INSERT INTO prescricao.farmaceutica(numero_registro, nome, telefone, endereco) VALUES (910, 'AstraZeneca', '256234987', 'Parque Tecnológico 28');

INSERT INTO prescricao.farmaco(nome_comercial, formula, nif_farmacia, n_registro_farm) VALUES ('CuraTudo', 'ABC123', 123456789, 909);
INSERT INTO prescricao.farmaco(nome_comercial, formula, nif_farmacia, n_registro_farm) VALUES ('AliviaDor', 'XYZ789', 987654321, 910);

INSERT INTO prescricao.prescricao(numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10010, '2024-04-05', 106, 6, 'CuraTudo', 123456789);
INSERT INTO prescricao.prescricao(numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10011, '2024-04-06', 107, 7, 'AliviaDor', 987654321);

-- informacoes adicionais para testes e maior clareza dos resultados
INSERT INTO prescricao.medico (id, especialidade, nome) VALUES (111, 'Oftalmologia', 'Ricardo Reis');
INSERT INTO prescricao.medico (id, especialidade, nome) VALUES (112, 'Ortopedia', 'Clara Gomes');


INSERT INTO prescricao.paciente (n_utente, nome, data_nascimento, endereco, id_medico) VALUES (11, 'Sara Almeida', '1995-03-21', 'Rua das Amoreiras 15', 111);
INSERT INTO prescricao.paciente (n_utente, nome, data_nascimento, endereco, id_medico) VALUES (12, 'Carlos Menezes', '1988-07-19', 'Avenida dos Banhos 28', 112);

INSERT INTO prescricao.farmacia (nif, nome, telefone, endereco) VALUES (222333444, 'Farmacia Mar Azul', '252555444', 'Praça do Oceano 3');
INSERT INTO prescricao.farmacia (nif, nome, telefone, endereco) VALUES (555666777, 'Farmacia Rio Verde', '253444555', 'Rua dos Navegantes 76');


INSERT INTO prescricao.farmaceutica (numero_registro, nome, telefone, endereco) VALUES (911, 'Sanofi', '254987321', 'Zona Industrial 22');
INSERT INTO prescricao.farmaceutica (numero_registro, nome, telefone, endereco) VALUES (912, 'GSK', '252987654', 'Parque das Nações 17');

INSERT INTO prescricao.farmaco (nome_comercial, formula, nif_farmacia, n_registro_farm) VALUES ('PazinaClor', 'DZT456', 222333444, 911);
INSERT INTO prescricao.farmaco (nome_comercial, formula, nif_farmacia, n_registro_farm) VALUES ('Dorilax', 'PTLX22', 555666777, 912);

INSERT INTO prescricao.prescricao (numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10012, '2024-04-10', 111, 11, 'PazinaClor', 222333444);
INSERT INTO prescricao.prescricao (numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10013, '2024-04-11', 112, 12, 'Dorilax', 555666777);

INSERT INTO prescricao.prescricao (numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10014, '2024-04-12', 111, 12, 'PazinaClor', 222333444);
INSERT INTO prescricao.prescricao (numero, data, id_medico, n_paciente, nome_farmaco, nif_farmacia) VALUES (10015, '2024-04-13', 112, 11, 'Dorilax', 555666777);