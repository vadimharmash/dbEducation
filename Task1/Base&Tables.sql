create database PaymentBill
on
(
name = 'PaymentBill',
filename = 'D:\PaymentBill.mdf',
size = 10MB,
maxsize = 100MB
)



create table PaymentType
(
paymentNo int not null	primary key,
paymentName varchar (20) not null,
paymentOnePerson money
)

insert into PaymentType
	(paymentNo, paymentName, paymentOnePerson)
values
	(1, 'electricity', 200),
	(2, 'heating', 30),
	(3, 'waterSupply', 20),
	(4, 'gas', 10),
	(5, 'upkeep', 10),
	(6, 'phone', 10),
	(7, 'internet', 10),
	(8, 'tv', 10);


create table Dweller
(
personalAccount int NOT NULL 	primary key,
lastname varchar (20) not null,
name varchar (20) not null,
registwredPerson int not null,
preference int
)

insert into Dweller
values
	(101, 'vetrov', 'vitaly', 1, 0),
	(102, 'ivanov', 'ivan', 3, 10),
	(103, 'petrov', 'petr', 5, 15),
	(104, 'klimov', 'dima', 4, 20), 
	(105, 'rovniy', 'vlad', 5, 10);


create table peyment
(
receiptId int identity not null
	primary key,
datePay date not null,
personalAccount int not null
	foreign key references Dweller (personalAccount),
paymentNo int not null
	foreign key references PaymentType (paymentNo),
paid money
)

insert into peyment
	( datePay, personalAccount, paymentNo, paid)
values
	(getdate (), 101, 1, 200),
	(getdate (), 102, 2, 300),
	(getdate (), 103, 3, 400),
	(getdate (), 104, 4, 500),
	(getdate (), 105, 5, 600),
	('2020/03/20', 101, 2, 100),
	('2020-03-20', 102, 2, 100),
	('2020-03-20', 103, 2, 100),
	('2020-03-20', 104, 2, 100),
	('2020-03-20', 105, 2, 100),
	('2020-02-20', 101, 3, 50),
	('2020-02-20', 102, 3, 50),
	('2020-02-20', 103, 3, 50),
	('2020-02-20', 104, 3, 50),
	('2020-02-20', 105, 3, 50)

use PaymentBill;