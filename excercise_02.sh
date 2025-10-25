#!/bin/bash

echo "Explore function"

read -p "Enter first value : " a
read -p "Enter second value : " b

echo "The number you have entered $a and $b "

echo "Creating function"

my_function(){
	echo "Inside function"
	sum=$((a+b))
	echo "sum = $sum"
}

my_function

echo "Script end"

