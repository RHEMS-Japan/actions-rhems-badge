#!/bin/sh -l
#### made by rayman@rhems-japan.co.jp
echo "===="
cat << EOS
{
  "api_token": "${INPUT_API_TOKEN}",
  "organization": "${GITHUB_REPOSITORY_OWNER}",
  "repo": "$(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev)",
  "app": "${INPUT_APP}",
  "branch": "${GITHUB_REF_NAME}",
  "status": "${INPUT_STATUS}",
`[ -n "${INPUT_TXT}" ] && \
cat << EOF
  "txt": "${INPUT_TXT}",
EOF`
  "update": "$(date "+%Y-%m-%d-%H:%M:%S")"
}
EOS
env
echo "===="
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
`[ -n "${INPUT_TXT}" ] && \
cat << EOF
  "txt": "${INPUT_TXT}",
EOF`
  "update": "$(date "+%Y-%m-%d-%H:%M:%S")"
}
EOS
