#!/bin/bash
for x in large/*.txt; do
	export TIMEFORMAT='%6R';
	time ./encoder "$x" 5 3 reed_sol_van 8 0 0
	/usr/bin/time --format='%E %M' ./encoder "$x" 5 3 reed_sol_van 8 0 0
done
# ./jes_large.sh &>> raw_results/jes_large.txt
# small: 1000000
# med: 25000000
# large: 200000000