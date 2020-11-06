#!/bin/bash

MOUNT_POINT='/media/grzegorz/'
NAME_WIN_SYSTEM='Win_SystemFiles'
NAME_WIN_DATE='Win_Date'
NAME_MINT_DATE='Mint_Date'

PARTITION_WIN_SYSTEM='/dev/sda4'
PARTITION_WIN_DATE='/dev/sda5'
PARTITION_MINT_DATE='/dev/sda6'

make_catalog () {
	[ ! -d "$1" ] && ((sudo mkdir $1) || (echo "I cant make directory" && exit))
}

mount_partition () { #partition path, mount point, partition name
	if [ ! "$(ls -A $2$3)" ]; then ((sudo mount $1 $2$3) && (echo -e "$3\tare mounted"))
	else echo -e "$3\twas mounted" 
	fi
}

mount_Win_SystemFiles () {
	make_catalog ${NAME_WIN_SYSTEM}
	mount_partition ${PARTITION_WIN_SYSTEM} ${MOUNT_POINT} ${NAME_WIN_SYSTEM}
}

mount_Win_Date () {
	make_catalog ${NAME_WIN_DATE}
	mount_partition ${PARTITION_WIN_DATE} ${MOUNT_POINT} ${NAME_WIN_DATE}
}

mount_Mint_Date () {
	make_catalog ${NAME_MINT_DATE}
	mount_partition ${PARTITION_MINT_DATE} ${MOUNT_POINT} ${NAME_MINT_DATE}
}

echo "DiskMounter"
cd ${MOUNT_POINT} || (echo "I cant go to /media/grzegorz" && exit)
echo "mount point: ${MOUNT_POINT}"
echo "partition to mount:"
echo -e "1\t${NAME_WIN_SYSTEM}\n2\t${NAME_WIN_DATE}\n3\t${NAME_MINT_DATE}\n"

mount_Win_SystemFiles
mount_Win_Date
mount_Mint_Date
