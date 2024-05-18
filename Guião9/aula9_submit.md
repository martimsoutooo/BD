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
GO
CREATE TRIGGER soloMngDep ON Company.Department INSTEAD OF INSERT, UPDATE
AS
	BEGIN
		IF (SELECT count(*) FROM inserted) > 0
			BEGIN
				DECLARE @employee_ssn AS INT;
				SELECT @employee_ssn = Mgr_ssn FROM inserted;

				IF (@employee_ssn) IS NULL OR ((SELECT count(*) FROM Employee WHERE Ssn=@employee_ssn) = 0)
					RAISERROR('Employee doesnt existing', 16, 1);
				ELSE
					BEGIN
						IF (SELECT COUNT(Dnumber) FROM Company.Department WHERE Mgr_ssn=@employee_ssn) >=1
							RAISERROR('Employee cant manage more than one department', 16, 1);	
						ELSE
							INSERT INTO Company.Department SELECT * FROM inserted;
					END
			END
	END

SELECT * FROM Company.Department;
SELECT * FROM Company.Employee;
INSERT INTO Company.Department VALUES ('Teste', 5, 21312332, '2013-05-16');
INSERT INTO Company.Department VALUES ('Teste', 5, NULL, '2013-05-16');
INSERT INTO Company.Department VALUES ('Teste', 5, 123456789, '2013-05-16');
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
GO
CREATE FUNCTION Company.ft_proj_info (@emp_ssn INT) RETURNS @table
TABLE([name] VARCHAR(45), [location] VARCHAR(15))
AS
	BEGIN
		INSERT @table
			SELECT Company.Project.Pname, Company.Project.Plocation FROM Company.Project
				INNER JOIN Company.Works_on ON Company.Works_on.Pno=Company.Project.Pnumber
				WHERE Works_on.Essn=@emp_ssn
		RETURN;
	END

SELECT * FROM Company.Works_on;
SELECT * FROM Company.Project;
SELECT * FROM Company.ft_proj_info(21312332);
SELECT * FROM Company.ft_proj_info(183623612);
SELECT * FROM Company.ft_proj_info(342343434);

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
create function Company.employeeDeptHighAverage (@dnumber int) returns @ProjBudget Table
	(pName varchar(30), pnumber int not null, plocation varchar(15), dnum int, budget decimal, totalbudget decimal)
as
	begin
		declare @pName as varchar(30), @pnumber as int, @prevPnumber as int, @plocation as varchar(15),
				@dnum as int, @budget as decimal, @totalbudget as decimal, @hours as decimal, @salary as decimal;
		
		declare c cursor fast_forward
		for select Pname, Pnumber, Plocation, Dnum, [Hours], Salary
		from (Company.Project join Works_on on Pnumber=Pno) join Company.Employee on Essn=Ssn
		where Dnum=@dnumber;

		open c;

		fetch c into @pName, @pnumber, @plocation, @dnum, @hours, @salary;

		select @prevPnumber = @pnumber, @budget = 0, @totalbudget = 0;

		while @@fetch_status = 0
			begin
				if @prevPnumber <> @pnumber
					begin
						insert @ProjBudget values (@pName,@prevPnumber,@plocation,@dnum,@budget,@totalbudget);
						select @prevPnumber = @pnumber, @budget = 0;
					end

					set @budget += @salary*@hours/40;
					set @totalbudget += @salary*@hours/40;

					fetch c into @pName, @pnumber, @plocation, @dnum, @hours, @salary;
			end

		close c;
		deallocate c;

		return;
	end
GO
select * from Company.employeeDeptHighAverage(3)
```

### *h)* 

```
drop trigger IF EXISTS Company.deleteDepartmentAfter
go

go
create trigger Company.deleteDepartmentAfter on Company.[Department]
after delete
as
begin
	begin transaction
		
		declare @dNumber int
		select @dNumber=Dnumber from deleted;

		if (not exists( select * from information_schema.tables where table_schema='Company' and table_name='department_deleted'))
		begin
			create table Company.department_deleted 
            (
                Dname			varchar(30) not null,
                Dnumber			int			not null,
                Mgr_ssn			char(9)			null,
                Mgr_start_date	date			null,
                
				primary key(Dnumber)
            )
			alter table Company.department_deleted add constraint deptDeletedEmp foreign key (Mgr_ssn) references Company.Employee (Ssn);
		end

		begin try
			insert into Company.department_deleted 
			select * from deleted
		end try

        begin catch
            raiserror ('Error deleting department', 16, 1)   
        end catch

	commit transaction
end
go

select * from Company.department_deleted
delete from Company.Department where Dnumber=8
```

### *i)* 

```
    Stored Procedures: Utilizadas para operações complexas de leitura e escrita, manipulação de transações e implementação de lógica de negócio que requer controle de fluxo.
    UDFs: Utilizadas para cálculos reutilizáveis, manipulação de strings, e agregações personalizadas, especialmente quando se precisa de uma função que devolve um valor dentro de uma consulta SQL.
Cada uma destas ferramentas oferece vantagens significativas dependendo do contexto em que são aplicadas. A escolha entre usar uma stored procedure ou uma UDF depende das necessidades específicas da operação e da lógica de negócio a ser implementada.
```
