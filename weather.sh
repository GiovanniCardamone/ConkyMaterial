#!/bin/bash

# in your bashrc
# export OPENWHEATERMAP_KEY=your openwheater map key

IP=$( curl https://api.ipify.org?format=text )

# echo $IP

LOCATION=$( curl http://ip-api.com/json/${IP} )

# echo $LOCATION

COUNTRY=$( jq -r '.country' <<< ${LOCATION} )
REGION=$( jq -r '.regionName' <<< ${LOCATION} )
# ZIP=$( jq -r '.zip' <<< ${LOCATION} )
LAT=$( jq -r '.lat' <<< ${LOCATION} )
LON=$( jq -r '.lon' <<< ${LOCATION} )

# echo $LAT $LON

curl "https://api.openweathermap.org/data/2.5/onecall?lat=${LAT}&lon=${LON}&units=metric&lang=it&exclude=minutely,hourly,daily,alerts&appid=${KEY}" -o weather.json