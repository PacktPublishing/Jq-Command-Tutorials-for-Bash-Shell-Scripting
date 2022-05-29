#!/bin/bash
hostName=44.204.49.249
response=$(curl -s http://192.168.0.110:8080/secrets)
#userName=$(echo ${response} | jq -r .secrets.remoteServerCreds.userName)
#password=$(echo ${response} | jq -r .secrets.remoteServerCreds.password)

userName=$(jq -r .secrets.remoteServerCreds.userName <<< "$(echo ${response})")
password=$(jq -r .secrets.remoteServerCreds.password <<< "$(echo ${response})")

echo "userName: ${userName}"
echo "password: ${password}"

sshpass -p ${password} ssh ${userName}@${hostName} 'df -h'