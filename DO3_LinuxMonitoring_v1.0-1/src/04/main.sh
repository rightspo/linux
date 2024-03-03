
#!/bin/bash

config_color=(0 0 0 0)

if [ ! -z $(ls | grep config_file.txt) ];
then
    if [ $(grep "column1_background=" -c config_file.txt) -eq 1 ];
    then
        if [ ! -z $(grep "column1_background=" config_file.txt | sed 's/column1_background=//') ]
        then
            config_color[0]=$(grep "column1_background=" config_file.txt | sed 's/column1_background=//')
        fi
    fi

    if [ $(grep "column1_font_color=" -c config_file.txt) -eq 1 ];
    then
        if [ ! -z $(grep "column1_font_color=" config_file.txt | sed 's/column1_font_color=//') ]
        then
            config_color[1]=$(grep "column1_font_color=" config_file.txt | sed 's/column1_font_color=//')
        fi
    fi

    if [ $(grep "column2_background=" -c config_file.txt) -eq 1 ];
    then
        if [ ! -z $(grep "column2_background=" config_file.txt | sed 's/column2_background=//') ]
        then
            config_color[2]=$(grep "column2_background=" config_file.txt | sed 's/column2_background=//')
        fi
    fi

    if [ $(grep "column2_font_color=" -c config_file.txt) -eq 1 ];
    then
        if [ ! -z $(grep "column2_font_color=" config_file.txt | sed 's/column2_font_color=//') ]
        then
            config_color[3]=$(grep "column2_font_color=" config_file.txt | sed 's/column2_font_color=//')
        fi
    fi
fi

count=0
result_color=(1 2 3 4)

for param in ${config_color[*]}
do
    if [ $param -ne 0 ] && [ $param -ge 0 ] && [ $param -lt 7 ];
    then
        result_color[$count]=$param
    fi
    echo "${param}   ${result_color[$count]}"
    count=$(( $count + 1 ))
done

NC='\033[0m'
#1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black
colors=(white red green blue purple black)
text_color=(37 31 32 34 35 30)
background_color=(107 41 42 44 45 40)

hostname_var="$(hostname)"
timezone_var="$(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")"
user_var="$(whoami)"
os_var="$(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')"
date_var="$(date | awk '{print $2, $3, $4, $5}')"
uptime_var="$(uptime -p | awk '{print $2, $3, $4, $5}' | sed 's/,//')"
uptime_sec_var="$(awk '{print $1}' /proc/uptime) seconds"
ip_var="$(hostname -I | awk '{print $1}')"
mask_var="$(ifconfig | grep $(hostname -I | awk '{print $1}') | awk '{print $4}')"
gateway_var="$(route -n | grep "G " | awk '{print $2}')"
ram_total_var="$(free --mega | grep "Mem" | awk '{printf "%.3f %s", $2 / 1024, "GB"}')"
ram_used_var="$(free --mega | grep "Mem" | awk '{printf "%.3f %s", $3 / 1024, "GB"}')"
ram_free_var="$(free --mega | grep "Mem" | awk '{printf "%.3f %s", $4 / 1024, "GB"}')"
space_root_var="$(df --block-size=1K | grep "/$"| awk '{printf "%.2f %s", $2 / 1024, "MB"}')"
space_root_used_var="$(df --block-size=1K | grep "/$"| awk '{printf "%.2f %s", $3 / 1024, "MB"}')"
space_root_free_var="$(df --block-size=1K | grep "/$"| awk '{printf "%.2f %s", $4 / 1024, "MB"}')"

first_column_color="\033[${background_color[${result_color[0]} - 1]};${text_color[${result_color[1]} - 1]}m"
second_column_color="\033[${background_color[${result_color[2]} - 1]};${text_color[${result_color[3]} - 1]}m"

echo -e "${first_column_color}HOSTNAME${NC} = ${second_column_color}$hostname_var${NC}"
echo -e "${first_column_color}TIMEZONE${NC} = ${second_column_color}$timezone_var${NC}"
echo -e "${first_column_color}USER${NC} = ${second_column_color}$user_var${NC}"
echo -e "${first_column_color}OS${NC} = ${second_column_color}$os_var${NC}"
echo -e "${first_column_color}DATE${NC} = ${second_column_color}$date_var${NC}"
echo -e "${first_column_color}UPTIME${NC} = ${second_column_color}$uptime_var${NC}"
echo -e "${first_column_color}UPTIME_SEC${NC} = ${second_column_color}$uptime_var${NC}"
echo -e "${first_column_color}IP${NC} = ${second_column_color}$ip_var${NC}"
echo -e "${first_column_color}MASK${NC} = ${second_column_color}$mask_var${NC}"
echo -e "${first_column_color}GATEWAY${NC} = ${second_column_color}$gateway_var${NC}"
echo -e "${first_column_color}RAM_TOTAL${NC} = ${second_column_color}$ram_total_var${NC}"
echo -e "${first_column_color}RAM_USED${NC} = ${second_column_color}$ram_used_var${NC}"
echo -e "${first_column_color}RAM_FREE${NC} = ${second_column_color}$ram_free_var${NC}"
echo -e "${first_column_color}SPACE_ROOT${NC} = ${second_column_color}$space_root_var${NC}"
echo -e "${first_column_color}SPACE_ROOT_USED${NC} = ${second_column_color}$space_root_used_var${NC}"
echo -e "${first_column_color}SPACE_ROOT_FREE${NC} = ${second_column_color}$space_root_free_var${NC}\n"


if [ ${result_color[0]} -eq 1 ];
then
    echo "Column 1 background = default (${colors[0]})"
else
    echo "Column 1 background = ${result_color[0]} (${colors[${result_color[0]} - 1]})"
fi

if [ ${result_color[1]} -eq 2 ];
then
    echo "Column 1 font color = default (${colors[1]})"
else
    echo "Column 1 font color = ${result_color[1]} (${colors[${result_color[1]} - 1]})"
fi

if [ ${result_color[2]} -eq 3 ];
then
    echo "Column 2 background = default (${colors[2]})"
else
    echo "Column 2 background = ${result_color[2]} (${colors[${result_color[2]} - 1]})"
fi

if [ ${result_color[3]} -eq 4 ];
then
    echo "Column 2 font color = default (${colors[3]})"
else
    echo "Column 2 font color = ${result_color[3]} (${colors[${result_color[3]} - 1]})"
fi
