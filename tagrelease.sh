#!/bin/sh

echo "CREATE GIT TAG"
echo "$TRAVIS_BRANCH"
echo "$TRAVIS_BUILD_NUMBER"
echo "$TRAVIS_REPO_SLUG"
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
export GIT_TAG=build-$TRAVIS_BRANCH-$(date -u "+%Y-%m-%d")-$TRAVIS_BUILD_NUMBER
echo -n $GIT_TAG > version
git commit -a -m "Set build VERSION number to $GIT_TAG"
git tag $GIT_TAG -a -m "Generated tag from TravisCI build $TRAVIS_BUILD_NUMBER"
git push --quiet "https://$GITHUB_OAUTH_TOKEN@github.com/$TRAVIS_REPO_SLUG" "$GIT_TAG" > /dev/null 2>&1
