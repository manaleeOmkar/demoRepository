#!/bin/bash
echo "Hello ubuntu!"

echo "Today is $(date)"

echo "Logged in user : $USER"

echo "Project name: "
read project

mkdir "$project"
cd "$project"


touch "main.sh" "readme.txt"

echo "Project '$project' created..."

echo "Srcipt name: $0"
echo "Number of arguments: $#"
echo "All Arguments $@"
