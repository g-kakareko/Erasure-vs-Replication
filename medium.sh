#!/bin/bash
for x in {0..100..1}
do
	./randGen 25000000 > "medium/$x.txt"
done
# small: 1000000
# med: 25000000
# large: 200000000