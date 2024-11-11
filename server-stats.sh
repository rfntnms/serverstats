#!/bin/bash

echo "==================== SERVER STATS ===================="

# Total CPU usage
echo "1. Total CPU Usage:"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $cpu_usage%"

# Total Memory usage (Free vs Used including percentage)
echo ""
echo "2. Total Memory Usage:"
total_mem=$(free -m | awk '/^Mem:/{print $2}')
used_mem=$(free -m | awk '/^Mem:/{print $3}')
free_mem=$(free -m | awk '/^Mem:/{print $4}')
mem_percentage=$(awk "BEGIN {printf \"%.2f\", ($used_mem/$total_mem)*100}")
echo "Total Memory: $total_mem MB"
echo "Used Memory: $used_mem MB ($mem_percentage%)"
echo "Free Memory: $free_mem MB"

# Total Disk usage (Free vs Used including percentage)
echo ""
echo "3. Total Disk Usage:"
disk_usage=$(df -h --total | grep 'total' | awk '{print $3}')
disk_free=$(df -h --total | grep 'total' | awk '{print $4}')
disk_percentage=$(df -h --total | grep 'total' | awk '{print $5}')
echo "Disk Used: $disk_usage"
echo "Disk Free: $disk_free"
echo "Disk Usage Percentage: $disk_percentage"

# Top 5 processes by CPU usage
echo ""
echo "4. Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo ""
echo "5. Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo "======================================================"
