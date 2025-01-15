#!/bin/bash
#1 = path to repo
#2 = flavour
#3 = main file name

if [ -z "$1" ]; then
  echo "reading in base dir ." 
  $1 = "."
fi
pwd
cd $1
echo "running pub get"
pwd
flutter pub get

echo "building apk"
echo "flavour: $2"
echo "main: $3"

flutter build apk --flavor $2 -t lib/$3 --split-per-abi
