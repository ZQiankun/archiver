#!/bin/sh
#

# fixme
FULL_NAME=`grep $USER /etc/passwd | awk -F '[:,]' '{print $5}'`

if [ -z "${USER_EMAIL}" ]; then
	USER_EMAIL=`echo ${FULL_NAME} | tr 'A-Z' 'a-z' | sed 's/ /./g'`
	USER_EMAIL="${USER_EMAIL}@maxwit.com"
fi

############# configure git ############
echo "---- GIT Configuration ---"
git config --list | grep ^color.ui || \
	git config --global color.ui auto

git config --list | grep ^user.name || \
	git config --global user.name "${FULL_NAME}"

git config --list | grep ^user.email || \
	git config --global user.email ${USER_EMAIL}

git config --list | grep ^sendemail.smtpserver || \
	git config --global sendemail.smtpserver /usr/bin/msmtp
