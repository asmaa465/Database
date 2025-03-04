select * from Employees  

select FirstName +' '+LastName from Employees where Employees.CountryID=1

select FirstName +' '+LastName from Employees where Employees.DepartmentID=3

select FirstName +' '+LastName from Employees where Employees.MonthlySalary>5000

select FirstName +' '+LastName from Employees where Employees.ExitDate<>NULL

select FirstName +' '+LastName from Employees where Employees.BonusPerc >0.1

select FirstName +' '+LastName from Employees where Employees.HireDate >'2020-12-31'
