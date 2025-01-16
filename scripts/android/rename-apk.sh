#!/bin/bash
# $1 = apk dir
# $2 = appname
# $3 = suffix - "-dev"
# $4 = version
set -e


if [ -z "$1" ]; then
  echo "reading in base dir ." 
  $1 = "."
fi

if [ -z "$2" ]; then
  echo "reading in base dir ." 
  $2 = "App"
fi

APK_DIR="$1/build/app/outputs/flutter-apk"
APP_NAME=$2

echo "renaming apks"

echo "renaming $APK_DIR/app-arm64-v8a$3-release.apk to $APK_DIR/${APP_NAME}_${4}_arm64-v8a-release.apk"
echo "renaming $APK_DIR/app-armeabi-v7a$3-release.apk to $APK_DIR/${APP_NAME}_${4}_armeabi-v7a-release.apk"
echo "renaming $APK_DIR/app-x86_64$3-release.apk to $APK_DIR/${APP_NAME}_${4}_x86_64-release.apk"

mv "$APK_DIR/app-arm64-v8a$3-release.apk" "$APK_DIR/${APP_NAME}_${4}_arm64-v8a-release.apk"
mv "$APK_DIR/app-armeabi-v7a$3-release.apk" "$APK_DIR/${APP_NAME}_${4}_armeabi-v7a-release.apk"
mv "$APK_DIR/app-x86_64$3-release.apk" "$APK_DIR/${APP_NAME}_${4}_x86_64-release.apk"
