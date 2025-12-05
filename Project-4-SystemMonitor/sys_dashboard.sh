#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

tput civis
trap "tput cnorm; exit" INT

get_cpu_usage() {
    cpu_line=$(grep '^cpu ' /proc/stat)
    idle1=$(echo $cpu_line | awk '{print $5}')
    total1=$(echo $cpu_line | awk '{sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}')

    sleep 0.4

    cpu_line=$(grep '^cpu ' /proc/stat)
    idle2=$(echo $cpu_line | awk '{print $5}')
    total2=$(echo $cpu_line | awk '{sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}')

    idle_delta=$((idle2 - idle1))
    total_delta=$((total2 - total1))
    usage=$((100 * (total_delta - idle_delta) / total_delta))

    echo "$usage"
}

get_ram_usage() {
    free -m | awk '/Mem:/ {printf("%d", $3/$2 * 100)}'
}

get_disk_usage() {
    df -h / | awk 'NR==2 {gsub("%",""); print $5}'
}

bar() {
    value=$1
    width=30
    filled=$((value * width / 100))
    empty=$((width - filled))

    printf "["
    printf "%${filled}s" | tr ' ' '#'
    printf "%${empty}s" | tr ' ' '-'
    printf "]"
}

while true; do
    # Move cursor to top-left
    tput cup 0 0

    # Clear screen from cursor downward WITHOUT full clear (no flicker)
    printf "\033[0J"

    cpu=$(get_cpu_usage)
    ram=$(get_ram_usage)
    disk=$(get_disk_usage)

    echo -e "${CYAN}=========== SYSTEM DASHBOARD ===========${RESET}"
    echo -e "CPU:  ${YELLOW}${cpu}%${RESET}  $(bar $cpu)"
    echo -e "RAM:  ${GREEN}${ram}%${RESET}  $(bar $ram)"
    echo -e "Disk: ${BLUE}${disk}%${RESET}  $(bar $disk)"

    echo ""
    echo -e "${CYAN}Top Processes:${RESET}"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -6

    echo ""
    echo "(Press CTRL+C to exit)"

    sleep 1
done
