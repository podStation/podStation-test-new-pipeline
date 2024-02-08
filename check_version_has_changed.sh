#!/usr/bin/env bash

last_version_tag=$(git describe --tags --abbrev=0)
current_version=v$(cat ./package.json | jq -r ".version")

if [ $last_version_tag != $current_version ]
then
    echo "Version changed to" $current_version ", previous was" $last_version_tag
    export CURRENT_VERSION=$current_version
	export VERSION_HAS_CHANGED=1
else
	echo "Current version is the same as previous version:" $current_version 
fi