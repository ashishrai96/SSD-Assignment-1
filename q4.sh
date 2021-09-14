#!/usr/local/bin/bash

### Constants global helper arrays declaration
declare -a INT_CONSTANTS
INT_CONSTANTS=("1" "4" "5" "9" "10" "40" "50" "90" "100" "400" "500" "900" "1000")

declare -a ROMAN_CONSTANTS
ROMAN_CONSTANTS=("I" "IV" "V" "IX" "X" "XL" "L" "XC" "C" "CD" "D" "CM" "M")

declare -A ROMAN_TO_INT_CONSTANTS
ROMAN_TO_INT_CONSTANTS=(["I"]="1" ["IV"]="4" ["V"]="5" ["IX"]="9" ["X"]="10" ["XL"]="40" ["L"]="50" ["XC"]="90" ["C"]="100" ["CD"]="400" ["D"]="500" ["CM"]="900" ["M"]="1000")


### Function definition to convert Integer Number to Roman Numeral
int_to_roman(){
    RESP=""
    NUM=$1
    IDX="${#INT_CONSTANTS[@]}"
    IDX=$((${IDX} - 1))
    while [ "$IDX" -ge "0" ]
    do
        QUO=$(($NUM / ${INT_CONSTANTS[$IDX]}))
        NUM=$(($NUM % ${INT_CONSTANTS[$IDX]}))

        if [[ $QUO -gt "0" ]];
        then
            while [ $QUO -gt "0" ]
            do
                RESP=${RESP}${ROMAN_CONSTANTS[$IDX]}
                QUO=$(( $QUO - 1 ))
            done
        fi

        IDX=$(($IDX - 1))
    done
    
    echo "$RESP"

}

### Function definition to convert Roman Numeral to Integer Number
roman_to_number(){
    RN=$1
    LEN=${#RN}
    RESP=0

    for (( i=${LEN}-1; i>=0; i-- ))
    do
        CH1=${RN:${i}:1}
        NUM1=${ROMAN_TO_INT_CONSTANTS[$CH1]}
        NUM2=""
        [ $i -lt $((${LEN}-1)) ] && CH2="${RN:$((${i}+1)):1}" && NUM2=${ROMAN_TO_INT_CONSTANTS[$CH2]}
        if [[ "$NUM2" != "" && $NUM2 -gt $NUM1 ]];
        then
            RESP=$(( $RESP - $NUM1 ))
        else
            RESP=$(( RESP + $NUM1 ))
        fi
    done

    echo $RESP
}

### Main code - START
if [[ "$#" -gt "2" ]];
then
    echo "Error: Invalid number of inputs!!"
    exit
fi

### One Input handler block
if [[ "$#" -eq "1" ]];
then
    if [[ ! "$1" =~ ^[-]?[0-9]+$ ]];
    then
        echo "Error: Invalid Input: Integer is expected!!"
        exit
    fi

    if [[ "$1" -lt "0" || "$1" -gt "3999" ]];
    then  
        echo "Error: Invalid Input: Expected range must be between 1 and 3999"
        exit
    fi

    ### Function call to Convert NUMBER to ROMAN NUMERAL
    int_to_roman $1
fi

### Two Inputs Handler block
if [[ "$#" -eq "2" ]];
then
    if [[ "$1" =~ ^[-]?[0-9]+$ && "$2" =~ ^[-]?[0-9]+$ ]];
    then
        RES=$(( $1 + $2 ))
        if [[ "$RES" -lt "0" || "$RES" -gt "3999" ]];
        then  
            echo "Error: Invalid Result: Expected range must be between 1 and 3999"
            exit
        fi
        ### Function call to Convert NUMBER to ROMAN NUMERAL
        int_to_roman $RES
    
    elif [[ "$1" =~ ^[I|V|X|L|C|D|M]+$ && "$2" =~ ^[I|V|X|L|C|D|M]+$ ]];
    then
        if [[ ! "$1" =~ ^M{0,3}(D?C{0,3}|CD|CM)?(L?X{0,3}|XL|XC)?(V?I{0,3}|IV|IX)?$ || ! "$2" =~ ^M{0,3}(D?C{0,3}|CD|CM)?(L?X{0,3}|XL|XC)?(V?I{0,3}|IV|IX)?$ ]];
        then  
            echo "Error: Invalid Input: Entered Roman Numeral is not valid"
            exit
        fi

        ### Funtion call to Convert ROMAN NUMERAL to NUMBER
        NUM1=$(roman_to_number $1)
        NUM2=$(roman_to_number $2)
        echo "$(( $NUM1 + $NUM2 ))"
    
    else
        echo "Error: Invalid Input: Expected either one/two Decimal Number or two Roman Numerals"
    fi

fi
### Main Code - END
