#!/bin/bash
vpkfile=$1
vpk l $vpkfile > files.txt
while read -r line
do
    mkdir -p ${line%/*}
    vpk -v x $vpkfile $line
done < files.txt
