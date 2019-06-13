#!/bin/bash
for x in medium/*.txt; do
	export TIMEFORMAT='%6R';
	time ./encoder "$x" 5 3 reed_sol_van 8 0 0
	/usr/bin/time --format='%E %M' ./encoder "$x" 5 3 reed_sol_van 8 0 0
done
# ./jes_med.sh &>> raw_results/jes_med.txt
# small: 1000000
# med: 25000000
# large: 200000000