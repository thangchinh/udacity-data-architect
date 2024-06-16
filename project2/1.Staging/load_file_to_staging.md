## init schema
```sql
CREATE DATABASE UDACITYPROJECT2;
SHOW DATABASES;
USE DATABASE UDACITYPROJECT2;
CREATE SCHEMA STAGING;
USE SCHEMA STAGING;
```

## usw00023169_las_vegas
```shell
DROP TABLE IF EXISTS usw00023169_las_vegas;
create table "usw00023169_las_vegas" ("date" STRING, "precipitation" STRING, "precipitation_normal" DOUBLE);
create or replace file format mycsvformat type='CSV' compression='auto'
field_delimiter=',' record_delimiter = '\n'  skip_header=1 error_on_column_count_mismatch=true null_if = ('NULL', 'null') empty_field_as_null = true;
create or replace stage my_large_data_stage file_format = mycsvformat;
put file:///path/udacity-data-architect/project2/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv @my_large_data_stage auto_compress=true parallel=4;
copy into "usw00023169_las_vegas" from @my_large_data_stage/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv.gz file_format=mycsvformat on_error='skip_file';
```

## usw00023169_temperature
```shell
DROP TABLE IF EXISTS usw00023169_temperature;
create table "usw00023169_temperature" ("date" STRING, "min" DOUBLE, "max" DOUBLE,  "normal_min" DOUBLE, "normal_max" DOUBLE);
put file:///path/udacity-data-architect/project2/usw00023169-temperature-degreef.csv @my_large_data_stage auto_compress=true parallel=4;
copy into "usw00023169_temperature" from @my_large_data_stage/usw00023169-temperature-degreef.csv.gz file_format=mycsvformat on_error='skip_file';
```

## yelp_academic_dataset_business
```shell
CREATE TABLE yelp_academic_dataset_business (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_business.json @my_large_data_stage auto_compress=true parallel=4;
COPY INTO yelp_academic_dataset_business
FROM @my_large_data_stage/yelp_academic_dataset_business.json.gz
    file_format = (type = json strip_outer_array = true);
```

## yelp_academic_dataset_checkin
```shell
CREATE TABLE yelp_academic_dataset_checkin (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_checkin.json @my_large_data_stage auto_compress=true parallel=4;
COPY INTO yelp_academic_dataset_checkin
FROM @my_large_data_stage/yelp_academic_dataset_checkin.json.gz
    file_format = (type = json strip_outer_array = true);
```

## yelp_academic_dataset_covid_features
```shell
CREATE TABLE yelp_academic_dataset_covid_features (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_covid_features.json @my_large_data_stage auto_compress=true parallel=8;
COPY INTO yelp_academic_dataset_covid_features
FROM @my_large_data_stage/yelp_academic_dataset_covid_features.json.gz
    file_format = (type = json strip_outer_array = true);
```

## yelp_academic_dataset_review
```shell
CREATE TABLE yelp_academic_dataset_review (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_review.json @my_large_data_stage auto_compress=true parallel=20;
COPY INTO yelp_academic_dataset_review
FROM @my_large_data_stage/yelp_academic_dataset_review.json.gz
    file_format = (type = json strip_outer_array = true);
```

## yelp_academic_dataset_tip
```shell
CREATE TABLE yelp_academic_dataset_tip (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_tip.json @my_large_data_stage auto_compress=true parallel=20;
COPY INTO yelp_academic_dataset_tip
FROM @my_large_data_stage/yelp_academic_dataset_tip.json.gz
    file_format = (type = json strip_outer_array = true);
```

## yelp_academic_dataset_user
```shell
CREATE TABLE yelp_academic_dataset_user (v variant);
put file:///path/udacity-data-architect/project2/yelp_academic_dataset_user.json @my_large_data_stage auto_compress=true parallel=20;
COPY INTO yelp_academic_dataset_user
FROM @my_large_data_stage/yelp_academic_dataset_user.json.gz
    file_format = (type = json strip_outer_array = true);
```

## confirm
```sql
show tables;
```



