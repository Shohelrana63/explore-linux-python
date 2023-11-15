#!/bin/bash--- shohelrana

# To take first string
echo -n "Text1- "
read text1

# To take second string
echo -n "Text2- "
read text2

# To make the string into lowercase
tx1="${text1,,}"
tx2="${text2,,}"

# To delete the last character from string. like dot, question symbol etc
txt1="${tx1::-1}"
txt2="${tx2::-1}"

printf "\n"

IFS=', '

# To make the array from the string
read -a arr1 <<< "$txt1"
read -a arr2 <<< "$txt2"

count=0

for i in "${arr1[@]}"
do
  for j in "${arr2[@]}"
  do
    if [ $i == $j ]
    then
      count=$((count+1))
    fi
  done
  echo "$i - $count times"
  count=0
done
