#!/bin/bash
echo "your Entered values are : "
echo $1 $2 $3 $4
args=("$@")
printf "\n"
function discount() {
if (( ${args[3]} == 10 ))
then
count=$(echo 'scale=2;' "( ${args[2]} - ((5 / 100) * ${args[2]} ))" | bc -l )
echo "Discount Price = $count"

elif (( ${args[3]} == 15 ))
then
count=$(echo 'scale=2;' "( ${args[2]} - ((7 / 100) * ${args[2]} ))" | bc -l )
echo "Discount Price = $count"

elif (( ${args[3]} == 20 ))
then
count=$(echo 'scale=2;' "( ${args[2]} - ((10 / 100) * ${args[2]} ))" | bc -l )
echo "Discount Price = $count"

else
echo "You have no discount available!"
fi
}
echo "PRODUCT DETAILS"
echo "Product Quantity = ${args[3]}"
echo "Regular Price = ${args[2]}"
discount
