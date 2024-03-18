input_line = input()
a = [int(i) for i in input_line.split()[1:]]
res = []
dict_a = {}


for elem in a:
    if elem in dict_a:
        dict_a[elem] += 1
    else:
        dict_a[elem] = 1
first = False
i = 0

for elem in a:
    if dict_a[elem] > 1:
        res.append(elem)
        dict_a[elem] -= 1


print("{}".format(len(res)), end="\n")
if res:
    print("{}".format(res[0]), end="")
    if len(res) > 1:
        for i in range(1, len(res)):
            print(" {}".format(res[i]), end="")
