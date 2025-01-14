#!/bin/bash

set -e

# Decode Keystore
echo "Decoding Keystore..."
echo "$KEYSTORE" | base64 --decode > keystore.jks
echo "Keystore decoded successfully."
