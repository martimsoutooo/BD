# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Fname, Minit, Lname, Pname (employee ⨝Ssn = Essn works_on ⨝Pno=Pnumber project)
```


### *b)* 

```
temp = ρ supSsn←Ssn (π Ssn (σFname = 'Carlos' AND Minit = 'D' AND Lname = 'Gomes' (employee)))
π Fname, Minit, Lname (temp ⨝supSsn=Super_ssn employee)
```


### *c)* 

```
π Pname, THours ((γ Pno; THours←sum(Hours) works_on) ⨝Pno = Pnumber project)
```


### *d)* 

```
temp = employee ⨝ Ssn=Essn (works_on)
π Fname,Minit,Lname,Dno (σ Dno=3 ∧ Hours>20 (temp))
```


### *e)* 

```
π Fname, Lname (σ Pno=null (employee ⟕ Ssn=Essn works_on))
```


### *f)* 

```
funcionariosDepartamento = department ⨝ Dno=Dnumber (employee)
γ Dname;avg(Salary)->salario_medio (σ Sex='F' (funcionariosDepartamento))
```


### *g)* 

```
func = σ count_dep > 1 (γ Essn; count(Essn) -> count_dep dependent)
π Fname, Lname (func ⨝Essn=Ssn (employee))
```


### *h)* 

```
gestoresDepartamento = employee ⨝ Mgr_ssn=Ssn (department)
π Ssn, Fname,Minit,Lname (σ dependent.Essn = null (gestoresDepartamento ⟕Ssn=Essn (dependent)))
```


### *i)* 

```
projetos = σDlocation!= 'Aveiro'∧  Plocation = 'Aveiro' (project ⨝ Dnum = Dnumber dept_location)
π Fname,Lname,Address (employee ⨝Dno=Dnum projetos)
```


## ​Problema 5.2

### *a)*

```
π nome (σ fornecedor = null (encomenda ⟗ fornecedor = nif fornecedor))
```

### *b)* 

```
average = γ codProd; avg(unidades)-> media (item)
π nome, media (average ⨝ codProd = codigo produto)
```


### *c)* 

```
γ;avg(num_prod)->media (γ numEnc;count(codProd)-> num_prod (item))```
```


### *d)* 

```
tabela = γ codProd,fornecedor;sum(unidades)->qnt_total (item ⨝numEnc=numero encomenda)
π fornecedor.nome,produto.nome,qnt_total (tabela ⨝ fornecedor = nif fornecedor ⨝ codProd = codigo produto)
```


## ​Problema 5.3

### *a)*

```
π numUtente,nome (σ numPresc=null (prescricao ⟕ paciente)) 
```

### *b)* 

```
medicoPrecricao = medico ⨝ numSNS=numMedico (prescricao)
γ especialidade; numPrescricoes←count(especialidade) (medicoPrecricao)
```


### *c)* 

```
farmaciaPrescricao = farmacia ⨝ nome=farmacia (prescricao)
γ farmacia; numPrescricoes←count(farmacia) (farmaciaPrescricao)
```


### *d)* 

```
farmacosAssociados906 = π nome (σ numRegFarm=906 (farmaco))
farmacosPrescritos906 = π presc_farmaco.nomeFarmaco (σ numRegFarm=906 (presc_farmaco))
farmacosAssociados906-farmacosPrescritos906
```

### *e)* 

```
γ farmacia.nome, farmaceutica.nome; count(presc_farmaco.nomeFarmaco) -> num_farmacos
π farmacia.nome, farmaceutica.nome, presc_farmaco.nomeFarmaco
(farmaceutica ⨝ presc_farmaco.numRegFarm = numReg
(farmacia ⨝ prescricao.farmacia = nome 
π prescricao.farmacia, presc_farmaco.numRegFarm, presc_farmaco.nomeFarmaco
(prescricao ⨝ numPrescX = numPresc (ρ numPrescX←numPresc (presc_farmaco)))))
```

### *f)* 

```
paciente ⨝ σ num_UU > 1 (γ numUtente; count(numUtente)->num_UU (γ numUtente, numMedico; count(numMedico)-> numPrescricoes prescricao))
```
