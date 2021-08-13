  Alter PROC USP_ProductEmp
@SALLARY MONEY,
@HireDate datetime
 as 
 begin 
 SELECT  Max(@sallary), Datename(Month, @Hiredate)
 From Employees
 Group by Datename(Month, Hiredate)
   
 End 
 --Exec USP_ProductColor 'black'
 
 exec USP_ProductEmp  
   @SALLARY = 3500, 
   @HireDate = 'April'

   select  Datename(Month, Hiredate) from Employees

 SELECT @color, Max(@sallary), Datename(Month, @Hiredate)
 From DimProduct
 where color =@color 
 Group by @color,Datename(Month, @Hiredate)
  
------------------------------------------------------------------------
   ---VARIABLE 
DECLARE @FirstName varchar(50) 
SET @FirstName = 'Ali'

Select FirstName,Department From Employees
Where FirstName = @FirstName  


DECLARE @Department VARCHAR(50), 
		@HireDate datetime,
		@Sallary Money

select @Department = Department,
       @HireDate = HireDate,
	   @sallary = sallary
From Employees
where EmpID = 1 

SELECT @Department as DepName, @HireDate as HireEmp, @SALLARY as EmpSalary

SELECT * FROM Employees


My Name is Yosiyas Tefera, I was born on 23/03/1984 and I have 5 pets

Declare @Name varchar(50) = 'Yosiyas Tefera'
Declare @DOB datetime = '23/03/1984' 
Declare @Pets int = 5

select 'My Name is ' + @Name + ', I was born on ' + Convert(varchar(50),@DOB,103) + 'and I have' + cast(@Pets as varchar(50)) + ' pets' as 'Fun'


select FirstName,BirthDate,Sallary From Employees

Declare @FIRSTNAME VARCHAR (50),
        @Birthdate datetime,
		@Sallary Money

 select @FIRSTNAME = FIRSTNAME,
         @Birthdate = Birthdate,
		 @Sallary = Sallary
		 From Employees
		 where EmpID = 5

SELECT @FIRSTNAME, @Birthdate, @Sallary
select FirstName,BirthDate,Sallary From Employees

------------------------------------------------------
select Max(Sallary) from Employees

 Declare @Geni Money 
 set @Geni = (select Max(Sallary) from Employees )
 select @Geni 
  

     