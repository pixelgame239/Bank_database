create table branch
(	
	branch_name varchar(20),
	branch_city varchar(20),
	assets numeric(10,2)
	primary key(branch_name)
);
create table account
(
	acct_id char(10) ,
	balance numeric(10,2), 
	branch_name varchar(20)
	primary key(acct_id)
	foreign key (branch_name) references branch(branch_name)
);
create table customer
(
	cust_id char(10),
	cust_name varchar(20),
	cust_city varchar(20)
	primary key(cust_id)
);
create table depositor
(
	acct_id char(10),
	cust_name varchar(20),
	cust_id char(10)
	primary key(acct_id)
	foreign key (acct_id) references account(acct_id),
	foreign key (cust_id) references customer(cust_id)
);
create table loan
(
	loan_id	char(10),
	cust_name varchar(20),
	cust_id char(10),
	amount numeric(10,2),
	branch_name varchar(20)
	primary key(loan_id)
	foreign key (branch_name) references branch(branch_name),
	foreign key (cust_id) references customer(cust_id)
);
create table borrower
(
	loan_id char(10),
	branch_name varchar(20),
	cust_id char(10)
	primary key(loan_id),
	foreign key (branch_name) references branch(branch_name),
	foreign key (cust_id) references customer(cust_id),
	foreign key (loan_id) references loan(loan_id),
);
insert into branch(branch_name, branch_city, assets) values ('Hoa Lac', 'Ha Noi', 999999.99), ('Hai Xom', 'Hai Phong', 9912312), ('Hai Lua', 'Sai Gon', 9991239)
insert into account(acct_id, branch_name, balance) values ('23A921', 'Hoa Lac', 1000200.22), ('351A21', 'Hai Xom', 23113.2), ('H231B2', 'Hai Lua', 321)
insert into customer(cust_id,cust_name, cust_city) values ('A32','Lesanghyeok', 'Ha Noi'), ('B21', 'BaoCHan', 'Hai Phong'), ('C25', 'Biray', 'Sai Gon')
insert into depositor(acct_id, cust_name, cust_id) values ('23A921', 'Lesanghyeok', 'A32'), ('351A21','BaoCHan','B21'), ('H231B2', 'Biray', 'C25')
insert into loan(loan_id,cust_name,amount, branch_name, cust_id) values ('3212AB2', 'Lesanghyeok', 500.21, 'Hoa Lac', 'A32'), ('351A21','BaoCHan', 9123, 'Hai Xom', 'B21'), ('H231B2', 'Biray', 1231, 'Hai Lua', 'C25')
insert into borrower(loan_id, branch_name, cust_id) values ('3212AB2', 'Hoa Lac', 'A32'), ('351A21', 'Hai Xom', 'B21'), ('H231B2','Hai Lua', 'C25')
select * from branch
select * from account
select * from customer
select * from loan
select * from borrower
select * from depositor
--drop table account;
--drop table branch;
--drop table customer;
--drop table loan;
--drop table borrower;
--drop table depositor
