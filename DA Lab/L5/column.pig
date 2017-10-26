data = load 'file1_418' using PigStorage();
col = foreach data generate $1 as col2
dump col;
