use EMS



/*signup or logins*/
create table Admins(username nvarchar(50) unique,email nvarchar(50) primary key,phoneno nvarchar(30) unique,Passwords nvarchar(20),Stock int Foreign key REFERENCES stosignup(Sts_ID),Customer int Foreign key REFERENCES cussignup(Cus_ID),Sale int Foreign key REFERENCES salsignup(Sas_ID),Garment int Foreign key REFERENCES Garsignup(Gas_ID),Assistant int Foreign key REFERENCES asssignup(Ass_ID))

create table Garsignup(Gas_ID int primary key identity(1,1),Firstname nvarchar(50),Lastname nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,phoneno nvarchar(30) unique,Passwords nvarchar(20),Gender nvarchar(10),dob Date,G_stock int Foreign key REFERENCES assstock(A_ID),G_sale int Foreign key REFERENCES sale(Sa_ID))
create table salsignup(Sas_ID int primary key identity(1,1),Firstname nvarchar(50),Lastname nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,phoneno nvarchar(30) unique,Passwords nvarchar(20),Gender nvarchar(10),dob Date,S_sale int Foreign key REFERENCES sale(Sa_ID))
create table cussignup(Cus_ID int primary key identity(1,1),Firstname nvarchar(50),Lastname nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,phoneno nvarchar(30) unique,Passwords nvarchar(20),Gender nvarchar(10),dob Date,C_review int Foreign key REFERENCES reviews(R_ID))
create table stosignup(Sts_ID int primary key identity(1,1),Firstname nvarchar(50),Lastname nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,phoneno nvarchar(30) unique,Passwords nvarchar(20),Gender nvarchar(10),dob Date,St_price int Foreign key REFERENCES stockprice(S_ID),St_stock nvarchar(50) Foreign key REFERENCES stock(productname) not null unique)
create table asssignup(Ass_ID int primary key identity(1,1),Firstname nvarchar(50),Lastname nvarchar(50),username nvarchar(50) unique,email nvarchar(50) unique,phoneno nvarchar(30) unique,Passwords nvarchar(20),Gender nvarchar(10),dob Date,A_sale int Foreign key REFERENCES sale(Sa_ID))









/*Stock Tables*/
create table stock(productname nvarchar(50) Primary key,quantity nvarchar(50))
create table assstock(A_ID int primary key identity(1,1),dates Date,item int,product_name nvarchar(50) Foreign key REFERENCES stock(productname))
create table sale(Sa_ID int primary key identity(1,1),Totals int,remaining int,Disc int,Paid int,product_name nvarchar(50) Foreign key REFERENCES stock(productname))
create table stockprice(S_ID int primary key identity(1,1),price int,product nvarchar(50) Foreign key REFERENCES stock(productname))







/*====================================================
Alter Table apply Constraint here
======================================================*/
ALTER TABLE sale ADD CONSTRAINT Disc check(Disc<=60); 










/*Reviews Tables*/
create table reviews(R_ID int primary key identity(1,1),review nvarchar(150))







/*Drop Table*/
drop table Garsignup,salsignup,cussignup,asssignup,stosignup,sale,assstock,stockprice, drop table Admins        
drop table sale drop table stock
drop table assstock
drop table stockprice
drop table Garsignup
drop table salsignup 
drop table cussignup
drop table asssignup
drop table stosignup
drop table sale










/*Insert Data into stock*/
insert into stock values ('Tie','23')
insert into stock values ('Belt','23')
insert into stock values ('Watch','23')
insert into stock values ('Purse','23')
insert into stock values ('Embroidery','23')



select *from stock







/*Insert Data into Reviews*/
insert into reviews values ('Your Brand Product is very well, and its use able product for in future use')
insert into reviews values ('Your Brand Product is very Bad, and its not able to product for in future use')
insert into reviews values ('Its all over not good')
insert into reviews values ('Its seems fully bad impression ')
insert into reviews values ('Its use full')

select *from reviews







/*Insert Data into stockprice*/
insert into stockprice values ('100','Tie')
insert into stockprice values ('120','Belt')
insert into stockprice values ('235','Watch')
insert into stockprice values ('450','Purse')
insert into stockprice values ('1000','Embroidery')

select *from stockprice




/*Scalar Function apply here*/
create function percentage(@num as int,@num2 as int)
returns int
as
begin
 declare @num3 int
 set @num3=@num*100/@num2
 return (@num3)
