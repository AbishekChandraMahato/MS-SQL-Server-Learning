select *from person.person

select distinct MiddleName from person.person

select Firstname,LastName from person.person

select distinct Firstname,LastName from person.person

select *from person.person where LastName='Brown'

select *from person.person where LastName<>'Brown'

select *from person.person where LastName in ('Brown','Duffy')


select *from person.person where BusinessEntityID between 1000 and 2000

select *from person.person where FirstName like 'r%'

select *from person.person where FirstName like '%s%'

select *from person.person where FirstName not like '%s%'

select *from person.person where FirstName like '_s%' --single character before s and any characters after s


select *from person.person where FirstName like '[ABC]%' --all names whose initial chr is a or b or c and after that any chrs

select *from person.person where FirstName like '[^ABC]%'-- ! of above



select *from person.person where title is NULL or title='Ms.'

select *from person.person where lastName like 'T%' and EmailPromotion=0 

select *from person.person order by FirstName desc--default asc

select *from person.person order by BusinessEntityID

select top 10 * from person.person --when the table is large enough to decrease the performance , also for testing purposes.
select top 0.125 percent * from person.person

--group by
select sum(EmailPromotion) from person.person

select min(EmailPromotion) from person.person

select max(EmailPromotion) from person.person

select MiddleName,sum(EmailPromotion) as TotalPromotion from person.person 
group by MiddleName

select *from person.person
--indexes
create index IX_table1 on person.person (EmailPromotion asc)

create index IX_table11 on person.person (EmailPromotion asc,FirstName)

create index IX_table1 on SalesLT.Customer(FirstName asc,LastName)


create index IX_table1_1 on SalesLT.Customer(Title dsc)

--store procuders:
create procedure spgetflname
as
begin
	select FirstName,LastName from person.person
end

spgetflname

create procedure spaddrow
as
begin
	insert into table Users values('Abishek','Mahato','Vieraskuja','Espoo','Us','02770')
end


create procedure spaddrow
as
begin
	insert into table Users values('Abishek','Mahato','Vieraskuja','Espoo','Us','02770')
end

create procedure spslctrow
as
begin
select *from Users where UserId=8
end

select *from person.password
select *from person.person


--views

create view vv1
as
select *from person.person

select *from vv1
create view vWpersonbypassword
as
select FirstName,MiddleName,personType from person.person join
person.password on 
person.person.BusinessEntityID=person.password.BusinessEntityID



select*from vWpersonbypassword

create view vWV1
as
select CustomerID,Title,FirstName,MiddleName,LastName from SalesLT.Customer



Select *from SalesLT.Customer

Select *from SalesLT.Customer where Title=’Ms.’ And Suffix is NULL

Select FirstName,LastName from SalesLT.Customer order by Phone

Select distinct FirstName from SalesLT.Customer

Insert into dbo.DimCurrency(CurrencyKey, CurrencyAlternateKey, CurrencyName) 
values(11,’ IRR’, ‘Iranian Rial’)


Update SalesLT.Customer set FirstName=’ Veronica’ where FirstName=’Lucy’

Update SalesLT.Customer set EmailAddress=’ john.ford@metropolia.fi’ where FirstName=’John’ and LastName=’Ford’

Delete from SalesLT.Customer where Title=’Mr.’

Delete from SalesLT.Customer

