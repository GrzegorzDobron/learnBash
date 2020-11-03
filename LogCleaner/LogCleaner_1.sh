#!/bin/bash

LOCATION='/var/log'
#LOCATION='/home/grzegorz/bashProject/LogCleaner/log'

function removal {
	echo "removal process"
	for FILE in ${FILES_TABLE}
	do
		echo "removal: ${FILE}"
		sudo rm ${FILE} || echo "failure to remove: ${FILE}"
		
	done
	echo "deletion complete"
	exit
}

function no_agreement {
	echo "no agreement"
	exit
}

echo -e "starting the LogCleaner"
echo -e "tries going to the log localization: ${LOCATION}"

cd ${LOCATION} || (echo "error" && exit)

echo -e -n "\nfiles in current location:"
ls -l | awk '{print $9}'

echo -e -n "\nfiles to delete:\n"
FILES_TABLE=$((ls *.old) && (ls *.log.?)  && (ls *.?.gz) && (ls *.?)):
for FILE in ${FILES_TABLE}
do
	echo ${FILE}
done

echo -e -n "\ndo you confirm the list? [y/n]" && read USER_DECISION

case "${USER_DECISION}" in
	"y") removal		;;
	"Y") removal		;;
	"n") no_agreement	;;
	"N") no_agreement	;;
	*)	 echo "error" 	;;
esac
