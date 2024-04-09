#!/bin/bash
version=$(perl -n -e 'if (/^( {4}|\t)<version>(.*?)<\/version>/) { print $2 }' pom.xml)
major_minor=$(echo "$version" | grep -Eo '[0-9]+\.[0-9]+\.')
patch=$(echo "$version" | grep -oP "(?<=${major_minor}).*")
next_patch=$((patch + 1))
new_version=$(echo "$major_minor$next_patch")
sed -i "s/^\(\t\| \{4\}\)<version>${version}<\/version>/\1<version>${new_version}<\/version>/" pom.xml
