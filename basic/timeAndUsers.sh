#!/bin/bash

time=`date +%H:%M`
date=`date +%A`

echo "Cześć `users`"
echo -e "aktualna godzina to:\t$time\ndzisiaj jest:\t\t$date\n"
echo "aktualnie zalogowani są: `w`"
