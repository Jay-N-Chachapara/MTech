#! /bin/bash

echo -e "Enter age : \c"
read age

# [] && []
if [ $age -gt 18 ] && [ $age -lt 30 ]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi

# [[ && ]]
if [[ $age -gt 18 && $age -lt 30 ]]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi

# [ -a ]
if [ $age -gt 18 -a $age -lt 30 ]
then 
     echo "Entered age is in the range (18,30)."
else 
     echo "Entered age is not in the range (18,30)."
fi 