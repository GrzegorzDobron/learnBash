#!/bin/bash

plik='company.txt'

while read line
do
	echo $line
done < $plik
