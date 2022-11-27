#!/bin/bash

aws sts get-caller-identity > /dev/null
AWS_STATUS=$?

if [ "$AWS_STATUS" != 0 ]; then
   echo "[ERROR] Bad Credentials for AWS"
   exit 1
fi

BUCKET_NAME=$1
FILE_PATH=$2

if [ -z $BUCKET_NAME ] || \
[ -z $FILE_PATH ]
then
echo "[ERROR] Missing Arguments in the script."
exit 1
fi

aws s3 ls | grep $BUCKET_NAME > /dev/null
AWS_BUCKET_STATUS=$?
if [ "$AWS_BUCKET_STATUS" != 0 ]; then
   echo "[ERROR] Bucket NOT EXSITS"
   exit 1
fi

aws s3 cp s3://$BUCKET_NAME/$FILE_PATH . > /dev/null

AWS_CP_STATUS=$?
if [ "$AWS_CP_STATUS" != 0 ]; then
   echo "[ERROR] File Not Found in the Bucket"
   exit 1
fi