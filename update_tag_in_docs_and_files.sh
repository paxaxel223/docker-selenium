#!/usr/bin/env bash

LATEST_TAG=$1
NEXT_TAG=$2

echo -e "\033[0;32m Updating tag displayed in docs and files...\033[0m"
echo -e "\033[0;32m LATEST_TAG -> ${LATEST_TAG}\033[0m"
echo -e "\033[0;32m NEXT_TAG -> ${NEXT_TAG}\033[0m"

# If you want to test this locally and you are using macOS, do `brew install gnu-sed` and change `sed` for `gsed`.
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/${LATEST_TAG}/${NEXT_TAG}/g"

git diff | cat

echo -e "\033[0;32m Text updated...\033[0m"
