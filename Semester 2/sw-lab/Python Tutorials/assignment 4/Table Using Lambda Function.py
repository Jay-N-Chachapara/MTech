num = int(input("Enter the number whose table you want to print : "))
a = list(map(lambda a : num * a,range(1,11)))
for i in range(1,11) :
    print("{0} * {1} = {2}".format(num,i,a[i-1]))
