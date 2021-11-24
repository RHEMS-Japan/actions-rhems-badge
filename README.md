# RHEMS BADGE action

set up rhems badge action

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. デフォルトは `"World"`。

## Outputs

## `time`

The time we greeted you.

## 使用例

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'
