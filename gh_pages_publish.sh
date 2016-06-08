#!/bin/bash
set -e

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

echo "deploy attempt from $TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "no deploy allowing on branch $TRAVIS_BRANCH, running build instead"
    npm run docs:build
    exit 0
fi

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "no deploy allowed on pr, running build"
    npm run docs:build
    exit 0
fi

echo "Publishing new pages from branch $TRAVIS_BRANCH"

rev=$(git rev-parse --short HEAD)
git config --global user.name "Travis CI"
git config --global user.email "travis@travis-ci.org";

npm run docs:build 
cd _book
git init
git commit --allow-empty -m "Update GitHub Pages: ${rev}"
git checkout -b gh-pages
git add -A .
git commit -am "Update GitHub Pages: ${rev}"
git push -q https://$GH_PAGES_TOKEN@github.com/dehora/nakadi-book-spike gh-pages --force
