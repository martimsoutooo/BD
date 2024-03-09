# BD: Guião 3


## ​Problema 3.1
 
### *a)*
#### Relações
```
-> Cliente(Nome, Endereço, Num_carta, Nif)
-> Aluguer(Número, Duração, Data)
-> Balcão(Número, Nome, Endereço)
-> Veículo(Matrícula, Ano, Marca)
-> Tipo_Veiculo(Código, Designação, ArCondicionado)
-> Ligeiro(NumLugares, Portas, Combustivel)
-> Pesado(Peso, Passageiros)
```


### *b)* 
#### Chaves Primárias
```
-> Cliente(Nif)
-> Aluguer(Número)
-> Balcão(Número)
-> Veículo(Matrícula)
-> Tipo_Veiculo(Código)
-> Ligeiro(Não tem)
-> Pesado(Não tem)
```
#### Chaves Candidatas
```
-> Cliente(Nif, Num_Carta)
-> Aluguer(Número)
-> Balcão(Número)
-> Veículo(Matrícula)
-> Tipo_Veiculo(Código)
-> Ligeiro(Não tem)
-> Pesado(Não tem)
```
#### Chaves Estrangeiras
```
-> Cliente(Não tem)
-> Aluguer(Cliente, Balcão, Veículo)
-> Balcão(Não tem)
-> Veículo(Tipo_Veiculo)
-> Tipo_Veiculo(Similar1,Similar2)
-> Ligeiro(Código)
-> Pesado(Código)
```

### *c)* 

![113765_114614_ex1!](113765_114614_ex1.jpg "AnImage")


## ​Problema 3.2

### *a)*
#### Relações
```
-> Airport(Airport_Code, City, State, Name)
-> Flight_Leg(Leg_No)
-> Flight(Number, Airline, Weekdays)
-> Fare(Restrictions, Amount, Code)
-> Leg_Instance(No_Of_Avail_Seats, Date)
-> Airplane(Airplane_Id, Total_no_of_Seats)
-> Airplane_Type(Max_seats, Type_Name, Company)
```


### *b)* 

```
... Write here your answer ...
```


### *c)* 

![ex_3_2c!](ex_3_2c.jpg "AnImage")


## ​Problema 3.3


### *a)* 2.1

![ex_3_3_a!](ex_3_3a.jpg "AnImage")

### *b)* 2.2

![ex_3_3_b!](ex_3_3b.jpg "AnImage")

### *c)* 2.3

![ex_3_3_c!](ex_3_3c.jpg "AnImage")

### *d)* 2.4

![ex_3_3_d!](ex_3_3d.jpg "AnImage")