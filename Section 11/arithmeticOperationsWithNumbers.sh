#!/bin/bash

export num1=$1
export num2=$2


jq -n '"Sum = " + (((env.num1 | tonumber) + ( env.num2|tonumber))|tostring)'
jq -n '"Sub = " + (((env.num1 | tonumber) - ( env.num2|tonumber))|tostring)'
jq -n '"Mul = " + (((env.num1 | tonumber) * ( env.num2|tonumber))|tostring)'
jq -n '"Div = " + (((env.num1 | tonumber) / ( env.num2|tonumber))|tostring)'
