#!/usr/local/bin/bash

### Function to sort a word alphabetically
func_word_sort(){
    declare -a CHAR_ARRAY
    CHAR_ARRAY=$(echo "$1" | fold -w1 | awk -F'\n' '{print}' | sort | tr -d "\n")

    SORTED_STR=${CHAR_ARRAY[@]}
    echo "${SORTED_STR}"
}

### Check if the valid args are provided
if [ $# -ne "1" ];
then
    echo "Error: Invalid number of arguments"
    exit
fi

### Store all commands in an array
declare -a CMD_LIST
CMD_LIST=$(compgen -c | sort)

SORTED_INPUT="$(func_word_sort $1)"

### Using associative array to serve the purpose of Set data structure
declare -A RESULT_SET

### Looping through the commands list to find the matching word
for cmd in ${CMD_LIST}
do
    if [ "${#SORTED_INPUT}" -ne "${#cmd}" ];
    then
        continue
    fi

    SORTED_CMD=$(func_word_sort $cmd)
    if [ $SORTED_INPUT == $SORTED_CMD ];
    then
            RESULT_SET[$cmd]="$cmd"
    fi
done

### Output code
if [ "${#RESULT_SET[*]}" -ne 0 ];
then
    echo -n "YES"
    for i in ${!RESULT_SET[*]}
    do
        echo -n "$i" | awk '{printf "\t%s",$1}'
    done
else
    echo -n "NO"
fi
echo ""