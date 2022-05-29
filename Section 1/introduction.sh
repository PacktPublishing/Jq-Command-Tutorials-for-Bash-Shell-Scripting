#!/bin/bash
userName=ec2-user
password=ec2-user@123

hostName=44.204.49.249
echo "userName is: ${userName}"
echo "password is: ${password}"

echo "Finding File System Usage on remote server: ${hostName} "
sshpass -p ${password} ssh ${userName}@${hostName} 'df -h'


from flask import Flask, jsonify
from werkzeug.wrappers import response

app=Flask(__name__)

@app.route("/secrets", methods=['GET'])
def secrets():
    data={
        "secrets": {
            "remoteServerCreds": {
                "userName": "ec2-user",
                "password" : "ec2-user@123"
            },
            "awsAccessKeys" : {
                "aws_access_key_id": "LIVEARET45LJASDF9EWR",
                "aws_secret_access_key": "4GAbEcDDDeyYRNO4WBrnYeWgVa-YTDrV6GIJMqQabc"
            }       
        }
    }
    response = jsonify(data)
    response.status_code = 200
    return response
app.run(host="0.0.0.0", port=8080)


#!/bin/bash

response=$(curl -s http://192.168.0.110:8080/secrets | jq ".")
userName=$(echo ${response} | jq -r ".secrets.remoteServerCreds.userName")
password=$(echo ${response} | jq -r ".secrets.remoteServerCreds.password")

hostName=44.204.49.249
echo "userName is: ${userName}"
echo "password is: ${password}"

echo "Finding File System Usage on remote server: ${hostName} "
sshpass -p ${password} ssh ${userName}@${hostName} 'df -h'




{
  "name": "Buster",
  "breed": "Golden Retriever",
  "age": "4",
  "owner": {
    "name": "Sally"
  },
  "likes": [
    "bones",
    "balls",
    "dog biscuits"
  ]
}



from flask import Flask, jsonify
from werkzeug.wrappers import response

app=Flask(__name__)

@app.route("/secrets", methods=['GET'])
def secrets():
    data={
        "secrets": {
            "remoteServerCreds": {
                "userName": "ec2-user",
                "password" : "ec2-user@123"
            },
            "awsAccessKeys" : {
                "aws_access_key_id": "LIVEARET45LJASDF9EWR",
                "aws_secret_access_key": "4GAbEcDDDeyYRNO4WBrnYeWgVa-YTDrV6GIJMqQabc"
            }       
        }
    }
    response = jsonify(data)
    response.status_code = 200
    return response
app.run(host="0.0.0.0", port=8080)



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



{
  "technology": "devops",
  "tools": [
     "jenkins",
     "bamboo",
     "stackstorm",
     "git",
     "maven"
 ]
}



[
  {
    "name": "apple",
    "color": "green",
    "price": 1.2
  },
  {
    "name": "banana",
    "color": "yellow",
    "price": 0.5
  },
  {
    "name": "kiwi",
    "color": "green",
    "price": 1.25
  }
]



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



#!/bin/bash

export num1=$1
export num2=$2


jq -n '"Sum = " + (((env.num1 | tonumber) + ( env.num2|tonumber))|tostring)'
jq -n '"Sub = " + (((env.num1 | tonumber) - ( env.num2|tonumber))|tostring)'
jq -n '"Mul = " + (((env.num1 | tonumber) * ( env.num2|tonumber))|tostring)'
jq -n '"Div = " + (((env.num1 | tonumber) / ( env.num2|tonumber))|tostring)'




