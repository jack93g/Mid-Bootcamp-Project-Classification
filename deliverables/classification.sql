-- 1. Create a database called credit_card_classification.

create database credit_card_classification;

-- 2. Create a table credit_card_data with the same columns as given in the csv file. You can find the names of the headers for the table in the creditcardmarketing.xlsx file. Use the same column names as the names in the excel file. Please make sure you use the correct data types for each of the columns.

use credit_card_classification;

create table credit_card_data (
Customer_Number int,
Offer_Accepted varchar(200),
Reward varchar(200),
Mailer_Type varchar(200),
Income_Level varchar(200),
No_Bank_Accounts_Open int,
Overdraft_Protection varchar(200),
Credit_Rating varchar(200),
No_Credit_Cards_Held int,
No_Homes_Owned int,
Household_Size int,
Own_Your_Home varchar(200),
Average_Balance float,
Q1_Balance int,
Q2_Balance int,
Q3_Balance int,
Q4_Balance int
);

-- 3. Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. (in this case we have already deleted the header names from the csv files). To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
-- done using import wizard

-- 4. Select all the data from table credit_card_data to check if the data was imported correctly.

select * from credit_card_data;

-- 5. Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.

alter table credit_card_data
drop column Q4_Balance;

select *
from credit_card_data
limit 10;

-- 6. Use sql query to find how many rows of data you have.

select count(*)
from credit_card_data;

-- 7. Now we will try to find the unique values in some of the categorical columns:

-- What are the unique values in the column `Offer_accepted`?

select distinct(Offer_Accepted)
from credit_card_data;
-- Yes & No

-- What are the unique values in the column `Reward`?

select distinct(Reward)
from credit_card_data;
-- Air miles, cashback & points

-- What are the unique values in the column `mailer_type`?

select distinct(Mailer_Type)
from credit_card_data;
-- letter & postcard

-- What are the unique values in the column `credit_cards_held`?

select distinct(No_Credit_Cards_Held)
from credit_card_data;
-- 1,2,3,4

-- What are the unique values in the column `household_size`?

select distinct(Household_Size)
from credit_card_data;
-- 1,2,3,4,5,6,8,9

-- 8. Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.

-- part 1
select *
from credit_card_data
order by Average_Balance desc;

-- part 2
select customer_number from (
select *,
dense_rank () over (order by Average_Balance desc) as avg_balance_rank
from credit_card_data) as sub
where avg_balance_rank <= 10;

-- 9. What is the average balance of all the customers in your data?

select round(avg(Average_Balance),2)
from credit_card_data;

-- 940.52

-- 10. In this exercise we will use group by to check the properties of some of the categorical variables in our data. Note wherever average_balance is asked in the questions below, please take the average of the column average_balance:

-- What is the average balance of the customers grouped by `Income Level`? The returned result should have only two columns, income level and `Average balance` of the customers. Use an alias to change the name of the second column.

select Income_Level, round(avg(Average_Balance),2) as Avg_balance
from credit_card_data
group by Income_Level;

-- What is the average balance of the customers grouped by `number_of_bank_accounts_open`? The returned result should have only two columns, `number_of_bank_accounts_open` and `Average balance` of the customers. Use an alias to change the name of the second column.

select No_Bank_Accounts_Open, round(avg(Average_Balance),2) as Avg_balance
from credit_card_data
group by No_Bank_Accounts_Open;

-- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column.

select Credit_Rating, avg(No_Credit_Cards_Held) as avg_card_amount
from credit_card_data
group by Credit_Rating;

-- Is there any correlation between the columns `credit_cards_held` and `number_of_bank_accounts_open`? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
-- You might also have to check the number of customers in each category (ie number of credit cards held) to assess if that category is well represented in the dataset to include it in your analysis. For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis

select No_Credit_Cards_Held, avg(No_Bank_Accounts_Open)
from credit_card_data
group by No_Credit_Cards_Held
order by No_Credit_Cards_Held;

-- doesn't seem to be a correlation. customers with 4 credit cards are a little bit more likely to have more accounts

-- 11. Your managers are only interested in the customers with the following properties:

-- Credit rating medium or high
-- Credit cards held 2 or less
-- Owns their own home
-- Household size 3 or more

-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them? Can you filter the customers who accepted the offers here?

select *
from credit_card_data
where Credit_Rating = 'Medium' or 'High'
and No_Credit_Cards_Held <= 2
and Own_Your_Home = 'Yes'
and Household_Size >= 3;

select *
from
(
select *
from credit_card_data
where Credit_Rating = 'Medium' or 'High'
and No_Credit_Cards_Held <= 2
and Own_Your_Home = 'Yes'
and Household_Size >= 3) as sub
where Offer_Accepted = 'Yes';

-- 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers. You might need to use a subquery for this problem.

select *
from credit_card_data
where Average_Balance < 
(
select avg(Average_Balance)
from credit_card_data);

-- 13. Since this is something that the senior management is regularly interested in, create a view called Customers__Balance_View1 of the same query.

create view balance_lower_than_avg as 
select *
from credit_card_data
where Average_Balance < 
(
select avg(Average_Balance)
from credit_card_data);

-- 14. What is the number of people who accepted the offer vs number of people who did not?

select count(*)
from credit_card_data
where Offer_Accepted = 'Yes';

-- 1021

select count(*)
from credit_card_data
where Offer_Accepted = 'No';

-- 16955

-- 15. Your managers are more interested in customers with a credit rating of high or medium. What is the difference in average balances of the customers with high credit card rating and low credit card rating?


select Credit_Rating, round(avg(Average_Balance),2) as avg_high
from credit_card_data
where Credit_Rating = 'High';

select Credit_Rating, round(avg(Average_Balance),2) as avg_low
from credit_card_data
where Credit_Rating = 'Low';

select 944.39 - 940.34;
-- there is only a difference in avg balance of 4.05 between customers with high and low credit scores

-- 16. In the database, which all types of communication (mailer_type) were used and with how many customers?

select Mailer_Type, count(Customer_Number)
from credit_card_data
group by Mailer_type;

-- 8842 with Letters and 9134 with Postcard

-- 17. Provide the details of the customer that is the 11th least Q1_balance in your database.

select *
from 
(
select *,
dense_rank () over (order by Q1_Balance) as Q1_rank
from credit_card_data) as sub
where Q1_rank = 11;

-- there are 3 customers who have the joint 11th lowest Q1 balance











