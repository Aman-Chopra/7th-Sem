data = LOAD 'user.csv' USING PigStorage('\t');
grp = GROUP data BY $3;
gc = FOREACH grp GENERATE group, COUNT(data);
STORE gc INTO 'Q3_output';
dump gc;
