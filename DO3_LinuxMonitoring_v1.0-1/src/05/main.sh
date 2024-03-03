

#!/bin/bash

if [ $# -ne 1 ];
then
    echo "incorrect number of parameters"
else
    str=$@
    if [ ${str:$((${#str}-1)):1} != '/' ] || [ ! -d $str ];
    then
        echo "Incorrect input"
    else
        begin=$(date +%s)
        echo "Total number of folders (including all nested ones) = $(sudo ls ${str} -l | grep -c ^d)"
        echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
        echo "$(sudo du -h ${str} | sort -hr | head -n 5 | cat -n | awk '{printf "%s — %s/\, %s\n", $1, $3, $2 }')"
        echo "Total number of files = $(sudo ls ${str} -l | grep -e "^d" -e "total" -vc)"
        echo "Configuration files (with the .conf extension) = $(ls ${str} | grep .conf | wc -w)"
        echo "Number of:"
        echo "Text files = $(ls ${str} | grep .txt | wc -w)"
        echo "Executable files = $(ls ${str} | grep .exe | wc -w)"
        echo "Log files (with the extension .log) = $(ls ${str} | grep .log | wc -w)"
        echo "Archive files = $(ls ${str} | grep ".\(rar\|tar\|zip\|gz\)" | wc -w)"
        echo "Symbolic links = $(ls -l ${str} | grep ^l -c)"
        echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
        echo "$(sudo find ${str} -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')"
        echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
        echo "$(sudo find ${str} -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')"
        end=$(date +%s)
        echo "Script execution time (in seconds) = $(( $end - $begin ))"
    fi
fi
# tar zip gz rar
