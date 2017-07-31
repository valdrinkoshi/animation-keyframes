#!/bin/bash -e
#
# @license
# Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
# This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
# The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
# The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
# Code distributed by Google as part of the polymer project is also
# subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
#
# Based on https://github.com/notwaldorf/lazy-image/blob/master/deploy-to-gh-pages.sh which is based on https://github.com/Polymer/tools/blob/master/bin/gp.sh

# This script pushes a demo-friendly version of your element and its
# dependencies to gh-pages.

# Run in a clean directory passing in a GitHub org and repo name
org="valdrinkoshi"
repo="animation-keyframes"
branch="master" # default to master when branch isn't specified

# make folder (same as input, no checking!)
rm -rf $repo
mkdir $repo
git clone https://github.com/$org/$repo.git --single-branch

# switch to gh-pages branch
pushd $repo >/dev/null
git checkout --orphan gh-pages

# remove all content
git rm -rf -q .

# use bower to install runtime deployment
bower cache clean $repo # ensure we're getting the latest from the desired branch.

# copy the bower.json from master here
git show ${branch}:bower.json > bower.json

# install the bower deps and also this repo so we can copy the demo
bower install
bower install $org/$repo#$branch
# copy demo, replace "../ with "./bower_components in urls
cp bower_components/$repo/index.html ./
sed -i '' 's/"\.\.\//"\.\/bower_components\//g' index.html

# send it all to github
git add -A .
git commit -am 'seed gh-pages'
git push -u origin gh-pages --force

popd >/dev/null