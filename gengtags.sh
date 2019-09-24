#!/bin/bash↵
find $PWD/dni -name "*.c" -o -name "*.h" -o -name "*.asp" -o -name "*.js" -o -name "*.cfg" -o -name "*.def" -o -name "Makefile" > gtags.files↵
find $PWD/driver -name "*.c" -o -name "*.h" -o -name "*.asp" -o -name "*.js" -o -name "*.cfg" -o -name "*.def" -o -name "Makefile" >> gtags.files

TARGET_DIR=$PWD↵
IFS='/'↵
read -ra MYDIR <<< "$TARGET_DIR"↵
for path in "${MYDIR[@]}"↵
do↵
    if [[ ! -z $path ]]↵
    then↵
        mypath=$mypath$path-↵
    fi↵
done↵
↵
# remove the last '-'↵
mypath=${mypath%-}↵
# DEBUG-project path↵
echo "mypath=$mypath"↵
project=~/.cache/tags/$mypath↵
target_path=`echo $project | sed -e 's/[[:space:]]/\//g'`↵
# DEBUG target path↵
echo "$target_path"↵
gtags -f gtags.files↵
mv "$PWD/GPATH"  "$target_path"↵
mv "$PWD/GRTAGS" "$target_path"↵
mv "$PWD/GTAGS"  "$target_path"↵
