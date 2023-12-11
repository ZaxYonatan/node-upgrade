MAJOR_NODE_VERSION=$(cat ./MAJOR_NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$MAJOR_NODE_VERSION
NPM_TAR_NAME=$ARTIFACT_NAME.$PACK_VERSION.tar.gz


LOCAL_TAR_DESTINATION=tars-to-upload/$NPM_TAR_NAME

S3_BUCKET_PATH=s3://wix-code-modules
S3_DESTINATION=$S3_BUCKET_PATH/$NPM_TAR_NAME

# aws s3 cp tars-to-upload/cloud-npm-downloader-18.18.0.0.tar.gz s3://wix-code-modules/cloud-npm-downloader-18.18.0.0.tar.gz
UPLOAD_TAR_COMMAND="aws s3 cp $LOCAL_TAR_DESTINATION $S3_DESTINATION"

echo "Command for uploading npm tar to s3:\n$UPLOAD_TAR_COMMAND"