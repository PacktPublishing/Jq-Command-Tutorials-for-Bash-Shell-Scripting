#!/bin/bash
jq -rn --arg input $1 '
if  $input|tonumber == 1
then
  "Your input is one"
elif $input|tonumber == 2
then
  "Your input is two"
else
  "You are new for me"
end 
'
