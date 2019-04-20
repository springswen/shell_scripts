#!/bin/bash
###
#S3 USER ADMIN 
###

###==============WRITE BEGIN=============###
ACCESS_KEY=admin ## ADMIN_USER_TOKEN
SECRET_KEY=123456 ## ADMIN_USER_SECRET
HOST=192.168.19.104:80
USER_ACCESS_KEY="&access-key=user1"
USER_SECRET_KEY="&secret-key=123456"
###==============WRITE  FINAL=======FINAL=====###

query2=admin/user
userid=$1
name=$2
uid="&uid="
date=`TZ=GMT LANG=en_US date "+%a, %d %b %Y %H:%M:%S GMT"`
header="PUTnnn${date}n/${query2}"
sig=$(echo -en ${header} | openssl sha1 -hmac ${SECRET_KEY} -binary | base64)
curl -v -H "Date: ${date}" -H "Authorization: AWS ${ACCESS_KEY}:${sig}" -L -X PUT "http://${HOST}/${query2}?format=json${uid}${userid}&display-name=${name}${USER_ACCESS_KEY}${USER_SECRET_KEY}" -H "Host: ${HOST}"
echo ""
