#!/bin/sh

ICON="﨩"

trap 'leftclick' SIGUSR1
trap 'middleclick' SIGUSR2

leftclick() {
	echo "${ICON} Preparing..." &&
		{ sudo archtorify -t || sudo archtorify -r; } >/dev/null 2>&1 &&
		get_info
}

middleclick() {
	pgrep -x tor >/dev/null &&
		echo "${ICON} Shutting down..." &&
		sudo archtorify -c >/dev/null 2>&1 &&
		get_info
}

get_info() {
	if pgrep -x tor >/dev/null; then
		INFO=$(curl -s http://ip-api.com/json/) &&
			COUNTRY_CODE=$(echo $INFO | jq -r '.countryCode') &&
			IP=$(echo $INFO | jq -r '.query') &&
			echo "${ICON} ${COUNTRY_CODE} ${IP}"
	else
		echo "${ICON} Off"
	fi
}

while true; do
	get_info
	sleep 60 &
	wait $!
done
