#!/bin/bash
version=$(curl -s "https://hub.docker.com/v2/repositories/${1}/tags/" | jq -e '.results[].name' 2> /dev/null | grep  -E  '^v[0-9]+\.[0-9]+\.[0-9]+$' | head -1)
if [[ -z $version ]]; then
  version=${version:-'v1.0.0'}
else
  major_minor=$(echo "$version" | grep -Eo 'v[0-9]+\.[0-9]+')
  patch=$(echo "$version" | grep -Eo '[0-9]+$')
  next_patch=$((patch + 1))
  version=$(echo "$major_minor.$next_patch")
fi
echo "version=${version}" >> "$GITHUB_OUTPUT"
