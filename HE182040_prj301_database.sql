use [master]
go
drop database if exists HE182040
go
create database HE182040
go
use HE182040
go

create table account(
	accountID int IDENTITY(1,1) PRIMARY KEY,
	accountUsername nvarchar(100) not null,
	accountPassword nvarchar(100) not null,
	accountFullname nvarchar(100) not null,
	accountEmail nvarchar(100) default 'No email found',
	accountPhone nvarchar(20) default 'No phone found',
	accountAddress nvarchar(100) default 'No address found',
	accountType int default 1,
)
go
insert into account(accountUsername,accountPassword,accountFullname,accountEmail,accountPhone,accountAddress,accountType)
values ('duclahe182040', '12345', 'Le Anh Duc', 'leanhduc583@gmail.com', '0375022034', 'Hanoi', 6),
	   ('cbowld4', '12345', 'Caresa Bowld', 'cbowld4@adobe.com', '0319295667', '3 Harbort Court', 3),
	   ('lmilbank2', '12345', 'Lynda Milbank', 'lmilbank2@example.com', '0976379365', '0450 Calypso Parkway', 1),
	   ('cmarcq0', '12345', 'Cirilo Marcq', 'cmarcq0@marriott.com', '0272810843', '2791 Twin Pines Court', 5)
insert into account(accountUsername,accountPassword,accountFullname)
values('ducla', '12345', 'Le Duc Anh')
go
--update account set accountPassword = '12345', accountAddress = 'tphcm' where accountUsername like 'ducla'
--update account set accountPassword = ? accountFullname = ?, accountEmail = ?, accountPhone = ?, accountAddress = ? where accountUsername like ?
--select * from account
--delete from orders where accountID < 100
--delete from account where accountID < 100
--DBCC CHECKIDENT (account, RESEED, 0);



create table product(
	productID int IDENTITY(1,1) PRIMARY KEY,
	productName nvarchar(50) not null,
	productType int not null,
	productPrice float not null,
)
go
insert into product(productName,productType,productPrice)
values ('Room A', 1,52.99),('Room B', 1,30.99),('Villa A', 3, 32.99),('Homestay A', 2, 97.99),('Homestay B', 2, 27.99),('Room C', 1, 68.99),
       ('Room D', 1,75.99),('Homestay C', 2, 88.99),('Villa B', 3, 76.99),('Villa C', 3, 42.99),('Room E', 1, 33.99),('Villa D', 3, 74.99),
	   ('Homestay D', 2, 18.99),('Homestay E', 2, 38.99),('Room F', 1, 19.99),('Homestay F', 2 , 35.99),('Villa E', 3, 43.99),('Villa F', 3, 82.99)
go
--select * from product 
--delete from product where productID < 100
--DBCC CHECKIDENT (product, RESEED, 0);



create table orders(
	orderID int IDENTITY(1,1) PRIMARY KEY,
	accountID int,
	productID int,
	orderDay int default 1,
	FOREIGN KEY (accountID) REFERENCES account(accountID),
	FOREIGN KEY (productID) REFERENCES product(productID),
)
go
insert into orders(accountID,productID,orderDay)
values (2, 2, 5), (3, 2, 3), (4, 15, 5), (1, 8, 5), (1, 11, 1), (1, 16, 5),
       (1, 4, 1), (2, 13, 3), (3, 3, 4), (2, 1, 5), (2, 14, 5), (1, 15, 3),
	   (2, 15, 1), (4, 2, 1), (1, 7, 2), (4, 5, 3), (4, 14, 1), (3, 16, 3)
	   go
--select * from orders 
--select o.orderID, o.accountID, o.productID, p.productName, p.productPrice, o.orderDay from orders o join product p on o.productID = p.productID
--delete from orders where orderID < 100
--DBCC CHECKIDENT (orders, RESEED, 0);