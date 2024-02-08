#!/usr/bin/env bash

last_version_tag=$(git describe --tags --abbrev=0)
current_version_tag=v$(cat ./package.json | jq -r ".version")

if [ $last_version_tag != $current_version_tag ]
then
    echo "Version changed to" $current_version_tag ", previous was" $last_version_tag
    export CURRENT_VERSION_TAG=$current_version_tag
	export VERSION_HAS_CHANGED=1
else
	echo "Current version is the same as previous version:" $current_version_tag
fi