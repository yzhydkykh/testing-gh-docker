#!/bin/sh -l

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

echo "HELLO WORLD!"
ls
cd packages/app/
yarn install
cd functions
yarn install
cd ../../..
firebase deploy --token ${FIREBASE_TOKEN} --only functions