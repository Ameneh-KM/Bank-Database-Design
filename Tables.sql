drop database if exists banking;
create database banking;
use banking;
set FOREIGN_KEY_CHECKS = 0;


#Create Tables
#########################################################################################################################

drop table if exists branch;
create table branch (
branch_id int not null auto_increment,
branch_name varchar(45) not null,
street_address varchar(50) not null,
city varchar(25) not null,
state char(2) not null,
postcode int not null,
phone_number varchar(12) not null,
primary key (branch_id)
) auto_increment=115;

insert into branch values
(100, 'Branch A', '123 Main Street', 'New York City', 'NY', 12345, '555-1234'),
(101, 'Branch B', '456 Elm Street', 'Los Angeles', 'CA', 67890, '555-5678'),
(102, 'Branch C', '789 Oak Street', 'Houston', 'TX', 13579, '555-9012'),
(103, 'Branch D', '321 Pine Street', 'Miami', 'FL', 24680, '555-3456'),
(104, 'Branch E', '654 Cedar Street', 'Chicago', 'IL', 98765, '555-7890'),
(105, 'Branch F', '987 Walnut Street', 'Seattle', 'WA', 43210, '555-2345'),
(106, 'Branch G', '147 Maple Street', 'Columbus', 'OH', 56789, '555-6789'),
(107, 'Branch H', '258 Birch Street', 'Philadelphia', 'PA', 87654, '555-0123'),
(108, 'Branch I', '369 Willow Street', 'Detroit', 'MI', 10987, '555-4567'),
(109, 'Branch J', '741 Oak Street', 'Houston', 'TX', 65432, '555-8901'),
(110, 'Branch K', '852 Elm Street', 'Los Angeles', 'CA', 21098, '555-2345'),
(111, 'Branch L', '963 Pine Street', 'Miami', 'FL', 54321, '555-6789'),
(112, 'Branch M', '159 Cedar Street', 'Chicago', 'IL', 87654, '555-0123'),
(113, 'Branch N', '753 Walnut Street', 'Seattle', 'WA', 43210, '555-4567'),
(114, 'Branch O', '951 Maple Street', 'Cleveland', 'OH', 76543, '555-8901');

#########################################################################################################################

drop table if exists account_type;
create table account_type (
account_type varchar(20) not null,
minimum_balance_restriction decimal(10,2) not null,
primary key (account_type)
);

insert into account_type values ('checking',2000.00),('loan',0.00),('saving',1000.00);

#########################################################################################################################
drop table if exists accountt;
create table accountt (
account_id int not null auto_increment,
account_balance decimal(10,2) not null,
branch_id int not null,
date_opened date not null,
account_type varchar(20) not null,
primary key (account_id),
key fk_account_bank_details_idx (branch_id),
key fk_account_account_type_idx (account_type),
constraint fk_account_bank_details foreign key (branch_id) references branch (branch_id),
constraint fk_account_account_type foreign key (account_type) references account_type (account_type)
);
#auto_increment=12323241;

