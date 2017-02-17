#!/bin/bash

# Property: store-symlinks
# Must be a valid boolean (true, false, 1 or 0)
case "$WERCKER_ZIP_STORE_SYMLINKS" in
  "true" | "1" ) WERCKER_ZIP_STORE_SYMLINKS=1 ;;
  "false" | "0" ) WERCKER_ZIP_STORE_SYMLINKS=0 ;;
  * ) fail "Property store-symlinks must be true or false"
esac

# Property: quiet
# Must be a valid boolean (true, false, 1 or 0)
case "$WERCKER_ZIP_QUIET" in
  "true" | "1" ) WERCKER_ZIP_QUIET=1 ;;
  "false" | "0" ) WERCKER_ZIP_QUIET=0 ;;
  * ) fail "Property quiet must be true or false"
esac

# Dependency: ZIP
# Install ZIP if not available
if [[ ! -n "$(type -t zip)" ]];
then
    apt-get update
    apt-get install -y zip
fi

# Task: ZIP
# Compress and package the directory
zip -r \
  $( [[ "$WERCKER_ZIP_QUIET" == "1" ]] && echo " -q " ) \
  --exclude="*.git*" \
  $( [[ "$WERCKER_ZIP_STORE_SYMLINKS" == "1" ]] && echo " --symlinks " ) \
  $WERCKER_ZIP_OPTS "$WERCKER_ZIP_TARGET_FILE" $WERCKER_ZIP_SOURCES
