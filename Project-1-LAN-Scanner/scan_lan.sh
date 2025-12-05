
#!/bin/bash
# scan_lan.sh
nmap -sn 192.168.1.0/24 >~/lan_scan.txt
echo "LAN scan done! Results saved in ~/lan_scan.txt"


