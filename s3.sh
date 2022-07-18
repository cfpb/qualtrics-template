#!/bin/bash

function putS3 {
  dir=$1
  file=$2
  content_type="text/$3"
  aws_prefix="${AWS_PREFIX:-/assets/qualtrics/}"
  bucket="${AWS_BUCKET:-files.consumerfinance.gov}"
  curr_date=$(date +"%a, %d %b %Y %T %z")
  string="PUT\n\n$content_type\n$curr_date\n/$bucket$aws_prefix$file"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "$AWS_SECRET" -binary | base64)
  curl -X PUT -k -T "$dir/$file" \
    -H "Host: $bucket.s3.amazonaws.com" \
    -H "Date: $curr_date" \
    -H "Content-Type: $content_type" \
    -H "Authorization: AWS $AWS_ID:$signature" \
    "https://$bucket.s3.amazonaws.com$aws_prefix$file"
}

echo "${AWS_ID:?AWS access key id unset}" > /dev/null
echo "${AWS_SECRET:?AWS secret access key unset}" > /dev/null

for file in src/*; do
  putS3 "src" "${file##*/}" "${file##*.}"
  echo "Uploaded $file"
done
