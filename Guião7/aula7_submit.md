# BD: Guião 7


## ​7.2 
 
### *a)*

```
Encontra-se na primeira forma normal, uma vez que existem dependências parciais. 
```

### *b)* 

```
2FN: Livro1(Nome_Autor, Afiliacao_Autor)
3FN: R3(Tipo_Livro, NoPaginas, Preco)
     R4(Editor, Endereço_Editor)
```




## ​7.3
 
### *a)*

```
A e B
```


### *b)* 

```
2NF:
R(_A_,_B_, C)
R2(_A_, D, E, I, J)
R3(_B_, F, G, H)
```


### *c)* 

```
3NF:
R(_A_,_B_, C)
R2(_A_, D, E)
R3(_B_, F)
R4(_D_, I, J)
R5(_F_, G, H)
```


## ​7.4
 
### *a)*

```
A e B
```


### *b)* 

```
Nao tem dependencias transitivas, por isso já está na 3NF

3NF:
    -> R1 (_A_, _B_, C, D, E)
    -> R2 (_D_, E)
    -> R3 (_C_, A)

```


### *c)* 

```
BCNF:
    -> R1 (_B_, C, D, E)
    -> R2 (_D_, E)
    -> R3 (_C_, A)

```



## ​7.5
 
### *a)*

```
A e B
```

### *b)* 

```
R(_A_, _B_, E)
R1(_A_, C, D)
```


### *c)* 

```
R(_A_, _B_, E)
R1(_A_, C)
R2(_C_, D)

```

### *d)* 

```
Já estava em BCNF por isso fica igual
R(_A_, _B_, E)
R1(_A_, C)
R2(_C_, D)
```
