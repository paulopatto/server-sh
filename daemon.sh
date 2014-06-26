#!/bin/bash

#################
# TERM
#################
trap 'echo "exiting ..."; exit' SIGINT SIGQUIT

#################
# Set ENV
#################
if [ -z "$PROGRAM" ]; then
  PROGRAM="server.sh"
fi

if [ -z "$PORT" ]; then
  PORT=8000
fi

#################
# Start Handle
#################
while true
do
  nc -l -p "$PORT" -e "$PROGRAM"
done
