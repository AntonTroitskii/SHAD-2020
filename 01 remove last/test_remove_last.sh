test_custom() {
start=$(date +%s%N)
# res=$(printf "$1" | python avg.py | tr -d "\r")
res=$(printf "$1" | $3 | tr -d "\r")
end=$(date +%s%N)

printf '%s' "$res" | od -c
printf '%s' "$2" | od -c

output="\nintput: $1 \noutput: $res \nresutl: $2"
# output=

if [ "$res" = "$2" ]
    then echo "Test OK. Elapsed time: $(($(($end-$start))/1000000)) ms"
else 
    printf "Test is not OK!$output"
fi
}

output_custom() {
    printf "$1" | $2 | tr -d "\r"
}


if [[ $1 == *".cpp" ]]; then
    g++ $1
    comand="a.exe"
else
    comand=$1
fi

ipt1="10
1 1 5 2 4 3 3 4 2 5"
opt1="5
1 5 2 4 3"

ipt2="1
1000000000"
opt2="0"

ipt3="10
1 2 3 3 2 1 4 1 2 0"
opt3="5
1 2 3 2 1"


# printf "$ipt1" | $1
# output_custom "$ipt1" $1d
test_custom "$ipt1" "$opt1" "$1"
#test_custom "$ipt2" "$opt2" "$comand"
#test_custom "$ipt3" "$opt3" "$comand"