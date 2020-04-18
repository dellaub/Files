# ask for numbers separated by comma (ex; 1,5,4,558,6.5)
asknum = input("choose some comma separated numbers : ")

# create list
list = asknum.split(",")
# create tuple
tuple = tuple(list)

# print "list = ['1', '5', '4', '558', '6.5']"
print("List = ",list)
# print "tuple = ('1', '5', '4', '558', '6.5')"
print("Tuple = ",tuple)