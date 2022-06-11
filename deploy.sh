#!bin/sh -x

# Retrieve the input arguments/parameters.
FIREBASE_DEPLOY_TOKEN=$1
ALIAS=${2:-alias}

hugo

# Deploy site to Firebase Host
if [ -z ${ALIAS+x} ]; then firebase use $ALIAS --token $FIREBASE_DEPLOY_TOKEN else echo "ALIAS is not set'"; fi

firebase deploy -m "
  | Successful Deployment |
  Event: $GITHUB_EVENT_NAME,
  Commit SHA: $GITHUB_SHA,
  User: $GITHUB_ACTOR
" --non-interactive --token $FIREBASE_DEPLOY_TOKEN
