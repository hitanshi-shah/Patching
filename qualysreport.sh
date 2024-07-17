#!/bin/bash

# Replace 'username' and 'password' with your Qualys credentials
USERNAME="ag2re"
PASSWORD="Hitu@1498"

# Replace 'your_qualys_id' with the Qualys ID you want to validate
QUALYS_ID="12345"

# Construct the cURL command to query the Qualys API
curl_command=`curl -u ag2re:Hitu@1498 -H "Content-Type: application/xml" -H "X-Requested-With: <user description, like a user agent>" "https://qualysapi.qg2.apps.qualys.com/api/2.0/fo/asset/host/?action=list&details=Basic"`

# Execute the cURL command and capture the response
response=$(eval $curl_command)
echo "$response" is response
echo "$response" | grep -i "$QUALYS_ID"

# Check if the response contains information about the Qualys ID
if echo "$curl_command" | grep -i "$QUALYS_ID"; then
    echo "Qualys ID $QUALYS_ID is valid."
    # Add additional processing here if needed
else
    echo "Qualys ID $QUALYS_ID is not valid."
fi
