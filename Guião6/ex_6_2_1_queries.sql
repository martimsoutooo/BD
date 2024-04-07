--A)
SELECT DISTINCT Fname, Minit,Lname, Pname, Ssn
FROM (Company.employee JOIN Company.works_on ON Ssn = Essn) Join  Company.Project ON Pno = Pnumber

--B)
WITH temp AS (
  SELECT Ssn AS supSsn
  FROM Company.employee
  WHERE Fname = 'Carlos' AND Minit = 'D' AND Lname = 'Gomes'
)
SELECT Fname, Minit, Lname
FROM Company.employee 
JOIN temp ON Super_ssn = temp.supSsn;

--C)
SELECT Pname, w.THours
FROM (
    SELECT Pno, SUM(Hours) AS THours
    FROM Company.works_on
    GROUP BY Pno
) AS w
JOIN Company.project ON w.Pno = Pnumber;

--D)
SELECT Fname, Minit, Lname, Dno
FROM Company.employee
JOIN Company.works_on ON Ssn = Essn
WHERE Dno = 3 AND Hours > 20;

--E)
SELECT Fname, Lname
FROM Company.employee 
LEFT JOIN Company.works_on ON Ssn = Essn
WHERE Pno IS NULL;

--F)

SELECT Dname, AVG(Salary) AS salario_medio
FROM Company.department
JOIN Company.employee ON Dnumber = Dno
WHERE Sex = 'F'
GROUP BY Dname;

--G)
WITH EmployeeDependentCounts AS (
    SELECT Essn, COUNT(Essn) AS count_dep
    FROM Company.dependent
    GROUP BY Essn
    HAVING COUNT(Essn) > 1
)
SELECT Fname, Lname
FROM EmployeeDependentCounts edc
JOIN Company.employee ON Essn = Ssn;

--H)
SELECT Ssn, Fname, Minit, Lname
FROM Company.employee 
JOIN Company.department ON Ssn = Mgr_ssn
LEFT JOIN Company.dependent ON Ssn = Essn
WHERE Essn IS NULL
GROUP BY Ssn, Fname, Minit, Lname;

--I)
SELECT Fname, Lname, e_Address
FROM Company.employee
JOIN (
    SELECT Dnum
    FROM Company.project 
    JOIN Company.dept_locations ON Dnum = Dnumber
    WHERE Dlocation != 'Aveiro' AND Plocation = 'Aveiro'
) as projetos ON Dno = projetos.Dnum;




