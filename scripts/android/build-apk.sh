#!/bin/bash
# Arguments:
# $1 = path to the repo
# $2 = flavor
# $3 = main file name

# Check if the first argument (path to repo) is provided
if [ -z "$1" ]; then
  echo "Error: Path to the Flutter project is required." >&2
  exit 1
fi

# Navigate to the Flutter project directory
echo "Navigating to project directory: $1"
cd "$1" || { echo "Error: Directory $1 not found."; exit 1; }

# Verify that pubspec.yaml exists
if [ ! -f "pubspec.yaml" ]; then
  echo "Error: No pubspec.yaml file found in the directory $1." >&2
  exit 1
fi

# Run `flutter pub get`
echo "Running flutter pub get..."
flutter pub get

# Build APK
echo "Building APK..."
echo "Flavor: $2"
echo "Main file: $3"

flutter build apk --flavor "$2" -t "lib/$3" --split-per-abi
