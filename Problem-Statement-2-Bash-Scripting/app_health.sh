#!/bin/bash

read -p "Enter Application URL: " url

status=$(curl -L -s -o /dev/null -w "%{http_code}" --max-time 10 "$url")

echo "HTTP Status Code: $status"

if [[ "$status" =~ ^2[0-9][0-9]$ ]]; then
    echo "Application is UP"
else
    echo "Application is DOWN"
fi
