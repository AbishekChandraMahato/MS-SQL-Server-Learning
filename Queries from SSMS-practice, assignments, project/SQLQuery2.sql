create table tblGender
(
ID int not null primary key,
Gender nvarchar(50) not null


)

alter table tbl_person add constraint tblperso_genderid_fk
foreign key (GenderId) references tblGender(Id)


select *from tbl_person

select *from tblGender

insert into tbl_person (Id,Name,Email) values(4,'mike','m@gmail.com')

alter table tbl_person add constraint df_tblperson_genderid default 3 for GenderId

insert into tblGender values (3,'unknown')

alter table tbl_person drop constraint df_tblperson_genderid

create table table1(
ColumnName nvarchar(50) not null primary key,
DataType nvarchar(50) not null,
AllowNulls bit


)

select *from tblGender

insert into tblGender(ID,Gender) values(001,'Male')
insert into tblGender(ID,Gender) values(002,'Female')

alter table tblgender add messages1 varchar(200)

 update tblGender set gender='XXX' where gender='female'

 delete from tblGender where Gender='XXX'

 delete from tblGender

 select count(*) from tblGender

create procedure spaddrow
as
begin
	insert into  tblgender values(4,'sdf','sdfsfd','sdf')
end

spaddrow

select *from table1
select *from tblGender
--triggers
create trigger tr_table1_forinsert
on table1
for insert 
as
begin
select *from inserted--special table used by triggers , only available in context of trigger
end

insert into table1 values(2,'varchar',null)

create trigger tr_Order_forInsert
on table Order
for insert
as 
begin

declare @id int
select @id=id from inserted

update table Customer set OrderCount=count(OrderCount)+1 where CustomerID=id

end


create trigger tr_Order_fordelete
on table Order
for delete
as
begin 
declare @id int
select @id=id from deleted

update table Customer set OrderCount=count(OrderCount)-1 where CustomerID=id
end

