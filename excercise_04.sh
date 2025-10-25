#!/bin/bash

# For in loop
for fruit in apple banana orange; do
	echo "I like $fruit"
done

# For loop
for ((i=1; i<=5; i++)); do
	echo "Number $i"
done

# While loop
count1=1

while [ count1 -lt 5 ]; do
	echo "Count : $count1"
	((count1++))
done

# Until loop
count2=1

until [ $count2 -gt 5 ]; do
	echo "Count : $count2"
	((count2++))
done

# Break and continue
for i in {1..10}; do
	if [ $i -eq 5 ]; then
		echo "Skipping 5"
		continue
	fi
	if [ $i -eq 8 ]; then
		echo "Breaking at 8"
		break
	fi
	echo "Number is : $i"
done

# Sum
sum=0
for i in {1..10}; do
	((sum += i))
done
echo "The sum is : $sum"

# Read file line by line
while IFS= read -r line; do
	echo "Line : $line"
done < excercise_04.sh 
