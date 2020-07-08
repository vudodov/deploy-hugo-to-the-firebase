# Deploy HUGO to the Firebase
![HUGO-v.0.71.1](https://img.shields.io/badge/HUGO-v0.71.1-blue)

A simple GitHub action that will build your static website with HUGO and deploy it with Firebase.

## Setup
### Generate Firebase Token
First we need to generate Firebase Token, so that action can deploy on your behalf.

1. Make sure you have [firebase CLI installed](https://firebase.google.com/docs/cli). _If you have npm simply run `npm install -g firebase-tools`_
2. Make sure you are [logged in to your firebase account](https://firebase.google.com/docs/cli#sign-in-test-cli) by running `firebase login`.
3. Run `firebase login:ci` to [generate firebase token](https://firebase.google.com/docs/cli#cli-ci-systems)

### Configure your workflow
Before setting up your workflow, we need [to create new GitHub Secret](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets), where freshly generated Firebase Token will be stored.
1. [Create a new GitHub Secret](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets), e.g. firebase_token
2. Copy/Paste freshly generated token (result of `firebase login:ci`)

Now it is time to [configure your workflow](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) with the help of current action. Check out example below for inspiration.

#### Configuration Example
```yaml
on: [push]
name: Deploy HUGO to the Firebase
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
      with:
        submodules: true
    - uses: vudoodv/deploy-hugo-to-the-firebase@master
      with:
        firebase-token: ${{ secrets.firebase_token }}
        alias: ${{ alias }} // Optional
```
