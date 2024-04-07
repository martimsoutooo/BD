INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (101, 'Carnes');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (102, 'Laticinios');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (103, 'Frutas e Legumes');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (104, 'Mercearia');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (105, 'Bebidas');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (106, 'Peixe');
INSERT INTO stock.tipo_fornecedor(id, designacao) VALUES (107, 'Detergentes');

INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509111222, 'LactoSerrano', 234872372, NULL, '60 dias', 102);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509121212, 'FrescoNorte', 221234567, 'Rua do Complexo Grande - Edf 3', '90 dias', 102);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509294734, 'PinkDrinks', 2123231732, 'Rua Poente 723', '30 dias', 105);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509827353, 'LactoSerrano', 234872372, NULL, '60 dias', 102);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509836433, 'LeviClean', 229343284, 'Rua Sol Poente 6243', '30 dias', 107);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (509987654, 'MaduTex', 234873434, 'Estrada da Cincunvalacao 213', '30 dias', 104);
INSERT INTO stock.fornecedor(nif, nome, fax, endereco, cond_pagamento, tipo_fornecedor) VALUES (590972623, 'ConservasMac', 234112233, 'Rua da Recta 233', '30 dias', 104);

INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10001, 'Bife da Pa', 8.75, 23, 125);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10002, 'Laranja Algarve', 1.25, 23, 1000);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10003, 'Pera Rocha', 1.45, 23, 2000);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10004, 'Secretos de Porco Preto', 10.15, 23, 342);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10005, 'Vinho Rose Plus', 2.99, 13, 5232);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10006, 'Queijo de Cabra da Serra', 15.00, 23, 3243);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10007, 'Queijo Fresco do Dia', 0.65, 23, 452);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10008, 'Cerveja Preta Artesanal', 1.65, 13, 937);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10009, 'Lixivia de Cor', 1.85, 23, 9382);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10010, 'Amaciador Neutro', 4.05, 23, 932432);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10011, 'Agua Natural', 0.55, 6, 919323);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10012, 'Pao de Leite', 0.15, 6, 5434);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10013, 'Arroz Agulha', 1.00, 13, 7665);
INSERT INTO stock.produto(codigo, nome, preco, taxa_iva, stock) VALUES (10014, 'Iogurte Natural', 0.40, 13, 998);

INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (1, '2015-03-03', 509111222, 10001, 10);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (2, '2015-03-04', 509121212, 10002, 20);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (3, '2015-03-05', 509987654, 10003, 30);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (4, '2015-03-06', 509827353, 10004, 40);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (5, '2015-03-07', 509294734, 10005, 50);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (6, '2015-03-08', 509836433, 10006, 60);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (7, '2015-03-09', 509121212, 10007, 70);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (8, '2015-03-10', 509987654, 10008, 80);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (9, '2015-03-11', 509836433, 10009, 90);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (10, '2015-03-12', 509987654, 10010, 100);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (11, '2024-04-06', 509111222, 10001, 20);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (12, '2024-04-07', 509121212, 10001, 15);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (13, '2024-04-06', 509294734, 10002, 50);
INSERT INTO stock.encomenda(numero, data_encomenda, fornecedor, produto, num_itens) VALUES (14, '2024-04-07', 509987654, 10002, 30)
