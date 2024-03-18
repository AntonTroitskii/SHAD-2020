test_custom() {
start=$(date +%s%N)
# res=$(printf "$1" | python avg.py | tr -d "\r")
res=$(printf "$1" | $3 | tr -d "\r")
end=$(date +%s%N)

# printf '%s' "$res" | od -c
# printf '%s' "$2" | od -c

output="\nintput: $1 \noutput: $res \nresutl: $2"
# output=

if [ "$res" = "$2" ]
    then echo "Test OK. Elapsed time: $(($(($end-$start))/1000000)) ms"
else 
    printf "Test is not OK!$output"
fi
}


ipt1="8
79.02 36.68 79.83 76.00 95.48 48.84 49.95 91.91
10
0 0
0 1
0 2
0 3
0 4
0 5
0 6
0 7
1 7
2 7"

opt1="79.020000
53.837288
61.391865
64.756970
69.986085
65.913194
63.352986
66.369195
64.735454
71.164108"


ipt2="1
1.00
1
0 0"

opt2="1.000000"

ipt3="8
1.34 1.37 1.40 1.44 1.91 1.95 1.96 1.97
5
1 4
2 7
4 6
0 3
2 6"

opt3="1.515518
1.752724
1.939879
1.387008
1.712233"

test_custom "$ipt1" "$opt1" "$1"
test_custom "$ipt2" "$opt2" "$1"
test_custom "$ipt3" "$opt3" "$1"
