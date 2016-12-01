#!/bin/bash


find . -type f -iname "a_*" |
while read filename
do
   echo $filename
   base=`basename ${filename}`
   dir=`dirname ${filename}` 
   file="${base%.*}"
   timestamp=`echo $file|cut -d'_' -f4`
   newtimestamp=`expr $timestamp + 1`
   echo $newtimestamp
   newfilename=`echo "$base" | sed -e "s/${timestamp}/${newtimestamp}/g"`
   mv ${dir}/${base} ${dir}/${newfilename};
done
