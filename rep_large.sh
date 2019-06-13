#!/bin/bash
for x in large/*.txt; do
	export TIMEFORMAT='%6R';
	time ./replication "$x" 200000000
	/usr/bin/time --format='%E %M' ./replication "$x" 200000000
done
# ./rep_large.sh &>> raw_results/rep_large.txt
# find . -type f ! -name "*.txt" -exec rm -rf {} \;
# small: 1000000
# med: 25000000
# large: 200000000