#!/bin/bash
# $1 - base64 encoded keystore

set -e
KEYSTORE=$1
if [ -z "$KEYSTORE" ]; then
  echo "Encoded keystore is required" >&2
  exit 1
fi

# Decode Keystore
echo "Decoding Keystore..."
echo "$KEYSTORE" | base64 --decode > keystore.jks
echo "Keystore decoded successfully."
