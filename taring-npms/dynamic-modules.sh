NODE_VERSION=$(cat ./NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$NODE_VERSION
DESTINATION_TAR=$ARTIFACT_NAME.$PACK_VERSION.tar.gz


echo "1. creating dynamic_modules.tar"
tar cf ./dynamic_modules.tar -C ./dynamic_modules .


echo "2. zipping dynamic_modules.tar.gz"
pigz -5 ./dynamic_modules.tar


echo "3. moving dynamic_modules.tar.gz to cloud-npm-downloader"
cp ./dynamic_modules.tar.gz ./cloud-npm-downloader

cd ./cloud-npm-downloader
echo "4. zipping inside cloud-npm-downloader folder"
tar cvf $DESTINATION_TAR dynamic_modules.tar.gz -I pigz npm-modules.json npm-modules-change-log.json npm-modules-version.txt dependencies.json npmModules.es6 dynamic_modules_pack_version

cd /app
echo "moving cloud-npm-downloader tar.gz output to /app/output"
mkdir output
cp ./cloud-npm-downloader/$DESTINATION_TAR ./output/$DESTINATION_TAR
