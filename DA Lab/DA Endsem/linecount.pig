lines = LOAD '418' AS (line:chararray);
groups = GROUP lines BY line;
counts = FOREACH groups GENERATE group, COUNT(lines);
results = ORDER counts BY $1 DESC;
dump results;
