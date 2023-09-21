NODE_VERSION=$(cat ./NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
CONTAINER_NAME=cloud-npm-downloader-container-$PACK_VERSION


docker build --progress=plain -t cloud-npm-downloader-$PACK_VERSION -f Dockerfile .
docker run --name $CONTAINER_NAME cloud-npm-downloader-$PACK_VERSION
docker cp $CONTAINER_NAME:/app/output .