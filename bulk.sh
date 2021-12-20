#!/bin/bash
#
# if you know what's the purpose of this file, what's your's ?
#

find . -name "*.0" -type f -print >> files.map;
find . -name "*.1" -type f -print >> files.map;
find . -name "*.2" -type f -print >> files.map;
find . -name "*.3" -type f -print >> files.map;
find . -name "*.4" -type f -print >> files.map;
find . -name "*.5" -type f -print >> files.map;
find . -name "*.6" -type f -print >> files.map;
find . -name "*.7" -type f -print >> files.map;
find . -name "*.8" -type f -print >> files.map;
find . -name "*.9" -type f -print >> files.map;

#shotky . -f file.map

LINES=$(cat files.map);
for LINE in $LINES
do
    EXT="$(file -b --extension $LINE)";
    EXT="$(echo $EXT | cut -d'/' -f 1 )";
    
    if [[ -z $(echo $EXT | grep "???") ]];
    then
        mv "$LINE" "$LINE.$EXT";
        echo -e "add $EXT to $LINE" >> fileop.trace;
        echo "$LINE --> $EXT";

    elif [[ -n $(file -b $LINE | grep "MP4") ]];
    then
        mv "$LINE" "$LINE.mp4";
        echo -e "add mp4 to $LINE" >> fileop.trace;
        echo "$LINE --> mp4";
    
    elif [[ -n $(file -b $LINE | grep "JSON") ]];
    then
        mv "$LINE" "$LINE.json";
        echo -e "add json to $LINE" >> fileop.trace;
        echo "$LINE --> json";
    
    fi
done