insert into accountt values
(12323200, 1500.00, 100, '2022-01-01', 'checking'),
(12323201, 2500.00, 101, '2022-02-15', 'saving'),
(12323202, 10000.00, 102, '2022-03-10', 'loan'),
(12323203, 500.00, 103, '2022-04-05', 'checking'),
(12323204, 8000.00, 104, '2022-05-20', 'saving'),
(12323205, 6000.00, 105, '2022-06-25', 'loan'),
(12323206, 3000.00, 106, '2022-07-10', 'checking'),
(12323207, 4000.00, 107, '2022-08-15', 'saving'),
(12323208, 2000.00, 108, '2022-09-20', 'checking'),
(12323209, 7000.00, 109, '2022-10-25', 'saving'),
(12323210, 3500.00, 110, '2022-11-30', 'loan'),
(12323211, 4500.00, 111, '2022-12-05', 'checking'),
(12323212, 9000.00, 112, '2023-01-10', 'saving'),
(12323213, 5500.00, 113, '2023-02-15', 'loan'),
(12323214, 2500.00, 114, '2023-03-20', 'checking'),
(12323215, 8000.00, 115, '2023-04-25', 'saving'),
(12323216, 6000.00, 116, '2023-05-30', 'loan'),
(12323217, 3000.00, 117, '2023-06-05', 'checking'),
(12323218, 4000.00, 118, '2023-07-10', 'saving'),
(12323219, 2000.00, 119, '2023-08-15', 'checking'),
(12323220, 7000.00, 120, '2023-09-20', 'saving'),
(12323221, 3500.00, 121, '2023-10-25', 'loan'),
(12323222, 4500.00, 122, '2023-11-30', 'checking'),
(12323223, 9000.00, 123, '2023-12-05', 'saving'),
(12323224, 5500.00, 124, '2024-01-10', 'loan'),
(12323225, 2500.00, 125, '2024-02-15', 'checking'),
(12323226, 8000.00, 126, '2024-03-20', 'saving'),
(12323227, 6000.00, 127, '2024-04-25', 'loan'),
(12323228, 3000.00, 128, '2024-05-30', 'checking'),
(12323229, 4000.00, 129, '2024-06-05', 'saving'),
(12323230, 2000.00, 130, '2024-07-10', 'checking'),
(12323231, 7000.00, 131, '2024-08-15', 'saving'),
(12323232, 3500.00, 132, '2024-09-20', 'loan'),
(12323233, 4500.00, 133, '2024-10-25', 'checking'),
(12323234, 9000.00, 134, '2024-11-30', 'saving'),
(12323235, 5500.00, 135, '2024-12-05', 'loan'),
(12323236, 2500.00, 136, '2025-01-10', 'checking'),
(12323237, 8000.00, 137, '2025-02-15', 'saving'),
(12323238, 6000.00, 138, '2025-03-20', 'loan'),
(12323239, 3000.00, 139, '2025-04-25', 'checking'),
(12323240, 4000.00, 140, '2025-05-30', 'saving');
#########################################################################################################################

drop table if exists customer;

create table customer (
customer_id int not null auto_increment,
first_name varchar(45) not null,
last_name varchar(45) not null,
date_of_birth date not null,
street_address varchar(50) not null,
city varchar(25) not null,
state char(2) not null,
zipcode int not null,
email varchar(45) not null,
sex char(1) not null,
primary key (customer_id)
);
#auto_increment=42;

