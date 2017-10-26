logins = LOAD 'collect.csv' USING PigStorage(',')
	as (user:chararray, state:chararray);
logins_NY = FILTER logins by state == 'New York';
users = FOREACH logins_NY GENERATE user;
STORE users INTO 'Q1_output';
dump users;
