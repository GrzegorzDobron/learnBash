#!/bin/bash

dir=/home/grzegorz/Pulpit/bash
file_name=liveHosts
IP=192.168.1
packetNumber=2
IP_host=`hostname -I`
MASK_subnet=`ifconfig | grep "broadcast" | awk '{print $4}'`
broadcastAddress=`ifconfig | grep "broadcast" | awk '{print $6}'`

IP_subnet

IPstart=1
IPend=254

echo " ">&2

echo -e "SKANER SIECI \n\nprzekierowanie do katalogu $dir"
cd $dir
if [ $? -eq 0 ]; then
	echo -e "przekierowanie zakonczone pozytywnie \ntworzenie pliku ${file_name}"
	touch ${file_name}

	if [ $? -eq 0 ]; then
		echo "plik zostal utworzony"
		echo "Ping list:">$file_name
	else
		echo "plik nie zostal utworzony" >&2
		exit 1
	fi
else
	echo "przekierowanie zakończone niepowodzeniem" >&2
	exit 2
fi
echo "==================="
echo "zawartosc pliku $file_name:"
cat $file_name
echo "==================="
echo -e "$HOSTNAME o IP: $IP_host rozpoczyna skanowanie sieci:"
echo -e "maska sieci:\t\t$MASK_subnet \nadres rozgloszeniowy: \t$broadcastAddress\n"

for i in $(seq $IPstart $IPend); do
	echo "Ping: $IP.$i"
	ping -c $packetNumber $IP.$i | grep "bytes from" >> $file_name;
done

echo "done!"
cat $file_name

