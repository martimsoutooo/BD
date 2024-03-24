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
... Write here your answer ...
```


### *f)* 

```
funcionariosDepartamento = department ⨝ Dno=Dnumber (employee)
γ Dname;avg(Salary)->salario_medio (σ Sex='F' (funcionariosDepartamento))
```


### *g)* 

```
... Write here your answer ...
```


### *h)* 

```
gestoresDepartamento = employee ⨝ Mgr_ssn=Ssn (department)
π Ssn, Fname,Minit,Lname (σ dependent.Essn = null (gestoresDepartamento ⟕Ssn=Essn (dependent)))
```


### *i)* 

```
... Write here your answer ...
```


## ​Problema 5.2

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
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
