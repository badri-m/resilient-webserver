#!/bin/bash

URL="http://devops-intern.local"
LOG_FILE="downtime.log"

while true
do
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

  if [ "$STATUS_CODE" -eq 200 ]; then
    echo "[PASS] Site is UP"
  else
    echo "[FAIL] Site is DOWN"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - DOWN (Status: $STATUS_CODE)" >> $LOG_FILE
  fi

  sleep 5
done