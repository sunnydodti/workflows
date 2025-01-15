#!/bin/bash

set -e # exit on error

# Create and set up Android SDK
echo "Setting up Android SDK..."
mkdir -p android/sdk
cd android/sdk
pwd
wget --output-document=cmdline-tools.zip --quiet https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip cmdline-tools.zip
rm -f cmdline-tools.zip

# Accept licenses and install build tools
CMD_TOOLS=$PWD/cmdline-tools/bin
BUILD_TOOLS=$PWD/build-tools/35.0.0
yes | $CMD_TOOLS/sdkmanager --licenses --sdk_root=$PWD
yes | $CMD_TOOLS/sdkmanager "build-tools;35.0.0" --sdk_root=$PWD

# Export paths
echo "CMD_TOOLS=$CMD_TOOLS" >> $GITHUB_ENV
echo "BUILD_TOOLS=$BUILD_TOOLS" >> $GITHUB_ENV

# Verify setup
echo "Android SDK setup completed."
echo "CMD_TOOLS: $CMD_TOOLS"
echo "BUILD_TOOLS: $BUILD_TOOLS"

