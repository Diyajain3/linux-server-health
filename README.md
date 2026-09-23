#!/bin/bash

# ===================================================
# Linux Server Health Check Script
# Author: Diya Jain
# Description: Generates a quick health report covering
#              system info, memory, disk, network, and ports
# ===================================================

# Thresholds for warnings
DISK_THRESHOLD=80
MEM_THRESHOLD=80

echo "===== LINUX SERVER HEALTH REPORT ====="
echo "Generated on: $(date)"
echo ""

# ---------- Hostname ----------
echo "Hostname:"
hostname
echo ""

# ---------- Uptime ----------
echo "Uptime:"
uptime
echo ""

# ---------- Memory ----------
echo "Memory:"
free -h
echo ""

# Check memory usage percentage
MEM_USED_PERCENT=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
if [ "$MEM_USED_PERCENT" -ge "$MEM_THRESHOLD" ]; then
    echo "⚠️  WARNING: Memory usage is at ${MEM_USED_PERCENT}% (threshold: ${MEM_THRESHOLD}%)"
    echo ""
fi

# ---------- Disk ----------
echo "Disk:"
df -h --output=source,size,used,avail,pcent,target | grep -v tmpfs
echo ""

# Check disk usage on root partition
DISK_USED_PERCENT=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USED_PERCENT" -ge "$DISK_THRESHOLD" ]; then
    echo "⚠️  WARNING: Root disk usage is at ${DISK_USED_PERCENT}% (threshold: ${DISK_THRESHOLD}%)"
    echo ""
fi

# ---------- IP Address ----------
echo "IP Address:"
ip -4 addr show | grep inet
echo ""

# ---------- Listening Ports ----------
echo "Listening Ports:"
ss -tuln

# To add this to your project
nano scripts/health_check.sh

# Paste the script, save (Ctrl+O, Enter, Ctrl+X), then make it executable
chmod +x scripts/health_check.sh
./scripts/health_check.sh

# Commit and push
git add scripts/health_check.sh
git commit -m "Add health check script with threshold warnings"
git push
echo ""

echo "===== END OF REPORT ====="
