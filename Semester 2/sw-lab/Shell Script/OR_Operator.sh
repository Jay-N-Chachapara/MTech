#! /bin/bash

echo -e "Enter age : \c"
read age

# [] || []
if [ $age -eq 18 ] || [ $age -eq 30 ]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi

# [[ || ]]
if [[ $age -eq 18 || $age -eq 30 ]]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi

# [ -a ]
if [ $age -eq 18 -o $age -eq 30 ]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi 