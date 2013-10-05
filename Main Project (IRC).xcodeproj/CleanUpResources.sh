#!/bin/sh

if [ "${IRC_GITREF_BUILD_ID}" == "debug" ]; then exit; fi;

rm -rf "${PROJECT_DIR}/Build Results/"
rm -rf "${PROJECT_DIR}/.tmp/"

