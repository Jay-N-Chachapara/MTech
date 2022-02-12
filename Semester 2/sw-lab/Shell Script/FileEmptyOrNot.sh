#! /bin/bash

echo -e "Enter file name : \c"
read f1

if [ -s $f1 ] 
then 
     echo File is not empty.
else 
     echo File is empty.
fi

echo -e "Enter another file name : \c"
read f2

if [ -s $f2 ]
then
     echo File is not empty.
else
     echo file is empty.
fi
