#!/bin/bash
filename=$1
operation=$2
edit=$3

if [ $# -ne 2 ]
then
    echo "invalid no of arguments, please provide only 2 args" 
    exit 1
fi

file_info () {

    owner=$(stat -c %U "$filename")
    group=$(stat -c %G "$filename")
    permissions=$(stat -c %a "$filename")
    size=$(stat -c %s "$filename")
    lines=$(wc -l < $filename)

    echo "
    The required details of the $filename are:

    owner: "$owner"
    group: "$group"
    permissions: "$permissions"
    size: "$size"
    number of lines: "$lines"
    "
}

if [ "$operation" = "create" ]; then
    if [ -f "$filename" ]; then
        file_info
    else
        echo "$filename not present, creating the new file: "
        touch "$filename"
        echo "$filename created successfully"
        echo "adding sample data"
        echo "hello world" >> "$filename"
        file_info
    fi

elif    [ "$operation" = "delete" ]; then
        if [ -f "$filename" ]; then
            echo "deleting the $filename"
            rm -rf "$filename"
            echo "$filename deleted"
        else
            echo "$filename not present"
        fi

elif [ "$operation" = "edit" ]; then
    if [ -f "$filename" ]; then
        echo "Opening $filename for editing..."
        nano "$filename"
    else
        echo "$filename not found. Creating and opening for editing..."
        nano "$filename"
    fi
else
    echo "invalid operation"        
fi     







