use banking;
# Query 1: Gaining the total amount of transactions for each branch.
#1.To achieve this banking transactions for each customer at the same branch are identified.

#2. Join on banking_transactions, customer, account_customers, accounts and branches are performed. 

#3.Then if the transaction type is credit the amount is added and 
#if it is debit the amount is subtracted from the total amount.
#The amount is calculated by 'tr_amount' funtion.


drop view if exists branch_total_amount;
create view branch_total_amount as
select sub.branch_id as branch_id,
sub.branch_name as branch_name,
sub.city as city,
sum(tr_amount(sub.transaction_type, sub.amount)) as amount
from (
select bt.transaction_type,bt.amount,br.branch_id,br.branch_name,br.city from banking_transaction bt
inner join customer cu
on bt.customer_id=cu.customer_id
inner join account_customer ac_c
on cu.customer_id=ac_c.customer_id
inner join accountt acc
on ac_c.account_id=acc.account_id
inner join branch br
on acc.branch_id=br.branch_id
)as sub
group by sub.branch_id;


DELIMITER $$
create function tr_amount(tr_type varchar(30), amnt decimal(10,2)) returns decimal(10,2)
deterministic 
begin
    declare tmp decimal(10,2);
    set tmp = (case when (tr_type= 'credit') then amnt 
			else (amnt * -(1)) end) ;
    return tmp;
end $$
DELIMITER ;

#########################################################################################################################

#Query 2: Gainig average interest rate for each loan type.
#1.Inner join on customers and loan.
#2.Using avg function to calculate average interest_rate and group by to group the loan_types.

drop view if exists loan_interest_rate;
create view loan_interest_rate as
select avg(lo.interest_rate) as int_rate,
cu.first_name as first_name,
cu.last_name as last_name,
lo.loan_amount_taken as loan_amount_taken,
lo.loan_type as loan_type
from customer cu
inner join loan lo 
on cu.customer_id = lo.customer_id
group by lo.loan_type ;


#########################################################################################################################
# Query 3: Gaining the count of credit card transactions per month for each customer. 

drop view if exists customer_transaction;
create view customer_transaction as
select count(*) as 'Card_Transaction_Number_Per_Month',
sub.customer_id as customer_id,
concat(sub.first_name,' ',sub.last_name) as customer_name,
monthname(sub.transaction_date) as transaction_month
from (
select c.customer_id, c.first_name, c.last_name, tr.transaction_date from cc_transaction tr
inner join credit_card cc
on tr.cc_number = cc.cc_number
inner join customer c
on cc.customer_id=c.customer_id
) as sub
group by month(sub.transaction_date),sub.customer_id;
 
#########################################################################################################################
# Query 4: Creating a SP that accepts accountid as a parameter and returns customer's full name. 

drop procedure if exists customer_details;
delimiter $$
create procedure customer_details (in accountid int)
begin
select concat(c.first_name, ' ',c.last_name) as customer_fullname, a.account_id
from customer c
join account_customer ac
on c.customer_id = ac.customer_id
join accountt a
on ac.account_id=a.account_id
where a.account_id = accountid;
end $$
delimiter ;
#show create procedure customer_details;
call customer_details(12323200);







