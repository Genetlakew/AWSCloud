SQL Server TRY CATCH 


BEGIN TRY 
--TRY block=Statment(select,insert,delete,update)  
END TRY

BEGIN CATCH
--CATCH block
END CATCH 

            select error_number() as Errornumber
           ,error_severity() as errorseverity 
           ,error_state() as errorstate
           ,error_procedure()as errorprocedure
           ,error_line() as errorline
           ,error_message() as errormessage;
       print  'I am in the catch block' 
----=======================
--TRY CATCH Example:
CREATE or Alter PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;--50/25
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO  
	 
Declare @Geni Decimal -- to store the output result we declare vareble 
Exec usp_divide 50,25,@Geni Output;
print  @Geni

Select @Geni as Result;   

------
-- To see the result message 
Select * From sys.messages
where message_id = 201  
----------=================================================
--TRY CATCH WITH TRANSACTION:

CREATE TABLE persons
(
    person_id  INT
    PRIMARY KEY IDENTITY, 
    first_name NVARCHAR(100) NOT NULL, 
    last_name  NVARCHAR(100) NOT NULL
);

CREATE TABLE deals
(
    deal_id   INT
    PRIMARY KEY IDENTITY, 
    person_id INT NOT NULL, 
    deal_note NVARCHAR(100), 
    FOREIGN KEY(person_id) REFERENCES persons(
    person_id)
);

insert into 
    persons(first_name, last_name)
values
    ('John','Doe'),
    ('Jane','Doe');

insert into 
    deals(person_id, deal_note)
values
    (1,'Deal for John Doe');

Select * From persons
Select * From deals
-----=================================
CREATE PROC usp_report_error
AS
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
GO
-------------========================================
CREATE PROC usp_delete_person(
    @person_id INT
) AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        -- delete the person
        DELETE FROM sales.persons 
        WHERE person_id = @person_id;
        -- if DELETE succeeds, commit the transaction
        COMMIT TRANSACTION;  
    END TRY
    BEGIN CATCH
        -- report exception
        EXEC usp_report_error;
        
        -- Test if the transaction is uncommittable.  
        IF (XACT_STATE()) = -1  
        BEGIN  
            PRINT  N'The transaction is in an uncommittable state.' +  
                    'Rolling back transaction.'  
            ROLLBACK TRANSACTION;  
        END;  
        
        -- Test if the transaction is committable.  
        IF (XACT_STATE()) = 1  
        BEGIN  
            PRINT N'The transaction is committable.' +  
                'Committing transaction.'  
            COMMIT TRANSACTION;     
        END;  
    END CATCH
END;
GO
-----------===========================================
select top 5* from employees

 Begin Try 
 update Employees
 set LastName =  'Melaku'
 where EmpID = 'jhone'
 End Try 
 Begin Catch
  select    error_number() as Errornumber
           ,error_severity() as errorseverity 
           ,error_state() as errorstate
           ,error_procedure()as errorprocedure
           ,error_line() as errorline
           ,error_message() as errormessage;
 End Catch 
 -----================================================================


















