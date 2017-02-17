#!/bin/bash

# Property: symlinks
# Must be a valid boolean (true, false, 1 or 0)
case "$WERCKER_ZIP_SYMLINKS" in
  "true" | "1" ) WERCKER_ZIP_SYMLINKS=1 ;;
  "false" | "0" ) WERCKER_ZIP_SYMLINKS=0 ;;
  * ) fail "Property symlinks must be true or false"
esac

# Property: quiet
# Must be a valid boolean (true, false, 1 or 0)
case "$WERCKER_ZIP_QUIET" in
  "true" | "1" ) WERCKER_ZIP_QUIET=1 ;;
  "false" | "0" ) WERCKER_ZIP_QUIET=0 ;;
  * ) fail "Property quiet must be true or false"
esac

# Property: exclude-git
# Must be a valid boolean (true, false, 1 or 0)
case "$WERCKER_ZIP_EXCLUDE_GIT" in
  "true" | "1" ) WERCKER_ZIP_EXCLUDE_GIT=1 ;;
  "false" | "0" ) WERCKER_ZIP_EXCLUDE_GIT=0 ;;
  * ) fail "Property exclude-git must be true or false"
esac

# Optional properties
WERCKER_ZIP_OPTS="${WERCKER_ZIP_OPTS:-""}"
WERCKER_ZIP_INPUT_FILES="${WERCKER_ZIP_INPUT_FILES:-"."}"
WERCKER_ZIP_OUTPUT_FILE="${WERCKER_ZIP_OUTPUT_FILE:-"$WERCKER_ROOT/$WERCKER_GIT_COMMIT.zip"}"
WERCKER_ZIP_EXCLUDE="${WERCKER_ZIP_EXCLUDE:-""}"

# Dependency: ZIP
# Install ZIP if not available
if [[ ! -n "$(type -t zip)" ]];
then
    apt-get update
    apt-get install -y zip
fi

env

# Task: ZIP
# Compress and package the directory
zip -r \
  $( [[ "$WERCKER_ZIP_QUIET" == "1" ]] && echo " -q " ) \
  $( [ ! -z "$WERCKER_ZIP_EXCLUDE" ] && echo " --exclude=$WERCKER_ZIP_EXCLUDE " ) \
  $( [[ "$WERCKER_ZIP_EXCLUDE_GIT" == "1" ]] && echo " --exclude=*.git* " ) \
  $( [[ "$WERCKER_ZIP_SYMLINKS" == "1" ]] && echo " --symlinks " ) \
  $WERCKER_ZIP_OPTS "$WERCKER_ZIP_OUTPUT_FILE" $WERCKER_ZIP_INPUT_FILES
