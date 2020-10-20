#!/bin/bash

file=tekst
{
read line1
read line2
}<$file


echo "$line1"
echo "$line2"
