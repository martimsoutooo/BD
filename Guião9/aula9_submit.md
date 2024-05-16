# BD: Guião 9


## ​9.1
 
### *a)*

```
CREATE PROC delEmployee @issn char(9)
as
BEGIN
    BEGIN TRAN
    DELETE FROM dependent where essn=@issn
    DELETE FROM works_on where essn=@issn
    UPDATE department set mgr_ssn=null where essn=@issn
    UPDATE employee set super_ssn=null where essn=@issn
    DELETE FROM Employee where essn=@issn

    COMMIT
END
```

### *b)* 

```
GO
CREATE PROC sp_dept_managers (@mgr_ssn INT OUTPUT, @worked_yrs INT OUTPUT)
AS
	BEGIN
		SELECT Employee.* FROM Company.Employee INNER JOIN Company.Department ON Company.Employee.Ssn=Company.Department.Mgr_ssn;
		SELECT @mgr_ssn = Department.Mgr_ssn, @worked_yrs = DATEDIFF(year, Mgr_start_date, GETDATE()) FROM Company.Department 
			WHERE Mgr_start_date = (SELECT MIN(Mgr_start_date) from Company.Department);
	END

DECLARE @ssn INT;
DECLARE @yrs INT;
EXEC sp_dept_managers @ssn OUTPUT, @yrs OUTPUT;
PRINT @ssn;
PRINT @yrs;

```

### *c)* 

```
... Write here your answer ...
```

### *d)* 

```
GO
CREATE TRIGGER salary_get_low ON Company.Employee AFTER INSERT, UPDATE
AS
	BEGIN
		DECLARE @ssn_emp AS INT;
		DECLARE @sal_emp AS INT;
		DECLARE @dno AS INT;
		DECLARE @mgr_sal AS INT;

		SELECT @ssn_emp=inserted.Ssn, @sal_emp=inserted.Salary, @dno=inserted.Dno FROM inserted;
		SELECT @mgr_sal=Company.Employee.Salary FROM Company.Department
			INNER JOIN Company.Employee ON Company.Department.Mgr_Ssn=Company.Employee.Ssn
			WHERE @dno=Company.Department.Dnumber;

		IF @sal_emp > @mgr_sal
		BEGIN
			UPDATE Company.Employee SET Company.Employee.Salary=@mgr_sal-1
			WHERE Company.Employee.Ssn=@ssn_emp
		END
	END

INSERT INTO Company.Employee VALUES ('Rui', 'F', 'Machado', 999888777, '2010-1-13', 'Rua Principal 10', 'M', 1500, 21312332, 1);
INSERT INTO Company.Employee VALUES ('Martim', 'J', 'Santos', 123456789, '2010-01-20', 'Estrada da Cela 8', 'M', 1200, 21312332, 1);
SELECT * FROM Company.Employee;
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
GO
CREATE FUNCTION Company.ft_dept_better_paid_emp (@dno INT)
RETURNS TABLE
AS
RETURN (
    SELECT e.Ssn, e.Fname, e.Lname
    FROM Company.Employee e
    WHERE e.Dno = @dno
    AND e.Salary > (
        SELECT AVG(Salary) 
        FROM Company.Employee 
        WHERE Dno = @dno
    )
);

SELECT Dno, AVG(Salary) as avg_sal 
	FROM Company.Department, Company.Employee
	WHERE Dno=Dnumber
	GROUP BY Dno;
SELECT * FROM Company.Employee;
SELECT * FROM Company.ft_dept_better_paid_emp(1);
SELECT * FROM Company.ft_dept_better_paid_emp(2);
SELECT * FROM Company.ft_dept_better_paid_emp(3);

```

### *g)* 

```
... Write here your answer ...
```

### *h)* 

```
... Write here your answer ...
```

### *i)* 

```
... Write here your answer ...
```
