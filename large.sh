#!/bin/bash
for x in {0..10..1}
do
	./randGen 200000000 > "large/$x.txt"
done
# small: 1000000
# med: 25000000
# large: 200000000