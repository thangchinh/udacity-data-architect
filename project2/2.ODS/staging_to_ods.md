## init schema
```sql
SHOW DATABASES;
USE DATABASE UDACITYPROJECT2;
CREATE SCHEMA ODS;
USE SCHEMA ODS;
```

## Business table
```sql

create table Business (
    address string, 
    attributes variant, 
    business_id string, 
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
insert into Business 
select v:address, 
    v:attributes, 
    v:business_id, 
    v:categories,
    v:city,
    v:hours,
    v:is_open,
    v:latitude,
    v:longitude,
    v:name,
    v:postal_code,
    v:review_count,
    v:stars,
    v:state
from UDACITYPROJECT2.staging.yelp_academic_dataset_business;

select * from Business;
```

## Checkin table
```sql

create table Checkin (
    business_id string, 
    date string);
insert into Checkin 
select v:business_id, 
    v:date
from UDACITYPROJECT2.staging.yelp_academic_dataset_checkin;
select * from CHECKIN;
```

## Covid table
```sql
create table Covid (
    "Call To Action enabled" STRING, 
    "Covid Banner" STRING, 
    "Grubhub enabled" STRING, 
    "Request a Quote Enabled" STRING,
    "Temporary Closed Until" STRING,
    "Virtual Services Offered" STRING,
    "business_id" STRING,
    "delivery or takeout" STRING,
    "highlights" STRING);
insert into Covid 
select v:"Call To Action enabled", 
    v:"Covid Banner",
    v:"Grubhub enabled",
    v:"Request a Quote Enabled",
    v:"Temporary Closed Until",
    v:"Virtual Services Offered",
    v:"business_id",
    v:"delivery or takeout",
    v:"highlights"
from UDACITYPROJECT2.staging.yelp_academic_dataset_covid_features;

select * from Covid;
```

## Review table
```sql
create table Review (
    "business_id" STRING, 
    "cool" number, 
    "date" STRING, 
    "funny" number,
    "review_id" STRING,
    "stars" number,
    "text" STRING,
    "useful" number,
    "user_id" STRING);
insert into Review 
select v:"business_id", 
    v:"cool", 
    to_char(v:date::date, 'YYYYMMDD'), 
    v:"funny",
    v:"review_id",
    v:"stars",
    v:"text",
    v:"useful",
    v:"user_id"
from UDACITYPROJECT2.staging.yelp_academic_dataset_review;
select * from Review;
```

## Tip table
```sql
create table Tip (
    "business_id" STRING, 
    "compliment_count" number, 
    "date" STRING, 
    "text" STRING,
    "user_id" STRING);
insert into Tip 
select v:"business_id", 
    v:"compliment_count", 
    to_char(v:date::date, 'YYYYMMDD'), 
    v:"text",
    v:"user_id"
from UDACITYPROJECT2.staging.yelp_academic_dataset_tip;
select * from Tip;
```

## User table
```sql
create table User (
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
    "user_id" string,
    "yelping_since" string);
    
insert into User 
select     v:"average_stars",
    v:"compliment_cool",
    v:"compliment_cute",
    v:"compliment_funny",
    v:"compliment_hot",
    v:"compliment_list",
    v:"compliment_more",
    v:"compliment_note",
    v:"compliment_photos",
    v:"compliment_plain",
    v:"compliment_profile",
    v:"compliment_writer",
    v:"cool",
    v:"elite",
    v:"fans",
    v:"friends",
    v:"funny",
    v:"name",
    v:"review_count",
    v:"useful",
    v:"user_id",
    v:"yelping_since" 
from UDACITYPROJECT2.staging.yelp_academic_dataset_user;

select * from User;
```

## precipitation table
```sql
create table "precipitation" ("date" STRING, "precipitation" STRING, "precipitation_normal" DOUBLE);
insert into "precipitation"
select "date",
    "precipitation",
    "precipitation_normal"
from UDACITYPROJECT2.staging."usw00023169_las_vegas";
select * from "precipitation";
```

## temperature table
```sql
create table "temperature" ("date" STRING, "min" DOUBLE, "max" DOUBLE,  "normal_min" DOUBLE, "normal_max" DOUBLE);
insert into "temperature"
select "date",
    "min",
    "max",
    "normal_min",
    "normal_max"
from UDACITYPROJECT2.staging."usw00023169_temperature";
select * from "temperature";
```

## confirm
```sql
select * from business limit 100;
select * from checkin limit 100;
select * from covid limit 100;
select * from review limit 100;
select * from tip limit 100;
select * from user limit 100;
select * from "precipitation" limit 100;
select * from "temperature" limit 100;

select 
    re."review_id",
    re."stars",
    u."name" as User_name,
    b.name as Business_name,
    p."precipitation_normal",
    tem."normal_min",
    tem."normal_max"
from review re
inner join user u on re."user_id" = u."user_id"
inner join "precipitation" p on re."date" = p."date"
inner join "temperature" tem on re."date" = tem."date"
inner join business b on b.business_id = re."business_id"
limit 100;

select * from staging.yelp_academic_dataset_tip limit 100;

show tables;
```


