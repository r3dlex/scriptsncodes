#!/usr/bin/env bash

SLACK_DIR=/usr/lib/slack
FILE_TO_PATCH=resources/app.asar.unpacked/src/static/ssb-interop.js
SCRIPT_DIR=`readlink -f $0 | xargs dirname`
PATCH_FILE=${SCRIPT_DIR}/black_slack.patch

pushd ${SLACK_DIR}

while IFS="" read -r LINE || [ -n "$LINE" ]
do
  printf '%s\n' "$LINE"
  FILE=${FILE_TO_PATCH}
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
done < ${PATCH_FILE}

echo "Applied! Exiting"

popd
