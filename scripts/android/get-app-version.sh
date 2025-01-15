#!/bin/bash
set -e

if [ -z "$1" ]; then
echo "Error: Path to pubspec.yml is required." >&2
  exit 1
fi

APP_VERSION="$(yq -r '.version' $1)-dev"
echo "app_version=$APP_VERSION" >> $GITHUB_OUTPUT