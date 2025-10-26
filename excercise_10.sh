#!/bin/bash

read -p "Enter a string:- " str

echo $str

#Length
echo "The length of string is =  ${#str}"

# Replace first
newstr=${str/hello/hi}
echo $newstr

# Replace all
newstr1=${str//h/x}
echo $newstr1

# Check contains
if [[ $str == *"vikas"* ]]; then
	echo "Found vikas!"
fi