insert into  customer (customer_id, first_name, last_name, date_of_birth, street_address, city, state, zipcode, email, sex)
values
(1, 'John', 'Doe', '1980-05-15', '123 Main St', 'New York', 'NY', 10001, 'johndoe@example.com', 'M'),
(2, 'Jane', 'Smith', '1985-10-20', '456 Elm St', 'Los Angeles', 'CA', 90001, 'janesmith@example.com', 'F'),
(3, 'Michael', 'Johnson', '1992-07-08', '789 Oak St', 'Chicago', 'IL', 60007, 'michaeljohnson@example.com', 'M'),
(4, 'Emily', 'Brown', '1990-02-12', '321 Pine St', 'Houston', 'TX', 77002, 'emilybrown@example.com', 'F'),
(5, 'David', 'Taylor', '1982-11-30', '987 Cedar St', 'Phoenix', 'AZ', 85001, 'davidtaylor@example.com', 'M'),
(6, 'Sarah', 'Anderson', '1987-06-25', '654 Maple St', 'Philadelphia', 'PA', 19019, 'sarahanderson@example.com', 'F'),
(7, 'Matthew', 'Thomas', '1991-04-05', '890 Birch St', 'San Antonio', 'TX', 78201, 'matthewthomas@example.com', 'M'),
(8, 'Jessica', 'Wilson', '1988-09-18', '987 Walnut St', 'San Diego', 'CA', 92101, 'jessicawilson@example.com', 'F'),
(9, 'Daniel', 'Martinez', '1983-12-23', '123 Spruce St', 'Dallas', 'TX', 75201, 'danielmartinez@example.com', 'M'),
(10, 'Ashley', 'Anderson', '1994-01-10', '456 Oak St', 'San Francisco', 'CA', 94101, 'ashleyanderson@example.com', 'F'),
(11, 'Christopher', 'Harris', '1986-08-02', '789 Cedar St', 'Austin', 'TX', 73301, 'christopherharris@example.com', 'M'),
(12, 'Amanda', 'Garcia', '1993-03-28', '321 Pine St', 'Seattle', 'WA', 98101, 'amandagarcia@example.com', 'F'),
(13, 'Andrew', 'Miller', '1981-12-05', '654 Elm St', 'Boston', 'MA', 02101, 'andrewmiller@example.com', 'M'),
(14, 'Stephanie', 'Lee', '1989-05-22', '890 Oak St', 'Denver', 'CO', 80201, 'stephanielee@example.com', 'F'),
(15, 'Joseph', 'King', '1984-02-14', '987 Pine St', 'Washington', 'DC', 20001, 'josephking@example.com', 'M'),
(16, 'Nicole', 'Lopez', '1987-07-10', '123 Cedar St', 'Miami', 'FL', 33101, 'nicolelopez@example.com', 'F'),
(17, 'Joshua', 'Walker', '1992-04-01', '456 Elm St', 'Atlanta', 'GA', 30301, 'joshuawalker@example.com', 'M'),
(18, 'Lauren', 'Gonzalez', '1990-09-24', '789 Oak St', 'Detroit', 'MI', 48201, 'laurengonzalez@example.com', 'F'),
(19, 'Ryan', 'Perez', '1982-11-12', '321 Pine St', 'Minneapolis', 'MN', 55401, 'ryanperez@example.com', 'M'),
(20, 'Megan', 'Sanchez', '1987-06-19', '654 Maple St', 'Charlotte', 'NC', 28201, 'megansanchez@example.com', 'F'),
(21, 'Brandon', 'Robinson', '1991-03-02', '890 Birch St', 'Portland', 'OR', 97201, 'brandonrobinson@example.com', 'M'),
(22, 'Kayla', 'Hernandez', '1988-10-17', '987 Walnut St', 'Las Vegas', 'NV', 89101, 'kaylahernandez@example.com', 'F'),
(23, 'Justin', 'Hill', '1983-11-24', '123 Spruce St', 'New Orleans', 'LA', 70112, 'justinhill@example.com', 'M'),
(24, 'Rachel', 'Adams', '1994-02-11', '456 Oak St', 'Kansas City', 'MO', 64101, 'racheladams@example.com', 'F'),
(25, 'Jonathan', 'Baker', '1986-07-05', '789 Cedar St', 'Salt Lake City', 'UT', 84101, 'jonathanbaker@example.com', 'M'),
(26, 'Rebecca', 'Cruz', '1993-04-29', '321 Pine St', 'Nashville', 'TN', 37201, 'rebeccacruz@example.com', 'F'),
(27, 'Kevin', 'Ward', '1981-11-06', '654 Elm St', 'Indianapolis', 'IN', 46201, 'kevinward@example.com', 'M'),
(28, 'Michelle', 'Butler', '1989-06-23', '890 Oak St', 'Columbus', 'OH', 43201, 'michellebutler@example.com', 'F'),
(29, 'Thomas', 'Simmons', '1984-03-16', '987 Pine St', 'San Jose', 'CA', 95101, 'thomassimmons@example.com', 'M'),
(30, 'Samantha', 'Perry', '1987-08-11', '123 Cedar St', 'Houston', 'TX', 77002, 'samanthaperry@example.com', 'F'),
(31, 'Kyle', 'Long', '1992-05-03', '456 Elm St', 'New York', 'NY', 10001, 'kylelong@example.com', 'M'),
(32, 'Hannah', 'Bell', '1990-10-26', '789 Oak St', 'Los Angeles', 'CA', 90001, 'hannahbell@example.com', 'F'),
(33, 'Alexander', 'Wright', '1982-12-13', '321 Pine St', 'Chicago', 'IL', 60007, 'alexanderwright@example.com', 'M'),
(34, 'Olivia', 'Turner', '1987-07-08', '654 Maple St', 'Houston', 'TX', 77002, 'oliviaturner@example.com', 'F'),
(35, 'William', 'Roberts', '1991-04-02', '890 Birch St', 'Phoenix', 'AZ', 85001, 'williamroberts@example.com', 'M'),
(36, 'Emily', 'Morales', '1988-09-15', '987 Walnut St', 'Philadelphia', 'PA', 19019, 'emilymorales@example.com', 'F'),
(37, 'James', 'Russell', '1983-12-20', '123 Spruce St', 'San Antonio', 'TX', 78201, 'jamesrussell@example.com', 'M'),
(38, 'Elizabeth', 'Griffin', '1994-01-07', '456 Oak St', 'San Diego', 'CA', 92101, 'elizabethgriffin@example.com', 'F'),
(39, 'Christopher', 'Harris', '1986-08-02', '789 Cedar St', 'Dallas', 'TX', 75201, 'christopherharris@example.com', 'M'),
(40, 'Sophia', 'Young', '1993-03-27', '321 Pine St', 'San Francisco', 'CA', 94101, 'sophiayoung@example.com', 'F'),
(41, 'Jacob', 'Morgan', '1981-12-04', '654 Elm St', 'Seattle', 'WA', 98101, 'jacobmorgan@example.com', 'M');

