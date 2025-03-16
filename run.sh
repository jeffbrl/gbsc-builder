#!/bin/bash

if [[ -v 1 ]]; then
  BOARD=$1
else
  echo "You didn't specify a board. Using esp8266:esp8266:d1_mini"
  BOARD=esp8266:esp8266:d1_mini
fi

BOARDS=($(/app/bin/arduino-cli board listall | egrep -o '(esp8266:esp8266:.*)$' | tr '\n' ' '))

for element in "${BOARDS[@]}"; do
  if [[ "$BOARD" == "$element" ]]; then
    match_found=1
    break  # Exit the loop once a match is found
  fi
done

if [[ "$match_found" -ne 1 ]]; then
  echo "Unknown board. Please use a board from this list."
  /app/bin/arduino-cli board listall | egrep -o '(esp8266:esp8266:.*)$'
  exit 1
fi

git clone https://github.com/ramapcsx2/gbs-control.git

/app/bin/arduino-cli compile --fqbn $BOARD gbs-control --output-dir /app/output
