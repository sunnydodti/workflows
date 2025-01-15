#!/bin/bash
# $1 = apk dir
# $2 = suffix - "-dev"
# $3 = version
set -e

if [ -z "$1" ]; then
  echo "reading in base dir ." 
  $1 = "."
fi

APK_DIR="$1/build/app/outputs/flutter-apk"
APP_NAME="${APP_NAME:-App}"

mv "$APK_DIR/app-arm64-v8a$2-release.apk" "$APK_DIR/${APP_NAME}_${3}_arm64-v8a-release.apk"
mv "$APK_DIR/app-armeabi-v7a$2-release.apk" "$APK_DIR/${APP_NAME}_${3}_armeabi-v7a-release.apk"
mv "$APK_DIR/app-x86_64$2-release.apk" "$APK_DIR/${APP_NAME}_${3}_x86_64-release.apk"
