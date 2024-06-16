## init schema
```sql
SHOW DATABASES;
USE DATABASE UDACITYPROJECT2;
CREATE SCHEMA DataWarehouse;
USE SCHEMA DataWarehouse;
```

## FactReview table
```sql
create table FactReview (
    review_id STRING,
    date STRING, 
    business_id STRING, 
    user_id STRING,
    stars number);
insert into FactReview 
select "review_id",
    "date", 
    "business_id",     
    "user_id",
    "stars"    
from UDACITYPROJECT2.ODS.Review;
select * from FactReview;
```

## DimBusiness table
```sql
create table DimBusiness (
    business_id string, 
    address string, 
    attributes variant, 
    categories string,
    city string,
    hours variant,
    is_open number,
    latitude number,
    longitude number,
    name string,
    postal_code string,
    review_count number,
    stars number,
    state string);
insert into DimBusiness 
select business_id, 
    address, 
    attributes, 
    categories,
    city,
    hours,
    is_open,
    latitude,
    longitude,
    name,
    postal_code,
    review_count,
    stars,
    state
from UDACITYPROJECT2.ODS.Business;
select * from DimBusiness;
```

## DimClimate table
```sql
create table DimClimate (date STRING, min DOUBLE, max DOUBLE, normal_min DOUBLE, normal_max DOUBLE, precipitation STRING, precipitation_normal DOUBLE);
insert into DimClimate
select tem."date",
    tem."min",
    tem."max",
    tem."normal_min",
    tem."normal_max",
    pre."precipitation",
    pre."precipitation_normal"
from UDACITYPROJECT2.ODS."temperature" tem
inner join UDACITYPROJECT2.ODS."precipitation" pre on tem."date" = pre."date";
select * from DimClimate;
```

## DimUser table
```sql
create table DimUser (
    "user_id" string,
    "average_stars" number, 
    "compliment_cool" number, 
    "compliment_cute" number,
    "compliment_funny" number,
    "compliment_hot" number,
    "compliment_list" number,
    "compliment_more" number,
    "compliment_note" number,
    "compliment_photos" number,
    "compliment_plain" number,
    "compliment_profile" number,
    "compliment_writer" number,
    "cool" number,
    "elite" string,
    "fans" number,
    "friends" string,
    "funny" number,
    "name" string,
    "review_count" number,
    "useful" string,
    "yelping_since" string);
    
insert into DimUser 
select     "user_id",
    "average_stars",
    "compliment_cool",
    "compliment_cute",
    "compliment_funny",
    "compliment_hot",
    "compliment_list",
    "compliment_more",
    "compliment_note",
    "compliment_photos",
    "compliment_plain",
    "compliment_profile",
    "compliment_writer",
    "cool",
    "elite",
    "fans",
    "friends",
    "funny",
    "name",
    "review_count",
    "useful",
    "yelping_since" 
from UDACITYPROJECT2.ODS.User;

select * from DimUser;
```

## Report
```sql
select 
    re.review_id,
    re.stars,
    b.name as Business_name,
    c.precipitation_normal,
    c.normal_min,
    c.normal_max,
    u."name" as User_name
from FactReview re
inner join DimClimate c on re.date = c.date
inner join DimUser u on re.user_id = u."user_id"
inner join DimBusiness b on b.business_id = re.business_id
limit 100;
```
