#!bin/sh -x

# Output versions.
hugo version
firebase --version

# Build the Hugo site.
hugo

# Retrieve the input arguments/parameters.
FIREBASE_DEPLOY_TOKEN=$1
ALIAS=${2:-alias}

# Publish to Google Firebase.
firebase use $ALIAS --token $FIREBASE_DEPLOY_TOKEN
firebase deploy -m "
  | Successful Deployment| 
  Event: $GITHUB_EVENT_NAME,
  Commit SHA: $GITHUB_SHA,
  User: $GITHUB_ACTOR
" --non-interactive --token $FIREBASE_DEPLOY_TOKEN