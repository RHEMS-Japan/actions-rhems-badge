#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "ORG" : $INPUT_ORGANIZATION
echo "BRANCH" $INPUT_BRANCH
echo "REPO" $INPUT_REPO
