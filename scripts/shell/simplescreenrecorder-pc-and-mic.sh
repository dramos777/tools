#!/usr/bin/env bash
#Executar com usuario normal

pactl load-module module-null-sink sink_name=duplex_out sink_properties=device.description="PC&MIC"
pactl load-module module-loopback sink=duplex_out
pactl load-module module-loopback sink=duplex_out
