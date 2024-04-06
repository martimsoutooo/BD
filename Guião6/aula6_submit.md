# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * from authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone 
FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
1.
SELECT au_fname, au_lname, phone 
FROM authors
ORDER BY au_fname ASC
2.
SELECT au_fname, au_lname, phone 
FROM authors
ORDER BY au_lname ASC
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
1.
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
ORDER BY au_fname ASC
2.
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
ORDER BY au_lname ASC
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
1.
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
WHERE au_fname != 'Ringer' AND state = 'CA'
ORDER BY au_fname ASC
2.
SELECT au_fname AS first_name, au_lname AS last_name, phone 
FROM authors
WHERE au_fname <> 'Ringer' AND state = 'CA'
ORDER BY au_lname ASC
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * FROM publishers
WHERE pub_name LIKE '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT pub_name 
FROM (publishers JOIN titles ON publishers.pub_id = titles.pub_id)
WHERE titles.type = 'business'
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name, SUM(qty) AS qty
FROM publishers JOIN titles ON publishers.pub_id = titles.pub_id JOIN sales ON titles.title_id = sales.title_id 
GROUP BY publishers.pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT pub_name, title, SUM(qty) AS qty
FROM publishers JOIN titles ON publishers.pub_id = titles.pub_id JOIN sales ON titles.title_id = sales.title_id 
GROUP BY publishers.pub_name, title
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT title
FROM stores JOIN sales ON stores.stor_id = sales.stor_id JOIN titles ON sales.title_id = titles.title_id
WHERE stor_name = 'Bookbeat'
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT au_fname, au_lname
FROM authors JOIN titleauthor ON authors.au_id = titleauthor.au_id JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY au_fname, au_lname
HAVING COUNT(type) > 1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
... Write here your answer ...
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
... Write here your answer ...
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
... Write here your answer ...
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
... Write here your answer ...
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
... Write here your answer ...
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
... Write here your answer ...
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
... Write here your answer ...
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT DISTINCT nome 
FROM stock.fornecedor JOIN stock.encomenda ON stock.encomenda.fornecedor = stock.fornecedor.nif
WHERE stock.encomenda.fornecedor IS NULL
```

##### *b)* 

```
SELECT nome, AVG(stock.encomenda.num_itens) AS media
FROM stock.produto JOIN stock.encomenda ON stock.produto.codigo = stock.encomenda.produto
GROUP BY nome
```


##### *c)* 

```
SELECT AVG(num_itens) as media
FROM stock.encomenda
```


##### *d)* 

```
SELECT p.nome AS Produto, f.nome AS Fornecedor, SUM(e.num_itens) AS Quantidade
FROM stock.fornecedor AS f JOIN stock.encomenda AS e ON f.nif = e.fornecedor JOIN stock.produto AS p ON e.produto = p.codigo
GROUP BY f.nome, p.nome
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT nome, n_utente
FROM prescricao.paciente LEFT JOIN prescricao.prescricao ON n_utente = n_paciente 
WHERE prescricao.prescricao.n_paciente IS NULL
```

##### *b)* 

```
SELECT p.especialidade, COUNT(m.numero) AS numero_de_prescricoes
FROM prescricao.medico p JOIN prescricao.prescricao m ON p.id = m.id_medico
GROUP BY p.especialidade;
```


##### *c)* 

```
SELECT f.nome AS farmacia, COUNT(p.numero) AS numero_de_prescricoes
FROM prescricao.farmacia f LEFT JOIN prescricao.prescricao p ON f.nif = p.nif_farmacia
GROUP BY f.nome;
```


##### *d)* 

```
SELECT fa.nome_comercial
FROM prescricao.farmaco fa LEFT JOIN prescricao.prescricao pr ON fa.nome_comercial = pr.nome_farmaco AND fa.n_registro_farm = 906
WHERE pr.numero IS NULL AND fa.n_registro_farm = 906;
```

##### *e)* 

```
SELECT f.nome AS farmacia, fa.nome AS farmaceutica, COUNT(p.nome_farmaco) AS numero_de_farmacos
FROM prescricao.farmacia f
JOIN prescricao.prescricao p ON f.nif = p.nif_farmacia
JOIN prescricao.farmaco fo ON p.nome_farmaco = fo.nome_comercial
JOIN prescricao.farmaceutica fa ON fo.n_registro_farm = fa.numero_registro
GROUP BY f.nome, fa.nome;
```

##### *f)* 

```
SELECT pa.nome AS paciente
FROM prescricao.paciente pa JOIN prescricao.prescricao p ON pa.n_utente = p.n_paciente
GROUP BY pa.nome
HAVING COUNT(DISTINCT p.id_medico) > 1;
```
