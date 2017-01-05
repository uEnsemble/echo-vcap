#!/bin/sh

TRAVIS_BUILD_ID=189317531
TRAVIS_COMMIT=425c470e3f4a31aa3e2338f87ee2b2c102246ca0
GITHUB_OAUTH_TOKEN=67edc95c077dc697fd85d622269f1645b53adab1
TRAVIS_REPO_SLUG=uEnsemble/echo-vcap
TRAVIS_BRANCH=master
TRAVIS_BUILD_NUMBER=7

echo "CREATE GIT TAG"
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
export GIT_TAG="build-$TRAVIS_BRANCH-$(date -u "+%Y-%m-%d")-$TRAVIS_BUILD_NUMBER"
echo -n $GIT_TAG > version
git commit -a -m "Set build VERSION number to $GIT_TAG"
git tag $GIT_TAG -a -m "Generated tag from TravisCI build $TRAVIS_BUILD_NUMBER"
git push --quiet "https://$GITHUB_OAUTH_TOKEN@github.com/$TRAVIS_REPO_SLUG" "$GIT_TAG" > /dev/null 2>&1