end
/*Calculate percentage from this function*/
select dbo.percentage(500,6000)
select dbo.percentage(50,400)
select dbo.percentage(50,450)
select dbo.percentage(35,235)
select dbo.percentage(20,120)
select dbo.percentage(100,1000)
select dbo.percentage(15,515)










/*Insert Data into sale*/
insert into sale values (6000,1000,500,4500,'Embroidery')
insert into sale values (400,100,50,350,'Tie')
insert into sale values (450,100,50,300,'Purse')
insert into sale values (235,50,35,150,'Watch')
insert into sale values (120,0,20,100,'Belt')
insert into sale values (1000,100,100,800,'Embroidery')
insert into sale values (515,50,15,450,'Watch')

select *from sale

/*Update Data into Sale*/ 
UPDATE sale
SET Disc = 2
WHERE Sa_ID=7;






/*Insert Data into asstock*/
insert into assstock values ('2021/05/01',6,'Embroidery')
insert into assstock values ('2021/05/01',6,'Tie')
insert into assstock values ('2021/05/01',6,'Purse')
insert into assstock values ('2021/05/01',6,'Watch')
insert into assstock values ('2021/05/01',6,'Belt')
insert into assstock values ('2021/05/01',6,'Embroidery')
insert into assstock values ('2021/05/01',6,'Watch')









/*Update Data into asstock*/
UPDATE assstock
SET item = 2
WHERE A_ID=7;
select *from assstock








/*Insert Data into salsignup*/
insert into salsignup values ('Faizan','Munsaf','faizan','faizan@gmail.com','03328893064','pass','male','2021/05/01',1)
insert into salsignup values ('Farhan','Mughal','farhan','farhan@gmail.com','03333974323','pass','male','2021/05/01',2)
insert into salsignup values ('Umair','Ali','Umair','umair@gmail.com','0333323442323','pass','male','2021/05/01',3)
insert into salsignup values ('Khubaib','Ahmed','khubaib','khubaib@gmail.com','2323312221212','pass','male','2021/05/01',4)
insert into salsignup values ('Ahmed','Ali','Ahmed','ahmed@gmail.com','032323245543','pass','male','2021/05/01',5)

select *FROM salsignup













/*Insert Data into cussignup*/
insert into cussignup values ('Faizan','Munsaf','faizan','faizan@gmail.com','03328893064','pass','male','2021/05/01',1)
insert into cussignup values ('Farhan','Mughal','farhan','farhan@gmail.com','03333974323','pass','male','2021/05/01',2)
insert into cussignup values ('Umair','Ali','Umair','umair@gmail.com','0333323442323','pass','male','2021/05/01',3)
insert into cussignup values ('Khubaib','Ahmed','khubaib','khubaib@gmail.com','2323312221212','pass','male','2021/05/01',4)
insert into cussignup values ('Ahmed','Ali','Ahmed','ahmed@gmail.com','032323245543','pass','male','2021/05/01',5)

select *from cussignup











/*Insert Data into stosignup*/
insert into stosignup values ('Faizan','Munsaf','faizan','faizan@gmail.com','03328893064','pass','male','2021/05/01',1,'Embroidery')
insert into stosignup values ('Farhan','Mughal','farhan','farhan@gmail.com','03333974323','pass','male','2021/05/01',2,'Tie')
insert into stosignup values ('Umair','Ali','Umair','umair@gmail.com','0333323442323','pass','male','2021/05/01',3,'Belt')
insert into stosignup values ('Khubaib','Ahmed','khubaib','khubaib@gmail.com','2323312221212','pass','male','2021/05/01',4,'Watch')
insert into stosignup values ('Ahmed','Ali','Ahmed','ahmed@gmail.com','032323245543','pass','male','2021/05/01',5,'Purse')

select *from stosignup















/*Insert Data into asssignup*/
insert into asssignup values ('Faizan','Munsaf','faizan','faizan@gmail.com','03328893064','pass','male','2021/05/01',1)
insert into asssignup values ('Farhan','Mughal','farhan','farhan@gmail.com','03333974323','pass','male','2021/05/01',2)
insert into asssignup values ('Umair','Ali','Umair','umair@gmail.com','0333323442323','pass','male','2021/05/01',3)
insert into asssignup values ('Khubaib','Ahmed','khubaib','khubaib@gmail.com','2323312221212','pass','male','2021/05/01',4)
insert into asssignup values ('Ahmed','Ali','Ahmed','ahmed@gmail.com','032323245543','pass','male','2021/05/01',5)

