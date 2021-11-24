#!/bin/sh -l
#### made by rayman@rhems-japan.co.jp

_BRANCH=${GITHUB_REF_NAME}
[ -n ${INPUT_BRANCH} ] && _BRANCH=${INPUT_BRANCH}

echo "==== debug ===="
cat << EOS
txt : ${_BRANCH} / ${INPUT_BRANCH}
{
  "api_token": "${INPUT_API_TOKEN}",
  "organization": "${GITHUB_REPOSITORY_OWNER}",
  "repo": "$(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev)",
  "app": "${INPUT_APP}",
  "branch": "${_BRANCH}",
  "status": "${INPUT_STATUS}",
`[ -n "${INPUT_TXT}" ] && \
cat << EOF
  "txt": "${INPUT_TXT}",
EOF`
`[ -n "${INPUT_COLOR}" ] && \
cat << EOF
  "color": "${INPUT_COLOR}",
EOF`
  "update": "$(date "+%Y-%m-%d-%H:%M:%S")"
}
EOS
echo "==== debug ===="

curl -X POST -H "Content-Type: application/json" \
             https://badges.rhems-japan.com/api-update-badge \
             -d @- <<EOS
{
  "api_token": "${INPUT_API_TOKEN}",
  "organization": "${GITHUB_REPOSITORY_OWNER}",
  "repo": "$(echo $GITHUB_REPOSITORY | rev | cut -d '/' -f 1 | rev)",
  "app": "${INPUT_APP}",
  "branch": "${_BRANCH}",
  "status": "${INPUT_STATUS}",
`[ -n "${INPUT_TXT}" ] && \
cat << EOF
  "txt": "${INPUT_TXT}",
EOF`
`[ -n "${INPUT_COLOR}" ] && \
cat << EOF
  "color": "${INPUT_COLOR}",
EOF`
  "update": "$(date "+%Y-%m-%d-%H:%M:%S")"
}
EOS
