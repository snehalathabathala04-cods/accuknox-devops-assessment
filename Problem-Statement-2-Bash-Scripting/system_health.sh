#!/bin/bash

echo "===== System Health Monitoring ====="

# Set Thresholds
CPU_LIMIT=80
MEMORY_LIMIT=80
DISK_LIMIT=80
PROCESS_LIMIT=200

# 1. CPU Usage
CPU=$(top -bn2 -d 1 | grep '%Cpu' | tail -1 | awk '{print int(100-$8)}')

echo "CPU Usage: $CPU%"

if [ "$CPU" -gt "$CPU_LIMIT" ]; then
    echo "WARNING: High CPU Usage"
else
    echo "CPU Status: Normal"
fi

# 2. Memory Usage
MEMORY=$(free | awk '/^Mem:/ {print int($3/$2*100)}')

echo "Memory Usage: $MEMORY%"

if [ "$MEMORY" -gt "$MEMORY_LIMIT" ]; then
    echo "WARNING: High Memory Usage"
else
    echo "Memory Status: Normal"
fi

# 3. Disk Usage
DISK=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage: $DISK%"

if [ "$DISK" -gt "$DISK_LIMIT" ]; then
    echo "WARNING: High Disk Usage"
else
    echo "Disk Status: Normal"
fi

# 4. Running Processes
PROCESSES=$(ps -e --no-headers | wc -l)

echo "Total Processes: $PROCESSES"

if [ "$PROCESSES" -gt "$PROCESS_LIMIT" ]; then
    echo "WARNING: High Process Count"
else
    echo "Process Status: Normal"
fi

echo "===== Monitoring Completed ====="
