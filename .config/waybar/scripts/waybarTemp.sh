#!/usr/bin/env bash

# Get CPU temperature from Tctl (AMD systems)
TEMP=$(sensors | grep 'Tctl:' | awk '{print $2}' | tr -d '+°C' | sed 's/°C//')

# fallback
if [[ -z "$TEMP" ]]; then
  CLASS="unknown"
  FORMAT="<span color='#ebdbb2' bgcolor='#555555' >  </span> N/A°C"
  printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
  exit 0
fi

# Convert TEMP to an integer (remove decimal part)
TEMP_INT=$(printf "%.0f" "$TEMP")

if (( TEMP_INT >= 70 )); then
  CLASS="critical"
  FORMAT="<span color='#DDDDDD' bgcolor='#202020' >  </span> ${TEMP_INT}°C"
elif (( TEMP_INT >= 60 )); then
  CLASS="warning"
  FORMAT="<span color='#DDDDDD' bgcolor='#202020' > 󰴈 </span> ${TEMP_INT}°C"
else
  CLASS="normal"
  FORMAT="<span color='#DDDDDD' bgcolor='#202020' > 󰴈 </span> ${TEMP_INT}°C"
fi

printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
