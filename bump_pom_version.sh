#!/bin/bash
version=$(grep -oP '(?<=^\t<version>).*?(?=<\/version>)' pom.xml)
major_minor=$(echo "$version" | grep -Eo '[0-9]+\.[0-9]+\.')
patch=$(echo "$version" | grep -oP "(?<=${major_minor}).*")
next_patch=$((patch + 1))
new_version=$(echo "$major_minor$next_patch")
sed -i "s/^\t<version>${version}<\/version>/\t<version>${new_version}<\/version>/" pom.xml
