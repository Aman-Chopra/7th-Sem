data = LOAD 'user.csv' USING PigStorage('\t');
data_fav = FILTER data by $1 MATCHES '.* Donald Trump .*';
tweetnid = FOREACH data_fav GENERATE $1, $4;
sorted = ORDER tweetnid BY $1;
STORE sorted INTO 'Q2_output';
dump sorted;
