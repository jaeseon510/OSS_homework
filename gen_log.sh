#!/bin/bash
# 사용법: ./gen_log.sh <SID4>
RANDOM=$((10#$1))
ips=(10.0.0.1 10.0.0.7 172.16.3.4 192.168.1.10 192.168.1.23 203.0.113.5 198.51.100.9)
paths=(/ /index.html /login /api/users /api/orders /images/logo.png /admin)
codes=(200 200 200 200 304 404 500 403)
for i in $(seq 1 1000); do
  ip=${ips[RANDOM % ${#ips[@]}]}
  p=${paths[RANDOM % ${#paths[@]}]}
  c=${codes[RANDOM % ${#codes[@]}]}
  printf '%s - - [01/Oct/2026:%02d:%02d:%02d +0900] "GET %s HTTP/1.1" %s %d\n' \
    "$ip" $((RANDOM % 24)) $((RANDOM % 60)) $((RANDOM % 60)) \
    "$p" "$c" $((RANDOM % 5000 + 100))
done
