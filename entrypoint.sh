#!/bin/sh -l
#### made by rayman@rhems-japan.co.jp

echo "${INPUT_API_TOKEN}"
env
curl -X POST -H "Content-Type: application/json" \
             https://badges.rhems-japan.com/api-update-badge \
             -d @- <<EOS
{
  "api_token": "${INPUT_API_TOKEN}",
  "organization": "${GITHUB_REPOSITORY_OWNER}",
  "repo": "$(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev)",
  "app": "${INPUT_APP}",
  "branch": "${GITHUB_REF_NAME}",
  "status": "${INPUT_STATUS}",
  "update": "$(date "+%Y-%m-%d-%H:%M:%S")"
}
EOS
