#!/bin/bash
set -e

# Only run if template exists
if [ -f "/etc/tinc/tinc.conf.in" ]
then
	# If TINC_CONNECT_TO is not set, set it to all filenames in /etc/tinc/hosts
	if [ -z "$TINC_CONNECT_TO" ]
	then
		TINC_CONNECT_TO=$(ls -1 /etc/tinc/hosts/)
	fi

	# Expand TINC_CONNECT_TO to multiline configuration and ignore myself
	for connect_target in $TINC_CONNECT_TO
	do
		if [ "$connect_target" != "$TINC_NAME" ]
		then
			TINC_CONFIG_APPEND="ConnectTo = $connect_target
$TINC_CONFIG_APPEND"
		fi
	done
	export TINC_CONFIG_APPEND

	envsubst < /etc/tinc/tinc.conf.in > /etc/tinc/tinc.conf
fi

exec /usr/sbin/tincd $@
