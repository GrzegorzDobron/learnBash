#!/bin/bash

echo " " >> live
for i in {2..254}
do
	echo "PING 1.1.1.$i"
	ping -c 4 1.1.1.$i | grep "bytes from" >> live;
done

echo "done"
cat live
