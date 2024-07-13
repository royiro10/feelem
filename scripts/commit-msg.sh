#!/usr/bin/env sh
COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat $COMMIT_MSG_FILE)

if [ -z "${GEMINI_API_KEY}" ]; then 
    echo "can not find GEMINI_API_KEY to emojifiy your commit."
    echo "hint: export GEMINI_API_KEY (you should its free)"
fi

echo "Commit message: $COMMIT_MSG" # Debug output

if ! echo "$COMMIT_MSG" | grep -q ":[^:]*:"; then
    echo "analyzing commit emoji"
    BASE_DIR=$(dirname  "${BASH_SOURCE[0]}")
    GIT_DIFF=$(git diff --cached)
    
    COMMIT_EMOJI=$(node ${BASE_DIR}/commit-emojier.js "${COMMIT_MSG}" "${GIT_DIFF}")

    echo "$COMMIT_EMOJI $COMMIT_MSG" >$COMMIT_MSG_FILE
    echo "Updated commit message: $(cat $COMMIT_MSG_FILE)" # Debug output
else
    echo "Commit message already contains an emoji."
fi
