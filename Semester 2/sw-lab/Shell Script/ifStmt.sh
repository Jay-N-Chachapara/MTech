#! /bin/bash
counter=10
if [ $counter -eq 9 ] 
then
     echo first condition
fi

if [ $counter -eq 10 ]
then
     echo second condition
fi

if (( $counter > 11 )) 
then
     echo third condition
else
     echo forth condition
fi

