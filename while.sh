#!/bin/bash

a=1
while (($a <= 10))
do
    echo "$a"
    ((a++))
done


#!/bin/bash
a=1 

while [$a <= 10 ]
do
    echo "$a"
    ((a++))
done    

#!/bin/bash

while true
do
    echo "infinite"
done    


#!/bin/bash

while true
do
        if ping -c 1 google.com &> /dev/null
        then
                echo "internet is up"
        else
                echo "internet is down"
        fi

        sleep 5
done