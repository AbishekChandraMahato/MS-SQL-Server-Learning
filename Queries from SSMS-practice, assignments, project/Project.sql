--Step1
--database creation
create database AbishekDB

--Step2
--table 1
create table Products(
ProductId int primary key not null identity,
ProductName nvarchar(100) not null,
Price int not null,
Descriptions nvarchar(1000) ,
ManufacturedDate datetime,
Quantity int not null,
Brand nvarchar(50) not null,

)

--table 2
create table Customers(
CustomerId int primary key identity not null,
CustomerName nvarchar(50) not null,
Addresses nvarchar(50),
Phone int not null unique,
Email nvarchar(50) not null unique,
Gender nvarchar(10) not null,
Age int not null
 

)

--table 3
create table Orders(
OrderId int primary key identity not null,
CustomerId int not null,
ProductId int not null,
OrderDate datetime not null default current_timestamp

)

--adding foreign keys

	alter table Orders add constraint orders_CustomerId_fk foreign key 
	(CustomerId) references Customers(CustomerId) 

	alter table Orders add constraint orders_ProductId_fk foreign key
	(ProductId) references Products(ProductId)

	--step 3
	 
	--step 4
	--query 1
	select *from Customers
	--query 2
	select *from Products where Quantity='0'
	--query 3
	select OrderId,ProductId,OrderDate,CustomerName,Age,Gender from Orders
	join
	Customers 
	on Orders.CustomerId=Customers.CustomerId
	where Customers.Age>24 and Customers.Gender='female' and year(Orders.OrderDate)='2015'
	
	--query 4
	select count(ProductId) from Orders
	--query 5
	insert into products values('x perfume',25,'chocolate flavoured','24 jan 2017',10,'axee')
	--query 6
	insert into Customers values('mamta mahato','',8485824,'mam@hmail.com','female',50)

	--query 7
	update  customers set CustomerName='Dhiraj Prasad Koirala' where CustomerId=8

	--query 8
	update Products set Quantity=150 where ProductId=4
	--query 9

	delete from Products where quantity=0

	--query 10
	delete from Customers where Addresses=''

	select *from Orders
	select *from Customers
	select *from Products
	--step 5 Indexes:
	create index IX_Customers1 on Customers(CustomerName asc,Age asc)
	create index IX_Orders1 on Orders(Orderdate asc)

	--step 6 Stored procedures:
	create procedure spaddrow
	as
	begin
	select *from Customers where CustomerId=9
	select *from Orders where CustomerId=9
	end

	create procedure spSelect
	as begin
	update Products set Quantity=0 where ProductId=2
	end
	
	spSelect

	select *from Orders where 

	create procedure spDell
	as begin
	delete from Orders where OrderDate<'2015-04-01' 
	
	end

	spDell

	--step 7 triggers
create trigger tr_Orders_forInsert
on  Orders
for insert
as 
begin

declare @id int
select @id=ProductId from inserted

update  Products set Quantity=Quantity-1 where ProductId=@id

end

insert into Orders values(7,6,'26 jul, 2015')


create trigger tr_Orders_forDel
on  Customers
for delete
as 
begin

declare @id int
select @id=CustomerId from deleted

delete from  Orders  where CustomerId=@id

end

delete from Customers where CustomerId=9



	--step 8-views:
	create view vWV1
	as
	select *from Orders
	

	create view vWV2
	as
	select Customers.CustomerId,Customers.CustomerName,Orders.OrderDate from Orders inner join
Customers on Orders.CustomerId=Customers.CustomerId where Orders.OrderDate>'2015'
	

create view vWV3
as
select *from Customers where CustomerName like 's%' and Age<40

 

select *from vWV3


--Step 9 functions
declare @y int
declare @x int
set @x=12345689
set @y=len(@x)
select @y



create function getCorrectNumbers(@num int)
returns varchar(30)
as
begin
	declare @X varchar(30);

	set @X=
		case
			when(len(@num)=9)
			then 'correct'
			else 'not correct'
		end
	return  @X
end

select dbo.getCorrectNumbers(546522222) as x



