#!/bin/bash

# Check if a file name was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Make the file executable
chmod +x "$1"

# Notify the user
echo "File '$1' is now executable."

