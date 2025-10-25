#!/bin/bash

echo "Run function"

is_even() {
	if [ $(($1 % 2)) -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

is_even 5
echo $?

square() {
	echo $(($1 * $1))
}

result=$(square 5)

echo "The result is : $result"
