#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"


echo "ORG : "  $GITHUB_REPOSITORY_OWNER
echo "BRANCH : " $GITHUB_REF_NAME
echo "REPO : " $(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev)

echo "API-TOKEN :" ${INPUT_API-TOKEN}
echo "STATUS :" ${INPUT_STATUS}
echo "APP :" ${INPUT_APP}

# env

curl -X POST -H "Content-Type: application/json" \
             https://badges.rhems-japan.com/api-update-badge \
             -d @- <<EOS
{
  "api_token": ${INPUT_API-TOKEN},
  "organization": ${GITHUB_REPOSITORY_OWNER},
  "repo": $(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev),
  "app": ${INPUT_APP},
  "branch": $GITHUB_REF_NAME
  "status":${INPUT_STATUS},
  "update": $(date "+%Y-%m-%d-%H:%M:%S")
}
EOS

# curl -XPOST http://127.0.0.1:3000 \
#   -H "Content-Type: application/json" \
#   -d @- <<EOS
# {
#   "query": {
#     "hoge": 1,
#     "fuga": "fuga",
#     "piyo": ${piyo_number}
#   }
# }
# EOS
