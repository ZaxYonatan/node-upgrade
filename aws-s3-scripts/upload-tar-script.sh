NODE_VERSION=$(cat ./NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$NODE_VERSION
TAR_NAME=$ARTIFACT_NAME.$PACK_VERSION.tar.gz


TAR_TO_UPLOAD=tars-to-upload/$TAR_NAME

S3_BUCKET_PATH=s3://wix-code-modules
S3_DESTINATION=$S3_BUCKET_PATH/$TAR_NAME

# aws s3 cp tars-to-upload/cloud-npm-downloader-18.18.0.0.tar.gz s3://wix-code-modules/cloud-npm-downloader-18.18.0.0.tar.gz
COMMAND="aws s3 cp $TAR_TO_UPLOAD $S3_DESTINATION"

echo "Running the following command:\n$COMMAND"
# eval $COMMAND # Uncomment before running the script
echo "Done uploading new tar to $S3_DESTINATION"