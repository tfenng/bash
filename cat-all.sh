#!/bin/bash
if test $# -lt 2
then
  echo "Usage: cat-all.sh src_directory file_extension"
  exit
fi

dir=$1
ext=$2
cmd="find $dir -type f -name \"*.$ext\""

while IFS= read -r sf; do
	cat "$sf" | sed '/^\s*#/d'
done < <(eval "$cmd")
