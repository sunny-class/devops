#!/bin/bash

a=1

until (($a == 5))
do
    echo "$a"
    ((a++))
done