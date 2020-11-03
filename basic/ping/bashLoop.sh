#!/bin/bash

for i in {1..5}
do
	echo ping 100.100.100.$i
	ping -c 1 100.100.100.$i | grep "bytes of data"
done

echo Done!

