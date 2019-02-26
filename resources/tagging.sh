#!/bin/bash
echo pushing tag...

if [ "$BRANCH_NAME" == "master" ]; then
	GIT_TAG="v.$BUILD_NUMBER" 
	GIT_MSG="release $BUILD_NUMBER"
fi

if [ "$BRANCH_NAME" == "integration" ]; then
	GIT_TAG="rc.$BUILD_NUMBER" 
	GIT_MSG="release candidate $BUILD_NUMBER"
fi

GIT_REMOTE="$(git ls-remote --get-url)"
echo git remote = $GIT_REMOTE
echo git tag -a $GIT_TAG -m $GIT_MSG
git tag -a "$GIT_TAG" -m "$GIT_MSG"
echo git push $GIT_REMOTE --tags
git push $GIT_REMOTE --tags

echo pushing tag...Done