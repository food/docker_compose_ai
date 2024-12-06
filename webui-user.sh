#!/bin/bash
export COMMANDLINE_ARGS="$COMMANDLINE_ARGS --enable-insecure-extension-access --listen"
export COMMANDLINE_ARGS="$COMMANDLINE_ARGS --opt-sdp-attention --xformers --api"
if [ "$IS_LOWVRAM" = "true" ]; then
  export COMMANDLINE_ARGS="$COMMANDLINE_ARGS --lowvram --opt-split-attention"
elif [ "$IS_MEDVRAM" = "true" ]; then
  export COMMANDLINE_ARGS="$COMMANDLINE_ARGS --medvram --opt-sdp-attention"
fi

echo "Command line args = ${COMMANDLINE_ARGS}"