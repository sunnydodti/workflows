#!/bin/bash
# $1 = flutter root
# $2 = suffix - "-dev"
# $3 = version
set -e

if [ -z "$1" ]; then
  echo "reading in base dir ." 
  $1 = "."
fi

APK_DIR="$1/build/app/outputs/flutter-apk"

apksigner sign  \
  -v \
  --in $APK_DIR/app-armeabi-v7a$2-release.apk \
  --ks release-keystore.jks \
  --ks-key-alias ${{ vars.KEY_ALIAS }}\
  --ks-pass env:KEYSTORE_PASSWORD \
  --key-pass env:KEY_PASSWORD