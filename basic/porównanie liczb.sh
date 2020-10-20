#!/bin/bash

read -ep "wprowadz:" num1
read -ep "wprowadz:" num2

if [ $num1 -gt $num2 ]
then
	echo $num1 wieksze niz $num2
else
	echo $num2 wieksze niz $num1 

fi
