HUSKY_DIR_PATH="../../.husky"

if [ ! -d $HUSKY_DIR_PATH ]; then
    echo "husky git hooks are not found. please make sure you install husky before installing the package"
    exit 1
fi

RUN_COMMIT_MSG_COMMAND="./node_modules/feelem/scripts/commit-msg.sh \$@"
COMMIT_MSG_HOOK_FILE=$HUSKY_DIR_PATH/commit-msg

if ! grep -q "${RUN_COMMIT_MSG_COMMAND}" "$COMMIT_MSG_HOOK_FILE"; then
    echo $RUN_COMMIT_MSG_COMMAND >>$COMMIT_MSG_HOOK_FILE
fi