#########################################################################################################################

drop table if exists account_customer;
create table account_customer (
account_id int not null,
customer_id int not null,
primary key (customer_id, account_id),
key fk_accounts_customer_account_idx (account_id),
key fk_accounts_customer_customer_idx (customer_id),
constraint fk_accounts_customer_account foreign key (account_id) references accountt (account_id),
constraint fk_accounts_customer_customer foreign key (customer_id) references customer (customer_id)
);

INSERT INTO `account_customer` VALUES 
(12323200, 1),
(12323201, 2),
(12323202, 3),
(12323203, 4),
(12323204, 5),
(12323205, 6),
(12323206, 7),
(12323207, 8),
(12323208, 9),
(12323209, 10),
(12323210, 11),
(12323211, 12),
(12323212, 13),
(12323213, 14),
(12323214, 15),
(12323215, 16),
(12323216, 17),
(12323217, 18),
(12323218, 19),
(12323219, 20),
(12323220, 21),
(12323221, 22),
(12323222, 23),
(12323223, 24),
(12323224, 25),
(12323225, 26),
(12323226, 27),
(12323227, 28),
(12323228, 29),
(12323229, 30),
(12323230, 31),
(12323231, 32),
(12323232, 33),
(12323233, 34),
(12323234, 35),
(12323235, 36),
(12323236, 37),
(12323237, 38),
(12323238, 39),
(12323239, 40),
(12323240, 41);

#########################################################################################################################

drop table if exists `account_type`;

create table `account_type` (
  `account_type` varchar(20) not null,
  `minimum_balance_restriction` decimal(10,2) not null,
  primary key (`account_type`)
);

insert into `account_type` values ('checking',1500.00),('loan',0.00),('saving',1000.00);


#########################################################################################################################

drop table if exists banking_transaction;

create table banking_transaction (
transaction_id int not null auto_increment,
transaction_type varchar(45) not null,
description varchar(45) default null,
amount decimal(10,2) not null,
date date not null,
customer_id int not null,
primary key (transaction_id),
key fk_transaction_customer_idx (customer_id),
constraint fk_transaction_customer foreign key (customer_id) references customer (customer_id) on delete no action on update no action
);
#auto_increment=101164;

insert into banking_transaction values

(101120, 'debit', 'Salary', 1500.00, '2023-07-01', 1),
(101121, 'credit', 'ATM', 100.00, '2023-07-02', 2),
(101122, 'debit', 'Savings to Checking', 500.00, '2023-07-03', 3),
(101123, 'credit', 'Utility Bill', 75.00, '2023-07-04', 4),
(101124, 'credit', 'Bonus', 200.00, '2023-07-05', 5),
(101125, 'debit', 'ATM', 50.00, '2023-07-06', 6),
(101126, 'credit', 'Checking to Savings', 300.00, '2023-07-07', 7),
(101127, 'credit', 'Credit Card', 100.00, '2023-07-08', 8),
(101128, 'debit', 'Refund', 75.00, '2023-07-09', 9),
(101129, 'credit', 'ATM', 20.00, '2023-07-10', 10),
(101130, 'credit', 'Savings to Checking', 150.00, '2023-07-11', 11),
(101131, 'payment', 'Utility Bill', 60.00, '2023-07-12', 12),
(101132, 'credit', 'Salary', 1500.00, '2023-07-13', 1),
(101133, 'debit', 'ATM', 100.00, '2023-07-14', 25),
(101134, 'credit', 'Checking to Savings', 500.00, '2023-07-15', 3),
(101135, 'credit', 'Utility Bill', 75.00, '2023-07-16', 4),
(101136, 'credit', 'Bonus', 200.00, '2023-07-17', 25),
(101137, 'credit', 'ATM', 50.00, '2023-07-18', 6),
(101138, 'debit', 'Savings to Checking', 300.00, '2023-07-19', 38),
(101139, 'credit', 'Credit Card', 100.00, '2023-07-20', 8),
(101140, 'deposit', 'Salary', 1500.00, '2023-07-21', 30),
(101141, 'debit', 'ATM', 100.00, '2023-07-22', 30),
(101142, 'credit', 'Checking to Savings', 500.00, '2023-07-23', 11),
(101143, 'credit', 'Utility Bill', 75.00, '2023-07-24', 12),
(101144, 'credit', 'Bonus', 200.00, '2023-07-25', 13),
(101145, 'debit', 'ATM', 50.00, '2023-07-26', 14),
(101146, 'credit', 'Savings to Checking', 300.00, '2023-07-27', 15),
(101147, 'credit', 'Credit Card', 100.00, '2023-07-28', 22),
(101148, 'credit', 'Refund', 75.00, '2023-07-29', 22),
(101149, 'credit', 'ATM', 20.00, '2023-07-30', 18),
(101150, 'credit', 'Savings to Checking', 150.00, '2023-07-31', 19),
(101151, 'credit', 'Utility Bill', 60.00, '2023-08-01', 20),
(101152, 'credit', 'Salary', 1500.00, '2023-08-02', 1),
(101153, 'credit', 'ATM', 100.00, '2023-08-03', 2),
(101154, 'credit', 'Checking to Savings', 500.00, '2023-08-04', 3),
(101155, 'credit', 'Utility Bill', 75.00, '2023-08-05', 33),
(101156, 'credit', 'Bonus', 200.00, '2023-08-06', 38),
(101157, 'credit', 'ATM', 50.00, '2023-08-07', 6),
(101158, 'credit', 'Savings to Checking', 300.00, '2023-08-08', 7),
(101159, 'credit', 'Credit Card', 100.00, '2023-08-09', 8),
(101160, 'credit', 'Salary', 1500.00, '2023-08-10', 9),
(101161, 'credit', 'ATM', 100.00, '2023-08-11', 10),
(101162, 'credit', 'Checking to Savings', 500.00, '2023-08-12', 11),
(101163, 'debit', 'Utility Bill', 75.00, '2023-08-13', 33);

