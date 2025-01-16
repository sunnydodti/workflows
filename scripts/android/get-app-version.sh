#!/bin/bash
# $1 - path where pubspec.yaml is
set -e 

echo $1
if [ -z "$1" ]; then
echo "Error: Path to pubspec.yaml is required." >&2
  exit 1
fi

PUBSPEC_PATH=$1/pubspec.yaml
APP_VERSION="$(yq -r '.version' "$PUBSPEC_PATH")-dev"
echo "APP_VERSION=$APP_VERSION" >> $GITHUB_ENV
echo "APP_VERSION: $APP_VERSION"
