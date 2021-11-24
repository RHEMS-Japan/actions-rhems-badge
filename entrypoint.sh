#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo $INPUT_ORGANIZATION
echo $INPUT_BRANCH
echo $INPUT_REPO
