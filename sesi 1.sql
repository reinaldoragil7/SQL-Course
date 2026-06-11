create table phone
(country varchar(15),
city varchar(15),
region varchar(15),
segment varchar (15), 
sales double,
profit double);

insert into phone values
('Tunisia','Tunis','Northern','Commercial',772.52,-46.35), 
('Nigeria','Kano','Western','Commercial',626.23,-31.31), 
('Benin','Cotonou','Western','Commercial',435.48,8.71), 
('Congo','Brazzaville','Middle','Residential',949.63,-47.48), 
('Guinea','Conakry','Western','Public',10.69,-0.75), 
('Cameroon','Douala','Middle','Public',678.52,-27.14), 
('Botswana','Gaborone','Southern','Commercial',953.86,95.39), 
('Lesotho','Maseru','Southern','Public',484.25,33.9), 
('Sudan','Khartoum','Northern','Residential',921.68,36.87), 
('Zambia','Lusaka','Eastern','Public',751.73,-15.03);

select country,region,profit from phone;
select * from phone;

select sum(profit) as total_profit_northern from phone where region='Northern';
select sum(profit) as total_profit_western from phone where region='Western';
select sum(profit) as total_profit_middle from phone where region='Middle';
select sum(profit) as total_profit_southern from phone where region='Southern';
select sum(profit) as total_profit_eastern from phone where region='Eastern';

select sum(sales) as total_sales_northern from phone where region='Northern';
select sum(sales) as total_sales_western from phone where region='Western';
select sum(sales) as total_sales_middle from phone where region='Middle';
select sum(sales) as total_sales_southern from phone where region='Southern';
select sum(sales) as total_sales_eastern from phone where region='Eastern';

select sum(profit) as total_profit_commercial from phone where segment='Commercial';
select sum(profit) as total_profit_residential from phone where segment='Residential';
select sum(profit) as total_profit_public from phone where segment='Public';

select sum(sales) as total_sales_commercial from phone where segment='Commercial';
select sum(sales) as total_sales_residential from phone where segment='Residential';
select sum(sales) as total_sales_public from phone where segment='Public';


//PERSINGKAT QUERY AGGREGATE FUNCTION DENGAN KATEGORI SAMA
select sum(profit) as total_profit_northern, sum(sales) as total_sales_northern 
from phone where region='Northern';
select sum(profit) as total_profit_western, sum(sales) as total_sales_western
from phone where region='Western';
select sum(profit) as total_profit_middle, sum(sales) as total_sales_middle
from phone where region='Middle';
select sum(profit) as total_profit_southern, sum(sales) as total_sales_southern
from phone where region='Southern';
select sum(profit) as total_profit_eastern, sum(sales) as total_sales_eastern
from phone where region='Eastern';


select sum(profit) as total_profit_commercial, sum(sales) as total_sales_commercial from phone where segment='Commercial';
select sum(profit) as total_profit_residential, sum(sales) as total_sales_residential 
from phone where segment='Residential';
select sum(profit) as total_profit_public, sum(sales) as total_sales_public 
from phone where segment='Public';




