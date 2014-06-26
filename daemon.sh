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
#
# OBS.: Use GNU Netcat in Ubuntu see http://stackoverflow.com/questions/10065993/how-to-switch-to-netcat-traditional-in-ubuntu
#################
while true
do
  /bin/nc.traditional -l -p "$PORT" -e "$PROGRAM"
done
