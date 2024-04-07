# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * from authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone from authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT  au_fname, au_lname, phone from authors ORDER BY au_fname
SELECT  au_fname, au_lname, phone from authors ORDER BY au_lname
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT  au_fname AS first_name, au_lname AS last_name, phone AS telephone from authors ORDER BY au_fname
SELECT  au_fname AS first_name, au_lname AS last_name, phone AS telephone from authors ORDER BY au_lname
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT  au_fname AS first_name, au_lname AS last_name, phone AS telephone, state from authors 
WHERE au_lname <> 'Ringer' AND state = 'CA'  
ORDER BY au_fname 

SELECT  au_fname AS first_name, au_lname AS last_name, phone AS telephone, state from authors
WHERE au_lname <> 'Ringer' AND state = 'CA' 
ORDER BY au_lname 
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT * from publishers
WHERE pub_name LIKE '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT pub_name
FROM (publishers JOIN titles ON publishers.pub_id = titles.pub_id)
WHERE type='business'
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name,SUM(QTY) AS qty
FROM (publishers JOIN titles ON publishers.pub_id = titles.pub_id)  JOIN sales ON titles.title_id = sales.title_id
GROUP BY publishers.pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT title,pub_name,SUM(QTY) AS qty
FROM (publishers JOIN titles ON publishers.pub_id = titles.pub_id)  JOIN sales ON titles.title_id = sales.title_id
GROUP BY title,pub_name
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT stor_name, title
FROM (stores JOIN sales ON stores.stor_id = sales.stor_id) JOIN titles ON sales.title_id = titles.title_id
WHERE stor_name='Bookbeat'
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
SELECT au_fname, au_lname
FROM (authors JOIN titleauthor ON authors.au_id = titleauthor.au_id) JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY au_fname, au_lname
HAVING COUNT(type) > 1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT titles.type, titles.pub_id, AVG(titles.price) as avg_price, COUNT(sales.qty) as qty_sales
FROM titles JOIN sales ON titles.title_id = sales.title_id 
GROUP BY titles.type, titles.pub_id
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT type,MAX(titles.advance) AS max_advance, AVG(titles.advance) AS avg_advance
FROM titles
GROUP BY type
HAVING MAX(advance) > (AVG(advance) * 1.5)
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT a.au_id, a.au_fname, a.au_lname, t.title, SUM(s.qty * t.price * ta.royaltyper / 100) AS author_earnings
FROM ((authors a join titleauthor ta ON a.au_id = ta.au_id) join titles t ON ta.title_id = t.title_id) join sales s ON t.title_id = s.title_id
GROUP BY a.au_id,a.au_fname, a.au_lname,t.title
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT title, ytd_sales, ytd_sales * price AS facturacao, price* ytd_sales * royalty/100 AS author_earnings, (ytd_sales * price) - (price * ytd_sales * royalty/100) AS publisher_earnings  
FROM titles 
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT t.title, t.ytd_sales, CONCAT(a.au_fname,' ',a.au_lname) AS author, t.price* t.ytd_sales * t.royalty/100 AS author_earnings, (t.ytd_sales * price) - (t.price * t.ytd_sales * t.royalty/100) AS publisher_earnings  
FROM (titles t JOIN titleauthor ta ON t.title_id = ta.title_id) JOIN authors a ON a.au_id = ta.au_id 
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT stor_name FROM (stores INNER JOIN sales ON stores.stor_id=sales.stor_id) INNER JOIN titles ON sales.title_id=titles.title_id
GROUP BY stores.stor_name
HAVING COUNT(title)=(SELECT COUNT(title_id) FROM titles);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stor_name FROM stores INNER JOIN sales ON stores.stor_id=sales.stor_id INNER JOIN titles ON sales.title_id=titles.title_id
GROUP BY stores.stor_name
HAVING SUM(sales.qty)>(SELECT SUM(sales.qty)/COUNT(stor_id) FROM sales);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT title FROM titles
EXCEPT
SELECT DISTINCT title FROM titles INNER JOIN sales ON sales.title_id=titles.title_id
INNER JOIN stores ON stores.stor_id=sales.stor_id
WHERE stor_name='Bookbeat'
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
SELECT publishers.pub_name, stores.stor_name
FROM (((stores LEFT OUTER JOIN sales ON stores.stor_id=sales.stor_id) LEFT OUTER JOIN titles ON sales.title_id=titles.title_id) LEFT OUTER JOIN publishers ON titles.pub_id=publishers.pub_id)
GROUP BY publishers.pub_name, stores.stor_name
HAVING COUNT(sales.qty)=0
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
SELECT DISTINCT Fname, Minit,Lname, Pname, Ssn
FROM (Company.employee JOIN Company.works_on ON Ssn = Essn) Join  Company.Project ON Pno = Pnumber
```

##### *b)* 

```
WITH temp AS (
  SELECT Ssn AS supSsn
  FROM Company.employee
  WHERE Fname = 'Carlos' AND Minit = 'D' AND Lname = 'Gomes'
)
SELECT Fname, Minit, Lname
FROM Company.employee 
JOIN temp ON Super_ssn = temp.supSsn;
```

##### *c)* 

```
SELECT Pname, w.THours
FROM (
    SELECT Pno, SUM(Hours) AS THours
    FROM Company.works_on
    GROUP BY Pno
) AS w
JOIN Company.project ON w.Pno = Pnumber;
```

##### *d)* 

```
SELECT Fname, Minit, Lname, Dno
FROM Company.employee
JOIN Company.works_on ON Ssn = Essn
WHERE Dno = 3 AND Hours > 20;
```

##### *e)* 

```
SELECT Fname, Lname
FROM Company.employee 
LEFT JOIN Company.works_on ON Ssn = Essn
WHERE Pno IS NULL;
```

##### *f)* 

```
SELECT Dname, AVG(Salary) AS salario_medio
FROM Company.department
JOIN Company.employee ON Dnumber = Dno
WHERE Sex = 'F'
GROUP BY Dname;
```

##### *g)* 

```
WITH EmployeeDependentCounts AS (
    SELECT Essn, COUNT(Essn) AS count_dep
    FROM Company.dependent
    GROUP BY Essn
    HAVING COUNT(Essn) > 1
)
SELECT Fname, Lname
FROM EmployeeDependentCounts edc
JOIN Company.employee ON Essn = Ssn;
```

##### *h)* 

```
SELECT Ssn, Fname, Minit, Lname
FROM Company.employee 
JOIN Company.department ON Ssn = Mgr_ssn
LEFT JOIN Company.dependent ON Ssn = Essn
WHERE Essn IS NULL
GROUP BY Ssn, Fname, Minit, Lname;
```

##### *i)* 

```
SELECT Fname, Lname, e_Address
FROM Company.employee
JOIN (
    SELECT Dnum
    FROM Company.project 
    JOIN Company.dept_locations ON Dnum = Dnumber
    WHERE Dlocation != 'Aveiro' AND Plocation = 'Aveiro'
) as projetos ON Dno = projetos.Dnum;
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

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

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

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
