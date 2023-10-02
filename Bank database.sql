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
insert into branch(branch_name, branch_city, assets) values ('Hoa Lac', 'Ha Noi', 999999.99), ('Hai Xom', 'Hai Phong', 9912312), ('Hai Lua', 'Sai Gon', 9991239), ('Ba Dinh', 'Ha Noi', 123232)
insert into account(acct_id, branch_name, balance) values ('23A921', 'Hoa Lac', 1000200.22), ('351A21', 'Hai Xom', 23113.2), ('H231B2', 'Hai Lua', 321), ('32B2312', 'Hoa Lac', 312344), ('632B398', 'Hoa Lac', 671231)
insert into customer(cust_id,cust_name, cust_city) values ('A32','Lesanghyeok', 'Ha Noi'), ('B21', 'BaoCHan', 'Hai Phong'), ('C25', 'Biray', 'Sai Gon'), ('B31', 'Bankai', 'Ha Noi'), ('D21', 'Hanma', 'Ha Noi')
insert into depositor(acct_id, cust_name, cust_id) values ('23A921', 'Lesanghyeok', 'A32'), ('351A21','BaoCHan','B21'), ('H231B2', 'Biray', 'C25'), ('32B2312', 'Bankai', 'B31'), ('632B398', 'Hanma', 'D21')
insert into loan(loan_id,cust_name,amount, branch_name, cust_id) values ('3212AB2', 'Lesanghyeok', 500.21, 'Hoa Lac', 'A32'), ('351A21','BaoCHan', 9123, 'Hai Xom', 'B21'), ('H231B2', 'Biray', 1231, 'Hai Lua', 'C25'), ('L312', 'Bankai', 3123, 'Hoa Lac', 'B31'), ('L334', 'Hanma', 5231, 'Hoa Lac', 'D21')
insert into borrower(loan_id, branch_name, cust_id) values ('3212AB2', 'Hoa Lac', 'A32'), ('351A21', 'Hai Xom', 'B21'), ('H231B2','Hai Lua', 'C25'), ('L312', 'Hoa Lac', 'B31'), ('L334', 'Hoa Lac', 'D21') 
select loan_id, cust_name, branch_name, amount from loan where amount > 1000
select acct_id, branch_name, balance from account where balance between 321 and 1000200.22
select cust_id, cust_name, cust_city from customer where cust_id = 'A32' or cust_id = 'B21'
select * from branch where branch_name like '%ai%'
select * from branch where branch_name like 'b%'
select * from branch where branch_name like '%c'
select * from borrower, loan
select * from borrower as b, loan as l where b.loan_id = l.loan_id and b.cust_id = l.cust_id and b.branch_name = l.branch_name
select distinct loan.loan_id, loan.amount from loan, loan as test where loan.amount < test.amount
select c.cust_name, l.amount from customer as c, borrower as b, loan as l where c.cust_id = b.cust_id and b.loan_id = l.loan_id
order by loan_id DESC, amount ASC;
select AVG(assets) from branch
select max(amount) as max_amt from loan
select cust_name as urname from customer
select * from branch
select * from account
select * from customer
select * from loan
select * from borrower
select * from depositor
select all branch_city from branch
select distinct branch_city from branch
select branch_name, AVG(amount) as avg_amt from loan group by branch_name
