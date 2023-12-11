MAJOR_NODE_VERSION=$(cat ./MAJOR_NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$MAJOR_NODE_VERSION
NPM_TAR_NAME=$ARTIFACT_NAME.$PACK_VERSION.tar.gz


LOCAL_TAR_DESTINATION=./$NPM_TAR_NAME

S3_BUCKET_PATH=s3://wix-code-modules
S3_DESTINATION=$S3_BUCKET_PATH/$NPM_TAR_NAME
S3_PROFILE="corvid-dev"

# aws s3 cp --profile s3://wix-code-modules/cloud-npm-downloader-18.18.0.0.tar.gz ./cloud-npm-downloader-18.18.0.0.tar.gz
DOWNLOAD_TAR_COMMAND="aws s3 cp --profile $S3_PROFILE $S3_DESTINATION $LOCAL_TAR_DESTINATION"

echo "Command for downloading npm tar to s3:\n$DOWNLOAD_TAR_COMMAND"
