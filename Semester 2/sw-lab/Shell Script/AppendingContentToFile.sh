#! /bin/bash

echo -e "Enter file name : \c"
read fname

if [ -f $fname ]
then
     if [ -w $fname ]
     then
          echo "Type some text and press ctrl+d to save and exit"
          cat >> $fname
     else
          echo "Entered file does not have write permission"
     fi
else
     echo "Entered file does not exist."
fi