#########################################################################################################################

drop table if exists credit_card;

create table credit_card (
  cc_number varchar(20) not null,
  maximum_limit decimal(10,2) not null,
  expiry_date date not null,
  credit_score int not null,
  customer_id int  not null,
  primary key (cc_number),
  key fk_credit_card_details_customer_idx (customer_id),
  constraint fk_credit_card_details_customer foreign key (customer_id) references customer (customer_id) on delete no action on update no action
);

insert into credit_card values
('1111111111111111', 5000.00, '2024-06-30', 750, 1),
('2222222222222222', 3000.00, '2023-12-31', 680, 2),
('3333333333333333', 2000.00, '2025-03-15', 720, 3),
('4444444444444444', 4000.00, '2023-09-30', 700, 4),
('5555555555555555', 2500.00, '2024-11-15', 730, 5),
('6666666666666666', 6000.00, '2023-08-31', 760, 6),
('7777777777777777', 3500.00, '2025-02-28', 690, 7),
('8888888888888888', 4500.00, '2023-07-31', 710, 8),
('9999999999999999', 5000.00, '2024-05-15', 740, 9),
('1010101010101010', 4000.00, '2023-11-30', 700, 10),
('1111222233334444', 3000.00, '2025-04-15', 720, 11),
('1212121212121212', 5500.00, '2023-10-31', 730, 12),
('1313131313131313', 2000.00, '2024-02-28', 680, 13),
('1414141414141414', 3500.00, '2023-06-30', 690, 14),
('1515151515151515', 5000.00, '2024-10-31', 750, 15),
('1616161616161616', 4000.00, '2023-12-15', 710, 16),
('1717171717171717', 2500.00, '2025-03-31', 730, 17),
('1818181818181818', 6000.00, '2023-07-31', 760, 18),
('1919191919191919', 4500.00, '2024-09-30', 740, 19),
('2020202020202020', 3500.00, '2023-11-15', 700, 20);
 
#########################################################################################################################

drop table if exists cc_transaction;

create table cc_transaction (
  transaction_id int not null auto_increment,
  cc_number varchar(20) not null,
  transaction_date date not null,
  amount decimal(10,2) not null,
  merchant_details varchar(45) not null,
  primary key (transaction_id),
  key fk_cc_transaction_details_credit_card_details_idx (cc_number),
  constraint fk_cc_transaction_details_credit_card_details foreign key (cc_number) references credit_card (cc_number) on delete no action on update no action
);
#auto_increment=101164;

