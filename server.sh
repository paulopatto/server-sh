#!/bin/bash

read URL

while read HEADER
do
  # Read headers
  FULLHEADER="$FULLHEADER\n\t$HEADER"

  # Exit if blank line
  [ -z "$(echo $HEADER | tr -d '\r\n')" ] && break
done

# Log request
echo -e " ------" >&2
echo -e "[$(date) - Server] GET $URL" >&2
echo -e "\t HEADER: $FULLHEADER" >&2

#ROLES
TARGET=$(echo $URL | cut -d ' ' -f 2)

case $TARGET in
/index)
  FILE="index.html"
  STATUS_NUMBER="200"
  STATUS_NAME="OK"
;;
/contact)
  FILE="contact.html"
  STATUS_NUMBER="200"
  STATUS_NAME="OK"
;;
*)
  FILE="404.html"
  STATUS_NUMBER="404"
  STATUS_NAME="NotFound"
;;
esac


# Request reply
cat <<EOF
HTTP/1.1 $STATUS_NUMBER - $STATUS_NAME
Date: $(date)
Server: Linux Server SH 0.1
Content-Length: $(wc --bytes $FILE | cut -d ' ' -f 1)
Connection: close
Content-Type: text/html; charse=utf-8

$(cat $FILE)
EOF
