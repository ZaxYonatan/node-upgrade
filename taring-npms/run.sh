brew install bzip2, pigz

MAJOR_NODE_VERSION=$(cat ./MAJOR_NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$MAJOR_NODE_VERSION
NPM_TAR_NAME=$ARTIFACT_NAME.$PACK_VERSION.tar.gz

echo "1. creating dynamic_modules.tar"
tar cvf ./dynamic_modules.tar -C ./dynamic_modules .


echo "2. zipping dynamic_modules.tar.gz"
pigz -5 ./dynamic_modules.tar


echo "3. moving dynamic_modules.tar.gz to cloud-npm-downloader"
cp ./dynamic_modules.tar.gz ./cloud-npm-downloader

cd ./cloud-npm-downloader
echo "4. zipping inside cloud-npm-downloader folder"
tar cvf $NPM_TAR_NAME dynamic_modules.tar.gz -I pigz npm-modules.json npm-modules-change-log.json npm-modules-version.txt dependencies.json npmModules.es6 dynamic_modules_pack_version

echo "5. moving cloud-npm-downloader tar.gz output to ./output"
mkdir -p output
cp ./cloud-npm-downloader/$NPM_TAR_NAME ./output/$NPM_TAR_NAME
