#!/bin/bash
for x in medium/*.txt; do
	TIMEFORMAT='%6R'
	time ./replication "$x" 25000000
	/usr/bin/time --format='%E %M' ./replication "$x" 25000000
done
# ./rep_med.sh &>> raw_results/rep_med.txt
# small: 1000000
# med: 25000000
# large: 200000000