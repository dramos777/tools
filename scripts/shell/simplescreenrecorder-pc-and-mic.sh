#!/usr/bin/env bash

pactl load-module module-null-sink sink_name=duplex_out sink_properties=device.description="PC&MIC"
pactl load-module module-loopback sink=duplex_out
pactl load-module module-loopback sink=duplex_out
