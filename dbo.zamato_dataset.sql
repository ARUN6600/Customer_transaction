-----------------------------------Zamato-----------------------------------------

--ANALYSIS QUESTIONS
use Zamato
select * from dbo.Zomato_Dataset

  
--1) ROLLING/MOVING COUNT OF RESTAURANTS IN INDIAN CITIES
select countrycode, count(restaurantname) as 'total no of restaurant' from dbo.Zomato_Dataset
where CountryCode = '1'
group by CountryCode

  
--2) SEARCHING FOR PERCENTAGE OF RESTAURANTS IN ALL THE COUNTRIES
select distinct(city), 
count(restaurantname) as 'Total restaurnat',
round((count(*) * 100.0)/9551,0)as 'Percentage'
from dbo.Zomato_Dataset
group by city
order by (Percentage)desc;


--3) FINDING FROM WHICH CITY AND LOCALITY IN INDIA WHERE THE MAX RESTAURANTS ARE LISTED IN ZOMATO
select top(40) city, 
Locality,
count(Has_Online_delivery) as 'No Of Restaurants'
from dbo.Zomato_Dataset
where CountryCode = '1'
and 
Has_Online_delivery = 'yes'
group by city, Locality
order by [No Of Restaurants] desc,  City asc; 


--4) TYPES OF FOODS ARE AVAILABLE IN INDIA WHERE THE MAX RESTAURANTS ARE LISTED IN ZOMATO
select CountryCode, count(distinct(cuisines)) 'no of foods' from dbo.Zomato_Dataset
where CountryCode = '1'
group by CountryCode

  
--5) MOST POPULAR FOOD IN INDIA WHERE THE MAX RESTAURANTS ARE LISTED IN ZOMATO
select top(10) cuisines as 'Top 10 Cuisines', 
count(distinct(restaurantname)) as 'No Of Restaurantname',
string_agg(restaurantname,',')as 'Restaurant Name'
from dbo.Zomato_Dataset
group by Cuisines
order by [no of restaurantname]desc;


--6) WHICH LOCALITIES IN INDIA HAS THE LOWEST RESTAURANTS LISTED IN ZOMATO
select distinct(Locality), 
string_agg(Restaurantname,',')as 'Restaurant Name',
count(Restaurantname) as 'No of Restaurant',
count(has_online_delivery) as 'online delivery'
from dbo.Zomato_Dataset
where Has_Online_delivery = 'yes'
group by Locality
order by [online delivery]asc;


--7) HOW MANY RESTAURANTS OFFER TABLE BOOKING OPTION IN INDIA WHERE THE MAX RESTAURANTS ARE LISTED IN ZOMATO
select (has_table_booking) AS 'Has Table Booking', 
count(restaurantname) as 'No of restaurantname' 
from dbo.Zomato_Dataset 
where Has_Table_booking = '1'
group by Has_Table_booking;


--8) HOW RATING AFFECTS IN MAX LISTED RESTAURANTS WITH AND WITHOUT TABLE BOOKING OPTION (Connaught Place)
select has_table_booking as 'With table booking/ Not booking', 
count(has_table_booking) 'Tables', 
round(avg(rating),1) as 'Avg Rating'
from dbo.Zomato_Dataset
where Has_Table_booking in ('1','0')
and 
Locality = 'Connaught Place'
group by Has_Table_booking
order by [With table booking/ Not booking]desc;--"1 is online/ 0 is offline"


--9) FINDING THE BEST RESTAURANTS WITH MODRATE COST FOR TWO IN INDIA HAVING INDIAN CUISINES
select distinct(RestaurantName) [Restaurant Name],
cuisines,
average_cost_for_two [Average Cost]
from dbo.Zomato_Dataset
where countrycode = '1'
and 
average_cost_for_two < (select avg(average_cost_for_two) as 'average cost' from dbo.Zomato_Dataset)

  
--10) FIND ALL THE RESTAURANTS THOSE WHO ARE OFFERING TABLE BOOKING OPTIONS WITH PRICE RANGE AND HAS HIGH RATING
select distinct(RestaurantName) [Restaurant Name], 
has_table_booking [Table Booking Option], 
average_cost_for_two [Price], 
round(rating,2)as 'Rating' 
from dbo.Zomato_Dataset
where rating >= 4
and 
Has_Table_booking = '1'
order by Rating desc, Price desc;
---------------------------------*--------------------------------------*---------------------------------*--------------------------------------*---------------------------------*--------------------------------------*

