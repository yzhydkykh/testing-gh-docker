#!/bin/sh -l

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

echo "HELLO WORLD!"
ls
yarn install && yarn build
cd functions
yarn install && yarn build
firebase deploy --token ${FIREBASE_TOKEN} --only functions