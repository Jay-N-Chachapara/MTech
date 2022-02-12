#! /bin/bash

#1 find all loged in users
# lslogins -o USER
# users


#2 find all open ports
# netstat -a

#3 Number of lines in a file
# read f1
# wc -l $f1

#4 read input
# read a

#5 Find number of files ending with .txt
# find . -name "*.txt"

#6 ls and kind of commands
# ls
# sleep 2
# clear

# fork() and exec()

#Using an array
# ar=('a' 'b' 'c' 'd')
# echo ${ar[@]}
# echo ${#ar[@]}
# echo ${ar[3]}

# ar[3]='h'

# echo ${ar[3]}

#Using Function
# summation()
# {
#      read a
#      read b
#      c=$(( $a+$b ))
#      echo $c
# }
# summation


#String concatination
# read n1
# read n2
# n3=$n1$n2
# echo $n3


#Max among 3
# read a
# read b
# read c
# if [ $a -ge $b ]
# then
#      if [ $a -ge $c ]
#      then 
#           echo Max $a
#      else
#           echo Max $c
#      fi
# else
#      if [ $b -ge $c ]
#      then 
#           echo Max $b
#      else
#           echo Max $c
#      fi
# fi


# While Loop
# n=1
# while [ $n -le 10 ]
# do
#      echo $n
#      # sleep 1.5
#      (( n++ ))
# done



# For Loop
# for (( i=0; i <= 10; i++))
# do
#      echo $i
#      sleep 0.5
# done


# ar=('A' 'b' 'c')
# for (( i=0; i < ${#ar[@]}; i++ ))
# do
#      echo ${ar[i]}
# done


# read a
# for (( i=1; i <= $a/2; i++))
# do 
#      if (( $a % $i == 0 ))
#      then
#           echo Not Prime
#           exit
#      else
#           continue
#      fi
# done

echo "Enter number"
read num
function prime()
{
     i=2
     for (( ; i <= num/2; i++ ))
     do
          if [ $((num%i)) -eq 0 ]
          then
               echo Not Prime
               exit
          fi
     done
     if (( i >= num/2 ))
     then
          echo Prime
     fi
}
prime