#!/bin/sh
git add VERSION
version=`cat VERSION`
git commit -m "New version: ${version}"
git tag $version -m "New version: ${version}"
git push
git push --tags
