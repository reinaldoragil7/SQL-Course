create database sesi_dua

create table energy
(country varchar(15),
city varchar(15),
continent varchar(15),
energy_type varchar(15),
production int,
co2_reduction int
);

insert into energy values
('Germany','Berlin','Europe','Solar',4500,2300000),
('China','Shanghai','Asia','Solar',7200,3800000),
('France','Marseille','Europe','Solar',3700,2100000),
('India','Bangalore','Asia','Wind',3900,2500000),
('United States','Los Angeles','America','Wind',4800,2500000),
('Brazil','Sao Paulo','America','Hydroelectric',6800,3500000),
('Canada','Vancouver','America','Hydroelectric',5200,2900000),
('Spain','Madrid','Europe','Solar',4200,2600000),
('Mexico','Mexico City','America','Wind',4300,2400000),
('Japan','Osaka','Asia','Solar',4000,2200000);


//Multiple Category continent and energy = Solar
select 
avg(production) as avg_europe_solar_production, 
max(production) as max_europe_solar_production,
min(production) as min_europe_solar_production,
avg(co2_reduction) as avg_europe_solar_co2_reduction,
max(co2_reduction) as max_europe_solar_co2_reduction,
min(co2_reduction) as min_europe_solar_co2_reduction
from energy where continent='Europe' and energy_type='Solar';

select 
avg(production) as avg_asia_solar_production, 
max(production) as max_asia_solar_production,
min(production) as min_asia_solar_production,
avg(co2_reduction) as avg_asia_solar_co2_reduction,
max(co2_reduction) as max_asia_solar_co2_reduction,
min(co2_reduction) as min_asia_solar_co2_reduction
from energy where continent='Asia' and energy_type='Solar';

select 
avg(production) as avg_america_solar_production, 
max(production) as max_america_solar_production,
min(production) as min_america_solar_production,
avg(co2_reduction) as avg_america_solar_co2_reduction,
max(co2_reduction) as max_america_solar_co2_reduction,
min(co2_reduction) as min_america_solar_co2_reduction
from energy where continent='America' and energy_type='Solar';


//Category continent and energy = Wind
select 
avg(production) as avg_europe_wind_production, 
max(production) as max_europe_wind_production,
min(production) as min_europe_wind_production,
avg(co2_reduction) as avg_europe_wind_co2_reduction,
max(co2_reduction) as max_europe_wind_co2_reduction,
min(co2_reduction) as min_europe_wind_co2_reduction
from energy where continent='Europe' and energy_type='Wind';

select 
avg(production) as avg_asia_wind_production, 
max(production) as max_asia_wind_production,
min(production) as min_asia_wind_production,
avg(co2_reduction) as avg_asia_wind_co2_reduction,
max(co2_reduction) as max_asia_wind_co2_reduction,
min(co2_reduction) as min_asia_wind_co2_reduction
from energy where continent='Asia' and energy_type='Wind';

select 
avg(production) as avg_america_wind_production, 
max(production) as max_america_wind_production,
min(production) as min_america_wind_production,
avg(co2_reduction) as avg_america_wind_co2_reduction,
max(co2_reduction) as max_america_wind_co2_reduction,
min(co2_reduction) as min_america_wind_co2_reduction
from energy where continent='America' and energy_type='Wind';


UPDATE `energy` SET `co2_reduction`='2000000' WHERE country='France';
UPDATE `energy` SET `co2_reduction`='2100000' WHERE country='India';


//Category continent and energy = Hydroelectric
select 
avg(production) as avg_europe_hydroelectric_production, 
max(production) as max_europe_hydroelectric_production,
min(production) as min_europe_hydroelectric_production,
avg(co2_reduction) as avg_europe_hydroelectric_co2_reduction,
max(co2_reduction) as max_europe_hydroelectric_co2_reduction,
min(co2_reduction) as min_europe_hydroelectric_co2_reduction
from energy where continent='Europe' and energy_type='Hydroelectric';

select 
avg(production) as avg_asia_hydroelectric_production, 
max(production) as max_asia_hydroelectric_production,
min(production) as min_asia_hydroelectric_production,
avg(co2_reduction) as avg_asia_hydroelectric_co2_reduction,
max(co2_reduction) as max_asia_hydroelectric_co2_reduction,
min(co2_reduction) as min_asia_hydroelectric_co2_reduction
from energy where continent='Asia' and energy_type='Hydroelectric';

select 
avg(production) as avg_america_hydroelectric_production, 
max(production) as max_america_hydroelectric_production,
min(production) as min_america_hydroelectric_production,
avg(co2_reduction) as avg_america_hydroelectric_co2_reduction,
max(co2_reduction) as max_america_hydroelectric_co2_reduction,
min(co2_reduction) as min_america_hydroelectric_co2_reduction
from energy where continent='America' and energy_type='Hydroelectric';


//single category continent
select 
avg(production) as avg_europe_production, 
max(production) as max_europe_production,
min(production) as min_europe_production,
avg(co2_reduction) as avg_europe_co2_reduction,
max(co2_reduction) as max_europe_co2_reduction,
min(co2_reduction) as min_europe_co2_reduction
from energy where continent='Europe';

select 
avg(production) as avg_asia_production, 
max(production) as max_asia_production,
min(production) as min_asia_production,
avg(co2_reduction) as avg_asia_co2_reduction,
max(co2_reduction) as max_asia_co2_reduction,
min(co2_reduction) as min_asia_co2_reduction
from energy where continent='Asia';

select 
avg(production) as avg_america_production, 
max(production) as max_america_production,
min(production) as min_america_production,
avg(co2_reduction) as avg_america_co2_reduction,
max(co2_reduction) as max_america_co2_reduction,
min(co2_reduction) as min_america_co2_reduction
from energy where continent='America';


//single category energy_type
select 
avg(production) as avg_solar_production, 
max(production) as max_solar_production,
min(production) as min_solar_production,
avg(co2_reduction) as avg_solar_co2_reduction,
max(co2_reduction) as max_solar_co2_reduction,
min(co2_reduction) as min_solar_co2_reduction
from energy where energy_type='Solar';

select 
avg(production) as avg_wind_production, 
max(production) as max_wind_production,
min(production) as min_wind_production,
avg(co2_reduction) as avg_wind_co2_reduction,
max(co2_reduction) as max_wind_co2_reduction,
min(co2_reduction) as min_wind_co2_reduction
from energy where energy_type='Wind';

select 
avg(production) as avg_hydroelectric_production, 
max(production) as max_hydroelectric_production,
min(production) as min_hydroelectric_production,
avg(co2_reduction) as avg_hydroelectric_co2_reduction,
max(co2_reduction) as max_hydroelectric_co2_reduction,
min(co2_reduction) as min_hydroelectric_co2_reduction
from energy where energy_type='Hydroelectric';

//Data sorting (order by)
select * from energy order by country asc;
select * from energy order by country desc;
select * from energy order by city asc;
select * from energy order by city desc;
select * from energy order by continent asc;
select * from energy order by continent desc;
select * from energy order by energy_type asc;
select * from energy order by energy_type desc;
select * from energy order by production asc;
select * from energy order by production desc;
select * from energy order by co2_reduction asc;
select * from energy order by co2_reduction desc;
