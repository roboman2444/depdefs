#!/bin/sh
##roboman2444 was here
CHECKFILES=

while [[ $# > 0 ]] ; do
	CHECKFILES="$CHECKFILES
$1"
	shift
done
ALLFILES="$CHECKFILES"
while [ ! -z "$CHECKFILES" ] ; do
CHECKFILES=$(grep "#include" $CHECKFILES 2>/dev/null| sed 's/\/\/.*//' |grep -oP '(?<=").*(?=")')
ALLFILES="$ALLFILES
$CHECKFILES"
done

echo "$ALLFILES" | sort -u
