#!/bin/sh

git fetch

local_tag_hash=`git rev-parse $(git describe --tags --abbrev=0)`
echo "local tag: $(git describe --tags --abbrev=0)"
echo "local tag hash: ${local_tag_hash}"

latest_tag_hash=`git ls-remote -q --tags --refs | tail -n 1 | awk '{print $1}'`
latest_tag=`git describe --tags ${latest_tag_hash}`
echo "latest tag: ${latest_tag}"
echo "latest tag hash: ${latest_tag_hash}"

if [ "${local_tag_hash}" == "${latest_tag_hash}" ]; then
    echo 'Already up-to-date.'
else
    echo 'need to update'
    git checkout ${latest_tag}
fi

