# Linux Server Health Check

A simple Bash script that generates a quick health report for a Linux server — covering system info, memory, disk usage, network configuration, and open ports.

## Features

- **System Info** – hostname, uptime, and load average
- **Memory Usage** – total, used, free, and available RAM/swap
- **Disk Usage** – filesystem usage across all mounted volumes
- **Network** – IP address details
- **Open Ports** – all currently listening ports and services

## Usage

Clone the repository:

\`\`\`bash
git clone https://github.com/Diyajain3/linux-server-health.git
cd linux-server-health
\`\`\`

Make the script executable and run it:

\`\`\`bash
chmod +x scripts/health_check.sh
./scripts/health_check.sh
\`\`\`

## Sample Output

\`\`\`
===== LINUX SERVER HEALTH REPORT =====

Hostname:
  diyajain

Uptime:
  15:23:22 up 1:49, 1 user, load average: 0.85, 1.18, 1.03

Memory:
              total   used   free   shared  buff/cache  available
  Mem:        1.7Gi   1.3Gi  312Mi  21Mi    261Mi       410Mi
  Swap:       2.0Gi   821Mi  1.2Gi

Disk:
  Filesystem              Size  Used  Avail  Use%  Mounted on
  /dev/mapper/rl_l0-root  16G   4.7G  12G    30%   /
  /dev/sda2               2.0G  567M  1.4G   29%   /boot

IP Address:
  inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3

Listening Ports:
  State    Local Address:Port
  LISTEN   0.0.0.0:80
  LISTEN   0.0.0.0:22
  LISTEN   127.0.0.1:631
\`\`\`

## Requirements

- Linux (tested on RHEL/CentOS-based systems)
- Bash shell
- Standard system utilities: `df`, `free`, `ss`, `uptime`, `ip`

## License

This project is open source and available under the [MIT License](LICENSE).
