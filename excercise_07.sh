#!/bin/bash

echo "This is calculator created by vikas"

if [ $# -ne 3 ]; then
	echo "First number second operator and third number"
	exit 1
fi

num1=$1
op=$2
num2=$3

case $op in 
	+) echo "The output is = $(($num1 + $num2))";;
	-) echo "The output is = $(($num1 - $num2))";;
	\*) echo "The output is = $(($num1 * $num2))";;
	/) echo "The output is = $(($num1 / $num2))";;
	*) echo "Invalid input";;
esac
