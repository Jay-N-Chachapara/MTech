#! /bin/bash

echo -e "Enter file name : \c"
read fname

if [ -f $fname ]
then
     echo "File exist"
else
     echo There is no such file named $fname
fi