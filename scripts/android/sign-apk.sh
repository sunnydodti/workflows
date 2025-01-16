#!/bin/bash
# $1 = flutter root
# $2 = suffix - "-dev"
# $3 = version
# $4 = keystore password
# $3 = key alias for signing
# $3 = key password

set -e

if [ -z "$1" ]; then
  echo "reading in base dir ." 
  $1 = "."
fi

KEYSTORE_PASSWORD=$3
KEY_ALIAS=$4
KEY_PASSWORD=$5

if [ -z "$KEY_ALIAS" ] || [ -z "$KEYSTORE_PASSWORD" ] || [ -z "$KEY_PASSWORD" ]; then
  echo "Error: Missing required parameters or environment variables." >&2
  exit 1
fi

APK_DIR="$1/build/app/outputs/flutter-apk"
APK_SIGNER="$BUILD_TOOLS/apksigner"

echo "signing $APK_DIR/app-armeabi-v7a$2-release.apk"
$APK_SIGNER sign  \
  -v \
  --in $APK_DIR/app-armeabi-v7a$2-release.apk \
  --ks keystore.jks \
  --ks-key-alias $KEY_ALIAS \
  --ks-pass "pass:$KEYSTORE_PASSWORD" \
  --key-pass "pass:$KEY_PASSWORD"

echo "signing $APK_DIR/app-arm64-v8a$2-release.apk"
$APK_SIGNER sign  \
  -v \
  --in $APK_DIR/app-arm64-v8a$2-release.apk \
  --ks keystore.jks \
  --ks-key-alias $KEY_ALIAS \
  --ks-pass "pass:$KEYSTORE_PASSWORD" \
  --key-pass "pass:$KEY_PASSWORD"

echo "signing $APK_DIR/app-x86_64$2-release.apk"
$APK_SIGNER sign  \
  -v \
  --in $APK_DIR/app-x86_64$2-release.apk \
  --ks keystore.jks \
  --ks-key-alias $KEY_ALIAS \
  --ks-pass "pass:$KEYSTORE_PASSWORD" \
  --key-pass "pass:$KEY_PASSWORD"