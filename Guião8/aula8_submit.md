# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :--------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.473 | 742        | 858       | PK         | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  | 1     | 0.003 | 216        | 44        | PK         | Clustered Index Seek |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               | 11    | 0.003 | 216        | 92        | PK         | Clustered Index Seek |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   | 72591 | 0.473 | 744        | 863       | PK         | Clustered Index Seek |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          | 55    | 0.473 | 1342       | 193       | PK         | Clustered Index Scan |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   | 9     | 0.003 | 20         | 58        | ProductID  | Non Clustered Index Seek/Clustered Key Lookup |            |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              | 9     | 0.003 | 28         | 33        | ProductID Covered (StartDate) | Non Clustered Index Seek |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              | 1105  | 0.005 | 30         | 71        | ProductID Covered (StartDate) | Non Clustered Index Seek |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            | 1     | 0.005 | 6          | 0         | ProductID Covered(StartDate)  |Non Clustered Index Seek|            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' | 1     | 0.016 | 28         | 63         | ProductID and StartDate  | Non Clustered Index Seek(twice)|            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' | 1     | 0.003 | 23         | 5           |composite (ProductID,StartDate)| Non Clustered Index Seek |            |

## ​8.2.

### a)

```
ALTER TABLE mytemp ADD CONSTRAINT ridPrimary PRIMARY KEY CLUSTERED (rid)
with (fillfactor=95, pad_index=ON);
go
```

### b)

```
Time: 123522ms
Fragmentation Percentage: 98.28%
Page Fullness: 68.15%
```

### c)

```
Fillfactor = 65 {
    Time: 45180ms
    Fragmentation Percentage: 98.24%
    Page Fullness: 68.33%
}

Fillfactor = 80 {
    Time: 57796ms
    Fragmentation Percentage: 98.99%
    Page Fullness: 61.38%
}


Fillfactor = 90 {
    Time: 53470ms
    Fragmentation Percentage: 99.07%
    Page Fullness: 60.32%
}
```

### d)

```
Fillfactor = 65 {
    Time: 47787ms
    Fragmentation Percentage: 80.09%
    Page Fullness: 1.04%
}

Fillfactor = 80 {
    Time: 48246ms
    Fragmentation Percentage: 87.28%
    Page Fullness: 0.45%
}


Fillfactor = 90 {
    Time: 49443ms
    Fragmentation Percentage: 92.03%
    Page Fullness: 0.54%
}   
```

### e)

```
CREATE NONCLUSTERED INDEX IDX_at1 ON mytemp(at1);
CREATE NONCLUSTERED INDEX IDX_at2 ON mytemp(at2);
CREATE NONCLUSTERED INDEX IDX_at3 ON mytemp(at3);
CREATE NONCLUSTERED INDEX IDX_lixo ON mytemp(lixo);

Without indexes: 112540 ms
With indexes: 119743 ms

Remove/Insert operations take longer to be completed when adding indexes.
```

## ​8.3.

### a)
```
i.  CREATE UNIQUE CLUSTERED INDEX IxSsn ON EMPLOYEE(Ssn);
ii. CREATE INDEX IxFnameLname ON EMPLOYEE(Fname, Lname);
iii.CREATE INDEX IxEmpDep ON EMPLOYEE(Dno);
iv. CREATE INDEX IxWorksOnPno on WORKS_ON(Pno);
v.  CREATE INDEX IxDpndEssn ON DEPENDENT(Essn);
vi. CREATE INDEX IxProjDnum ON PROJECT(Dnum);
```


