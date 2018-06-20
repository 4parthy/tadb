#!/bin/bash
vpkfile=$1
vpk l $vpkfile > files.txt
while read -r line
do
    path=${line%/*}
    if [ ! -d "$path" ]; then mkdir -p $path; fi
    vpk -v x $vpkfile $line
done < files.txt
