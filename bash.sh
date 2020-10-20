#!/bin/bash

plik="Nokia"
cat ${plik}


if [ "$?" -eq 0 ]
then
	echo "plik istnieje"
else
	echo "plik nie istnieje"
fi

