#!/bin/bash

echo "Please enter a filename with extension:"
read filename

#Declaring an associative array
declare -A productsArray

counter=0

while read line;
do
    # reading each line
    if [ $counter -gt 0 ] #Ignoring the first line
    then
    	#Getting the price from end of the line
    	price=$(echo "$line" | rev | cut -d" " -f1  | rev )
    	
    	#Ignoring the id from the line
    	name=$( echo "$line" | cut -d' ' -f2- | sed 's/ *$//g')
    	
    	if [ -n "$line" ] #Ignoring empty lines
        then
           	productsArray+=(["$price"]=$name)
        fi
    fi
    counter=$((counter+1))
done < $filename

printf "\n"
echo "Output:"

#All information is now available in the associative array
#Print the associative array as descending order
for k in "${!productsArray[@]}"
do
    echo $k' '${productsArray["$k"]}
done | sort -rn | awk '{$1=NR}1'
