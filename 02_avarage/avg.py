import math


def get_res(a, l, r):
    s = 0
    for i in range(l, r+1):
        s += math.log(a[i])
    s /= (r - l + 1)
    return math.pow(math.e, s)


n = int(input().split()[0])
ipt = list(map(float, input().split()))
q = int(input().split()[0])

a = ipt[0:n]

for iq in range(0, q):
    ipt = list(map(int, input().split()))
    print("{0:0.6f}".format(get_res(a, ipt[0], ipt[1])))
