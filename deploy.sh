#!bin/sh -x

# Retrieve the input arguments/parameters.
FIREBASE_DEPLOY_TOKEN=$1
ALIAS=${2:-alias}

sudo hugo

# Deploy site to Firebase Host
if [ -z ${ALIAS+x} ]; then sudo firebase use $ALIAS --token $FIREBASE_DEPLOY_TOKEN else echo "ALIAS is not set'"; fi

sudo firebase deploy -m "
  | Successful Deployment |
  Event: $GITHUB_EVENT_NAME,
  Commit SHA: $GITHUB_SHA,
  User: $GITHUB_ACTOR
" --non-interactive --token $FIREBASE_DEPLOY_TOKEN
