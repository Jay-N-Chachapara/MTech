#! /bin/bash

echo -e "Enter first operand : \c"
read a
echo -e "Enter second operand : \c"
read b
echo ""

# $(( ))
echo "Addition : " $(( $a + $b ))
echo "Subtraction : " $(( $a - $b ))
echo "Multiplication : " $(( $a * $b ))
echo "Division : " $(( $a / $b ))
echo "Modulo : " $(( $a % $b ))

echo ""

# $(expr )

echo "Addition : " $(expr $a + $b )
echo "Subtraction : " $(expr $a - $b )
echo "Multiplication : " $(expr $a \* $b )
echo "Division : " $(expr $a / $b )
echo "Modulo : " $(expr $a % $b )