insert into cc_transaction values 
(101120, '1111111111111111', '2023-01-01', 50.00, 'Merchant A'),
(101121, '5555555555555555', '2023-02-02', 100.00, 'Merchant B'),
(101122, '1616161616161616', '2023-01-03', 75.00, 'Merchant C'),
(101123, '1010101010101010', '2023-11-04', 200.00, 'Merchant D'),
(101124, '8888888888888888', '2023-03-05', 150.00, 'Merchant E'),
(101125, '1111111111111111', '2023-02-06', 80.00, 'Merchant F'),
(101126, '5555555555555555', '2023-09-07', 120.00, 'Merchant G'),
(101127, '1616161616161616', '2023-01-08', 90.00, 'Merchant H'),
(101128, '1010101010101010', '2023-01-09', 60.00, 'Merchant I'),
(101129, '8888888888888888', '2023-12-10', 70.00, 'Merchant J'),
(101130, '1111111111111111', '2023-01-11', 110.00, 'Merchant K'),
(101131, '5555555555555555', '2023-01-12', 95.00, 'Merchant L'),
(101132, '1616161616161616', '2023-11-13', 85.00, 'Merchant M'),
(101133, '1010101010101010', '2023-11-14', 130.00, 'Merchant N'),
(101134, '8888888888888888', '2023-08-15', 40.00, 'Merchant O'),
(101135, '1111111111111111', '2023-01-16', 180.00, 'Merchant P'),
(101136, '5555555555555555', '2023-01-17', 70.00, 'Merchant Q'),
(101137, '1616161616161616', '2023-09-18', 100.00, 'Merchant R'),
(101138, '1010101010101010', '2023-01-19', 150.00, 'Merchant S'),
(101139, '8888888888888888', '2023-07-20', 120.00, 'Merchant T');

#########################################################################################################################

drop table if exists loan;
create table loan (
loan_id int not null auto_increment,
duration_in_years decimal(4,2) not null,
loan_start_date date not null,
interest_rate decimal(4,2) not null,
loan_amount_taken decimal(10,2) not null,
loan_amount_repaid decimal(10,2) not null default '0.00',
loan_type varchar(45) not null,
customer_id int not null,
primary key (loan_id),
key fk_loan_details_customer_idx (customer_id),
constraint fk_loan_details_customer foreign key (customer_id) references customer (customer_id)
);
#auto_increment=4020 ;

insert into loan values
(4000, 3.5, '2022-01-01', 6.5, 10000.00, 5000.00, 'Personal', 1),
(4001, 4.0, '2022-02-01', 7.0, 15000.00, 3000.00, 'Home', 2),
(4002, 2.5, '2022-03-01', 5.5, 8000.00, 2000.00, 'Car', 3),
(4003, 5.0, '2022-04-01', 6.0, 20000.00, 10000.00, 'Education', 4),
(4004, 3.0, '2022-05-01', 7.5, 12000.00, 6000.00, 'Personal', 5),
(4005, 4.5, '2022-06-01', 6.5, 18000.00, 9000.00, 'Home', 6),
(4006, 2.0, '2022-07-01', 5.0, 6000.00, 3000.00, 'Car', 7),
(4007, 5.5, '2022-08-01', 7.0, 25000.00, 15000.00, 'Education', 8),
(4008, 3.5, '2022-09-01', 6.0, 14000.00, 7000.00, 'Personal', 9),
(4009, 4.0, '2022-10-01', 6.5, 17000.00, 8000.00, 'Home', 10),
(4010, 2.5, '2022-11-01', 5.5, 9000.00, 4000.00, 'Car', 11),
(4011, 5.0, '2022-12-01', 6.0, 22000.00, 12000.00, 'Education', 12),
(4012, 3.0, '2023-01-01', 7.5, 11000.00, 5000.00, 'Personal', 13),
(4013, 4.5, '2023-02-01', 6.5, 16000.00, 7000.00, 'Home', 14),
(4014, 2.0, '2023-03-01', 5.0, 7000.00, 2000.00, 'Car', 15),
(4015, 5.5, '2023-04-01', 7.0, 23000.00, 10000.00, 'Education', 16),
(4016, 3.5, '2023-05-01', 6.5, 13000.00, 6000.00, 'Personal', 17),
(4017, 4.0, '2023-06-01', 6.0, 16000.00, 8000.00, 'Home', 18),
(4018, 2.5, '2023-07-01', 5.5, 10000.00, 4000.00, 'Car', 19),
(4019, 5.0, '2023-08-01', 6.0, 18000.00, 9000.00, 'Education', 20);

#########################################################################################################################
SET FOREIGN_KEY_CHECKS = 1;





