MAJOR_NODE_VERSION=$(cat ./MAJOR_NODE_VERSION)
PACK_VERSION=$(cat ./PACK_VERSION)
ARTIFACT_NAME=cloud-npm-downloader-$MAJOR_NODE_VERSION

NODE_18_GA_TAG_FILE_NAME=$ARTIFACT_NAME.json
GA_TAGS_FOLDER_NAME="ga_tags"
mkdir -p $GA_TAGS_FOLDER_NAME
GA_TAG_FILE_DESTINATION="$GA_TAGS_FOLDER_NAME/$NODE_18_GA_TAG_FILE_NAME"

GA_TAG_CONTENT="
{\n
  \t\"package\": \"$ARTIFACT_NAME\",\n
  \t\"node-$MAJOR_NODE_VERSION\": \"$PACK_VERSION\"\n
}\n
"

echo $GA_TAG_CONTENT > $GA_TAG_FILE_DESTINATION

S3_BUCKET_PATH=s3://wix-code-modules
S3_DESTINATION=$S3_BUCKET_PATH/$GA_TAGS_FOLDER_NAME/$NODE_18_GA_TAG_FILE_NAME
S3_PROFILE="corvid-dev"

# aws s3 cp --profile corvid-dev ga_tags/cloud-npm-downloader-18.json s3://wix-code-modules/ga_tags/cloud-npm-downloader-18.json
OVERRIDE_GA_TAGS_FILE_COMMAND="aws s3 cp --profile $S3_PROFILE $GA_TAG_FILE_DESTINATION $S3_DESTINATION"


echo "Command for overriding ga_tags:\n$OVERRIDE_GA_TAGS_FILE_COMMAND"
