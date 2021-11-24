# RHEMS BADGES action

![badge](https://badges.rhems-japan.com/api-get-badge.svg?user_id=MSnzsZ4w1QdiqHL71hXoY7M77Mk2&organization=RHEMS-Japan&repo=badge&branch=release&app=badge)

set up rhems badge action

## Inputs

## `api_token`
**Required**
set api token
if you don't have any token get it from blow

https://badges.rhems-japan.com

## `status`
**Required**
set status true or false

## `branch`
**optional**
if branche is empty it will use ${GITHUB_REF_NAME}

## `txt`
**optional**
write txt for right side

## `color`
**optional**
you can set color


## 使用例

```sh
uses: RHEMS-Japan/actions-rhems-badges@v**
with:
  api_token: '${{ secrets.RHEMS_BADGE_TOKEN }}'
  app: 'badge'
  status: true  #CI=true
```
