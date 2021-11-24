#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "ORG : "  $GITHUB_REPOSITORY_OWNER
echo "BRANCH : " $GITHUB_REF
echo "REPO : " $GITHUB_REPOSITORY

echo "API-TOKEN :" ${INPUT_API-TOKEN}
echo "STATUS :" ${INPUT_STATUS}
echo "APP :" ${INPUT_APP}

env
