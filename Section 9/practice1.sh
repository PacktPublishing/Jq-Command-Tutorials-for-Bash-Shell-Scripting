#!/bin/bash
hostName=52.90.165.177
response=$(curl -s http://192.168.0.110:8080/secrets)
#userName=$(echo ${response} | jq -r .secrets.remoteServerCreds.userName)
#password=$(echo ${response} | jq -r .secrets.remoteServerCreds.password)

userName=$(jq -re .secrets.remoteServerCreds.userName <<< "$(echo ${response})")
if [[ $? -ne 0 ]]
then
   echo "Failed to get userName from the api response"
   exit 1
fi
password=$(jq -re .secrets.remoteServerCreds.password <<< "$(echo ${response})")
if [[ $? -ne 0 ]]
then
   echo "Failed to get password from the api response"
   exit 2
fi

echo "userName: ${userName}"
echo "password: ${password}"

echo "Finding File System Usage on ${hostName}"
sshpass -p ${password} ssh ${userName}@${hostName} 'df -h'
