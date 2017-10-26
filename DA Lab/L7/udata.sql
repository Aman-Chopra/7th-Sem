CREATE TABLE u_data (id int, item_id int, rating int, time_stamp int) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
DESCRIBE u_data;
LOAD DATA LOCAL INPATH '/home/administrator/Documents/DA_LAB_418/Lab_07/u.data' INTO TABLE u_data;
SELECT * FROM u_data;

CREATE TABLE u_user (id int, age int, gender string, occupation string, zip_code string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
DESCRIBE u_user;
LOAD DATA LOCAL INPATH '/home/administrator/Documents/DA_LAB_418/Lab_07/u.user' INTO TABLE u_user;
SELECT * FROM u_user;
