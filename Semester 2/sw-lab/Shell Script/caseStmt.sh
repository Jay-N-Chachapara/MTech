#! /bin/bash

echo -e "Enter any word out of this {car,bicycle,truck,bus} : \c"
read Vehical

case $Vehical in
     "car" )
          echo "You have entered car" ;;
     "bicycle" )
          echo "You have entered bicycle" ;;
     "truck" )
          echo "You have entered truck" ;;
     "bus" )
          echo "You have entered bus" ;;
     * )
          echo "You have not entered correct input" ;;
esac