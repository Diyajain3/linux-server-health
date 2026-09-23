#!/bin/bash
echo "===== LINUX SERVER HEALTH REPORT====="
echo

echo "Hostname:"
hostname

echo "Uptime:"
uptime

echo
echo "Memory"
free -h

echo
echo "Disk:"
df -h

echo
echo "IP Address:"
ip addr|grep "inet "

echo
echo "Litening Ports:"
ss -tln

echo
echo "SSH Status:"
systemctl is-active sshd

echo
echo "Firewall Status:"
systemctl is-active firewalld

echo
echo "SELinux:"
getenforce

echo
echo "===== END OF REPORT ====="


