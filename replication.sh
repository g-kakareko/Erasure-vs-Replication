#!/bin/bash
for x in temp/*.txt; do
	TIMEFORMAT='%6R'
	time ./replication "$x" 25000000
	/usr/bin/time --format='%E %M %U %R' ./replication "$x" 1000000
done
# small: 1000000
# med: 25000000
# large: 200000000