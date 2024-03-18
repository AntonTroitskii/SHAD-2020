test_python() {
start=$(date +%s%N)
res=$(printf "$1" | python remove_last.py | tr -d "\r")
end=$(date +%s%N)

printf '%s' "$res" | od -c
printf '%s' "$2" | od -c

output="\n intput: $1 \n output: $res \n resutl: $2"
# output=

if [ "$res" = "$2" ]
    then echo "Test OK. Elapsed time: $(($(($end-$start))/1000000)) ms"
else 
    printf "Test is not OK!$output"
fi
}

ipt="10 1 1 5 2 4 3 3 4 2 5"
res=$'5\n1 5 2 4 3'
test_python "$ipt" "$res"
