
#!/bin/bash

if [ $# == 1 ];
then
    if [[ ${!#} =~ ^[-+]?[0-9]+([.][0-9]+)?$ ]]; then
        echo "${!#} is a number"
    else
        echo "${!#}"
    fi
else
    echo "The number of input parameters is invalid"
fi
