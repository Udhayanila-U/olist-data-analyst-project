-- DataBase Creation
CREATE DATABASE olist_analytics;

-- DataBase USE
USE olist_analytics;

-- Ensure the database and tables
SHOW DATABASES;
SHOW TABLES;

-- Verify row counts of all table dataset
select count(*) from olist_customers_dataset;
select count(*) from olist_geolocation_dataset;
select count(*) from olist_order_items_dataset;
select count(*) from olist_order_payments_dataset;
select count(*) from olist_order_reviews_dataset;
select count(*) from olist_orders_dataset;
select count(*) from olist_products_dataset;
select count(*) from olist_sellers_dataset;
select count(*) from product_category_name_translation;



select * from olist_products_dataset;
DESCRIBE olist_products_dataset;

-- Disable SQL Safe Updates
SET SQL_SAFE_UPDATES=0;

-- Clean Blank Values
UPDATE olist_products_dataset
SET
    product_name_lenght = NULLIF(product_name_lenght, ''),
    product_description_lenght = NULLIF(product_description_lenght, ''),
    product_photos_qty = NULLIF(product_photos_qty, ''),
    product_weight_g = NULLIF(product_weight_g, ''),
    product_length_cm = NULLIF(product_length_cm, ''),
    product_height_cm = NULLIF(product_height_cm, ''),
    product_width_cm = NULLIF(product_width_cm, '');
    
 
-- Change Product Column Datatypes
    ALTER TABLE olist_products_dataset
MODIFY product_id VARCHAR(32),
MODIFY product_category_name VARCHAR(100),
MODIFY product_name_lenght INT NULL,
MODIFY product_description_lenght INT NULL,
MODIFY product_photos_qty INT NULL,
MODIFY product_weight_g INT NULL,
MODIFY product_length_cm INT NULL,
MODIFY product_height_cm INT NULL,
MODIFY product_width_cm INT NULL;


-- Create Review Table
DROP TABLE IF EXISTS olist_order_reviews_dataset;
CREATE TABLE olist_order_reviews_dataset (
    review_id TEXT,
    order_id TEXT,
    review_score TEXT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TEXT,
    review_answer_timestamp TEXT
);

-- Empty Review Table
TRUNCATE TABLE olist_order_reviews_dataset;

-- Enable Local File Import
SET GLOBAL local_infile = 1;

-- Check Local File Import
SHOW VARIABLES LIKE 'local_infile';

-- Import CSV into MySQL
LOAD DATA LOCAL INFILE 'D:/__PROJECTS__/DATA ANALYTICS PROJECT/Olist-Data-Analyst-Project/01_Raw_Data/olist_order_reviews_clean.csv'
INTO TABLE olist_order_reviews_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- Check Missing Review IDs
SELECT COUNT(*) 
FROM olist_order_reviews_dataset
WHERE review_id IS NULL OR review_id = '';

-- Limit Result
SELECT review_id, order_id
FROM olist_order_reviews_dataset
LIMIT 100000;


-- Append Missing 2 Records
LOAD DATA LOCAL INFILE 'D:/__PROJECTS__/DATA ANALYTICS PROJECT/Olist-Data-Analyst-Project/01_Raw_Data/olist_order_reviews_missing_2.csv'
INTO TABLE olist_order_reviews_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Create Geolocation Table
CREATE TABLE olist_geolocation_dataset (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);


-- Check Geolocation Structure
DESCRIBE olist_geolocation_dataset;


-- Check Local Infile
SHOW VARIABLES LIKE 'local_infile';


-- Import Geolocation 1M+ Rows
LOAD DATA LOCAL INFILE 'D:/__PROJECTS__/DATA ANALYTICS PROJECT/Olist-Data-Analyst-Project/01_Raw_Data/olist_geolocation_dataset.csv'
INTO TABLE olist_geolocation_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;