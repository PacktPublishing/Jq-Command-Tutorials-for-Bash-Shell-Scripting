#!/bin/bash

response=$(curl -s http://192.168.0.110:8080/secrets | jq ".")
userName=$(echo ${response} | jq -r ".secrets.remoteServerCreds.userName")
password=$(echo ${response} | jq -r ".secrets.remoteServerCreds.password")

hostName=44.204.49.249
echo "userName is: ${userName}"
echo "password is: ${password}"

echo "Finding File System Usage on remote server: ${hostName} "
sshpass -p ${password} ssh ${userName}@${hostName} 'df -h'

