#!/bin/sh

conf="/etc/apache2/mods-available/python.conf"

if [ -e $conf ]; then
	echo "\"$conf\" not updated!"
else
	sudo cp python.conf $conf && \
	sudo ln -s ../mods-available/python.conf /etc/apache2/mods-enabled/python.conf
fi
