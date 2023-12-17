#!/bin/bash
NPM_MODULES_VERSION=$(cat ./NPM_MODULES_VERSION)

echo "1. fix dynamic_modules folder"
cd ./dynamic_modules
CURRENT_VALUE=$(cat ./current)
echo "1.1 Running command: sudo mv $CURRENT_VALUE $NPM_MODULES_VERSION"
sudo mv $CURRENT_VALUE $NPM_MODULES_VERSION
echo "1.2 write new version in current file"
printf ${NPM_MODULES_VERSION} > ./current
echo "1.3 re-link current-link to current"
ln -f -s $NPM_MODULES_VERSION current-link

echo "2. fix cloud-npm-downloader folder"
cd ../cloud-npm-downloader
echo "2.1 write new version in npm-modules-version.txt"
printf ${NPM_MODULES_VERSION} > ./npm-modules-version.txt
