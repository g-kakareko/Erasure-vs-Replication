#!/bin/bash
for x in small/*.txt; do
	export TIMEFORMAT='%6R';
	time ./replication "$x" 1000000
	/usr/bin/time --format='%E %M' ./replication "$x" 1000000
done
# ./rep_small.sh &> raw_results/rep_small.txt
# small: 1000000
# med: 25000000
# large: 200000000