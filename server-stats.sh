#!/bin/bash



echo "Server Performance stats"

cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
cpu_usage=$(echo "100 - $cpu_idle" | bc)
echo -e "Total CPU usage: \t$cpu_usage%"

mem_total=$(free -m | awk '/Mem:/{print $2}')
mem_used=$(free -m | awk '/Mem:/{print $3}')
mem_free=$(free -m | awk '/Mem:/{print $4}')
mem_pct=$(echo "scale=2; ($mem_used/$mem_total)*100" | bc)
echo -e "Total Memory Usage:\tUsed ${mem_used}MB | Free: ${mem_free}MB (${mem_pct}%)"

disk_total=$(df --total -h | tail -n 1 | awk '{print $2}')
disk_used=$(df --total -h | tail -n 1 | awk '{print $3}')
disk_free=$(df --total -h | tail -n 1 | awk '{print $4}')
disk_pct=$(df --total -h | tail -n 1 | awk '{print $5}')
echo -e "Total Disk Usage:\tUsed: ${disk_used} | Free: ${disk_free} (Total: ${disk_total}, Used%: ${disk_pct})"

echo -e "\n---- Top 5 Processes by CPU Usage -----"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6 | awk 'NR>1'

echo -e "\n---- Top 5 Processes by Memory Usage----"
ps -eo pid,cmd,%mem --sort=-%mem | head -n 6 | awk 'NR>1'