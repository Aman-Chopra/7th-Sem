lines = LOAD '418' USING PigStorage('\n') AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) AS word;
groups = GROUP words BY word;
counts = FOREACH groups GENERATE group, COUNT(words);
dump counts;