select *from asssignup














/*Insert Data into garsignup*/
insert into Garsignup values ('Faizan','Munsaf','faizan','faizan@gmail.com','03328893064','pass','male','2021/05/01',1,1)
insert into Garsignup values ('Farhan','Mughal','farhan','farhan@gmail.com','03333974323','pass','male','2021/05/01',2,2)
insert into Garsignup values ('Umair','Ali','Umair','umair@gmail.com','0333323442323','pass','male','2021/05/01',3,3)
insert into Garsignup values ('Khubaib','Ahmed','khubaib','khubaib@gmail.com','2323312221212','pass','male','2021/05/01',4,4)
insert into Garsignup values ('Ahmed','Ali','Ahmed','ahmed@gmail.com','032323245543','pass','male','2021/05/01',5,5)

select *from Garsignup










/*Insert Data into Admin*/
insert into Admins 
values ('faizanmunsaf','faizanmunsaf@gmail.com','03328893064','faizan123',3,3,3,3,3)
insert into Admins  values('MFarhan','farhantariq@gmail.com','03104367793','farhan456',2,2,2,2,2)

select *from Admins














/*====================================================
Views Start from here
======================================================*/

/*====================================================
Create Views For Admin For Garment
======================================================*/
create view vw_AdminforGarment
as
select A.A_ID, G.Firstname, G.Lastname, G.username, G.email, G.phoneno, G.Passwords, G.Gender, G.dob, 
A.item as Totalquantity,A.product_name,
S.Totals, S.remaining, S.Disc as Discount, S.Paid
from Garsignup as G
full outer join assstock as A
on G.G_stock=A.A_ID
full outer join sale as S
on G.G_sale=Sa_ID;

select *from vw_AdminforGarment











/*====================================================
Create Views For  Admin For Sale
======================================================*/ 
Create view vw_AdminforSale
as
select A.Sa_ID, S.Firstname, S.Lastname, S.username, S.email, S.phoneno, S.Passwords, S.Gender, S.dob,
A.Totals, A.remaining, A.Disc as Discount, A.Paid 
from salsignup as S
full outer join sale as A
on S.S_sale=A.Sa_ID;

select *from vw_Adminforsale







/*====================================================
Create Views For  Admin For Customer
======================================================*/ 
create view vw_Adminforcustomer
as
select R.R_ID, C.Firstname, C.Lastname, C.username, C.email, C.phoneno, C.Passwords, C.Gender, C.dob,
R.review as Customer_Reviews
from cussignup as C
full outer join reviews as R
on C.C_review=R.R_ID;

select *from vw_Adminforcustomer











/*====================================================
Create Views For  Admin For Stock
======================================================*/ 
create view vw_AdminforStock
as
select SP.S_ID, ST.Firstname, ST.Lastname, ST.username, ST.email, ST.phoneno, ST.Passwords, ST.Gender, ST.dob,
SP.price as Product_Price,
S.productname, S.quantity
from Stosignup as ST
full outer join stockprice as SP
on ST.St_price=SP.S_ID
full outer join stock as S
on S.productname=SP.product;

select *from vw_AdminforStock 












/*====================================================
Create Views For  Admin For Assistant
======================================================*/ 
create view vw_Adminforassistant
as
select S.Sa_ID, A.Firstname, A.Lastname, A.username, A.email, A.phoneno, A.Passwords, A.Gender, A.dob,
S.Totals,S.remaining,S.Disc,S.paid,S.product_name
from asssignup as A
full outer join sale as S
on A.A_sale=S.Sa_ID;

select *from vw_Adminforassistant 













/*====================================================
Use of Agregate Function
======================================================*/ 
create view vw_totalsale
as
select	sum(Totals) as Totalsale from sale
/*====================================================
view for sale manager
======================================================*/
select *from vw_totalsale












/*====================================================
Use of Scalar Function
======================================================*/
create function quantity(@num as int)
returns int
as
begin
 return (@num - 1)
end
/*====================================================
See the Table of Quantity
======================================================*/
select dbo.quantity(21) as quantity_minus_functionality;

