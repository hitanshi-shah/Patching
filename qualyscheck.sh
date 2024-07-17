#!/bin/bash

# Replace 'username' and 'password' with your Qualys credentials
USERNAME=$3
PASSWORD=$4

# Replace 'your_qualys_id' with the Qualys ID you want to validate
QUALYS_ID=$1
echo "$QUALYS_ID" is given as input

# Construct the cURL command to query the Qualys API

curl_command=`curl -u "$3:$4" -H "X-Requested-With:curl" "https://qualysapi.qg2.apps.qualys.com/api/2.0/fo/asset/host/vm/detection/?action=list&status=Active"`
verifyqid=$curl_command
echo $verifyqid
if echo "$verifyqid" | grep -e "<QID>$QUALYS_ID</QID>"; then
    echo "Qualys ID $QUALYS_ID is valid."
          
          curl_command1=`curl -u "$3:$4" -H "X-Requested-With:curl" https://qualysapi.qg2.apps.qualys.com/api/2.0/fo/asset/host/vm/detection/?action=list&status=Active&ips=$2`

          response=$curl_command1

           # Check if the response contains information about the Qualys ID
           if echo "$response" | grep -e "<QID>$QUALYS_ID</QID>"; then
              echo "Qualys ID $QUALYS_ID is active."
           else
              echo "Qualys ID $QUALYS_ID is not active."  
           fi
else
    echo "Qualys ID $QUALYS_ID is not valid."
fi
