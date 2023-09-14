import socket
import subprocess
from random import seed
from random import randint
from io import BytesIO
import os

## getting the hostname by socket.gethostname() method
hostname = socket.gethostname()

## getting the IP address using socket.gethostbyname() method
ip_address = socket.gethostbyname(hostname)

## printing the hostname and ip_address
print(f"Hostname: {hostname}")
print(f"IP Address: {ip_address}")
urlPrefix = "http://"
url = urlPrefix + ip_address

def test_curl_request(url):
    # Define the command to execute using curl
    command = ['curl', url]

    # Execute the curl command and capture the output
    result = subprocess.run(command, capture_output=True, text=True)
    
    # Return the stdout of the curl command
    return result.stdout

def test_curl_request_env(url):
    url += "/env"
    # Define the command to execute using curl
    command = ['curl', url]

    # Execute the curl command and capture the output
    result = subprocess.run(command, capture_output=True, text=True)
    
    # Return the stdout of the curl command
    return result.stdout

def test_curl_request_int(url):
    urandom = os.open("/dev/urandom", os.O_RDONLY)
    url += "/" + str(urandom)
    # Define the command to execute using curl
    command = ['curl', url]

    # Execute the curl command and capture the output
    result = subprocess.run(command, capture_output=True, text=True)
    result = result.decode('utf-8')
    # Return the stdout of the curl command
    return result.stdout

# Make a curl request to the RNG app
response = test_curl_request(ip_address)
print(response)
response = test_curl_request_env(ip_address)
print(response)