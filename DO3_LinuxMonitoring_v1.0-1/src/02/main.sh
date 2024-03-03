
#!/bin/bash

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
filename=$(date "+%d_%m_%y_%H_%M_%S")

echo "HOSTNAME = $hostname_var"
echo "TIMEZONE = $timezone_var"
echo "USER = $user_var"
echo "OS = $os_var"
echo "DATE = $date_var"
echo "UPTIME = $uptime_var"
echo "UPTIME_SEC = $uptime_var"
echo "IP = $ip_var"
echo "MASK = $mask_var"
echo "GATEWAY = $gateway_var"
echo "RAM_TOTAL = $ram_total_var"
echo "RAM_USED = $ram_used_var"
echo "RAM_FREE = $ram_free_var"
echo "SPACE_ROOT = $space_root_var"
echo "SPACE_ROOT_USED = $space_root_used_var"
echo "SPACE_ROOT_FREE = $space_root_free_var"

read -p "Do you want to writw this info into a file? [y/n]" answer

if [ $answer == "y" ] || [ $answer == 'Y' ]; #проверить работу с каким-то одним условием
then
    touch $filename.status
    echo "HOSTNAME = $hostname_var" >> $filename.status
    echo "TIMEZONE = $timezone_var" >> $filename.status
    echo "USER = $user_var" >> $filename.status
    echo "OS = $os_var" >> $filename.status
    echo "DATE = $date_var" >> $filename.status
    echo "UPTIME = $uptime_var" >> $filename.status
    echo "UPTIME_SEC = $uptime_var" >> $filename.status
    echo "IP = $ip_var" >> $filename.status
    echo "MASK = $mask_var" >> $filename.status
    echo "GATEWAY = $gateway_var" >> $filename.status
    echo "RAM_TOTAL = $ram_total_var" >> $filename.status
    echo "RAM_USED = $ram_used_var" >> $filename.status
    echo "RAM_FREE = $ram_free_var" >> $filename.status
    echo "SPACE_ROOT = $space_root_var" >> $filename.status
    echo "SPACE_ROOT_USED = $space_root_used_var" >> $filename.status
    echo "SPACE_ROOT_FREE = $space_root_free_var" >> $filename.status
fi
