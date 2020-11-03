#!/bin/bash

plik=test

if [ -e ${plik} ]
then
	echo "$plik istnieje"
else
	echo "$plik nieistnieje"
fi

