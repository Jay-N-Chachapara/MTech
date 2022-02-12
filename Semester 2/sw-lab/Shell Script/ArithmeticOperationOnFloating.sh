#! /bin/bash

echo -e "Enter floting point - a : \c"
read a
echo -e "Enter floting point - b : \c"
read b

echo "$a+$b" | bc
echo "$a-$b" | bc
echo "$a*$b" | bc
echo "scale=2;$a/$b" | bc
echo "scale=2;sqrt($a)" | bc -l
echo "scale=2;sqrt($b)" | bc -l 
echo "scale=2;$a^$b" | bc -l