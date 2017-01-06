#!/bin/sh

echo "CREATE GIT TAG"
echo "$TRAVIS_BRANCH"
echo "$TRAVIS_BUILD_NUMBER"
echo "$TRAVIS_REPO_SLUG"
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
TAG_DATE=$(date -u "+%Y-%m-%d")
export GIT_TAG="build-$TRAVIS_BRANCH-$TAG_DATE-$TRAVIS_BUILD_NUMBER"
# echo -n $GIT_TAG > version
# git commit -a -m "Set build VERSION number to $GIT_TAG"
git tag $GIT_TAG -a -m "Generated tag from TravisCI build $TRAVIS_BUILD_NUMBER"
echo "TravisCI build tagged with $GIT_TAG"
# echo "build tagged. Now push to https://<GITHUB_OAUTH_TOKEN>@github.com/$TRAVIS_REPO_SLUG"
# git push --quiet --tags "https://$GITHUB_OAUTH_TOKEN@github.com/$TRAVIS_REPO_SLUG" >/dev/null 2>&1
# echo "tag $GIT_TAG pushed $?"
