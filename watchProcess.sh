#!/bin/bash

. /var/lib/jenkins/.nvm/nvm.sh 
. environment.sh 
nvm use "$1"
command="$2"
log="watchProcess.log"
match="$3"

$command > "$log" 2>&1 &
pid=$!

while sleep 5
do
    if fgrep --quiet "$match" "$log"
    then
        kill $pid
        exit 0
    fi
done
