#!/bin/sh

FICIA_PASS=yourtoken

FICIA_URL=http://ficia.com/api/gr2/eyefi/main.php
FICIA_COOKIE=/tmp/ficia_cookie

curl $FICIA_URL \
    -c $FICIA_COOKIE \
    -d "g2_controller"="remote:GalleryRemote" \
    -d "g2_form[protocol_version]"="2" \
    -d "g2_form[cmd]"="login" \
    -d "g2_form[uname]"="ficia" \
    -d "g2_form[password]"=$FICIA_PASS; \

FILE=`basename $1`

curl $FICIA_URL \
    -b $FICIA_COOKIE \
    -F "g2_controller"="remote:GalleryRemote" \
    -F "g2_form[cmd]"="add-item" \
    -F "g2_userfile_name"=$FILE \
    -F "g2_userfile"="@$1" \
