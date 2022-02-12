ar=(1 2 3 4 5 6)
for (( i=0; i < ${#ar[@]}; i++ ))
do
     if (( i == 2 || i ==3 || i == 4))
     then
          echo ${ar[i]}
     fi
done