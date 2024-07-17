import requests
import json

# Qualys API endpoint for listing vulnerabilities
api_endpoint = 'https://qualysapi.qg2.apps.qualys.com/api/2.0/fo/asset/host/'

# Replace 'username' and 'password' with your Qualys credentials
username = 'ag2re'
password = 'Hitu@1498'

# Make the request to list all vulnerabilities
response = requests.get(api_endpoint, params={'action': 'list', 'details': 'All'}, auth=(username, password))

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the JSON response
    data = response.json()
    
    # Iterate through the vulnerabilities
    for vulnerability in data['VULNS_LIST']['VULN']:
        # Check if the QID matches the one you're interested in
        if vulnerability['QID'] == '12345':
            # Extract and print relevant information
            print("Vulnerability Title:", vulnerability['TITLE'])
            print("Severity:", vulnerability['SEVERITY'])
            print("Description:", vulnerability['DESCRIPTION'])
            # Add additional fields as needed

else:
    print("Error:", response.status_code)
