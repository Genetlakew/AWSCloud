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
 
 exec USP_ProductEmp  2500, '1905-05-26'
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
--where EmpID = 1

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
  
  select distinct color
  From DimProduct

  select Name
  From Production.ProductSubcategory
     

	 
	 select Class, Color,EnglishProductName,SalesAmount,TaxAmt
	 from DimProduct p
	 Inner Join FactInternetSales S
	 On P.ProductKey = S. ProductKey
	 Where color= 'Black'
	  

     select distinct class 
	 from DimProduct 



Declare @MonthYear Date = '2011-07-01'

SELECT [ProductKey]
      ,[ProductAlternateKey]     
      ,[EnglishProductName]
      ,[SpanishProductName]
      ,[FrenchProductName]
      ,[StandardCost]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[ListPrice]     
      ,[Class]
      ,[Style]
      ,[ModelName]
      ,[StartDate]
  FROM [AdventureWorksDW2016].[dbo].[DimProduct]
  Where Datepart(mm,[StartDate]) = Datepart(mm,@MonthYear) 
  And 
  Datepart(YYYY,[StartDate]) = Datepart(YYYY,@MonthYear) 

Create proc Geni(@MonthDate Date)
as 
Begin
with Datelist
as
  (
  Select Cast('2011-07-01' as Date) as MonthDate, 1 Lvl
  Union all
  Select Dateadd(mm,1,Monthdate),Lvl +1 From Datelist Where lvl < 6
  )
  Select Monthdate From Datelist
End

Exec Geni @MonthDate = '2011-08-01'