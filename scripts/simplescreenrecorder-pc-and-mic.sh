#!/usr/bin/env bash
#
#Executar com usuario normal
#
#Alterar os loopback nas configurações de audio para:
#   loopback1: USB PnP Audio DeviceEsterio digital (IEC958)
#   loopback2: Monitor of USB PnP Audio DeviceEsterio digital (IEC958)
#   SimpleScreenRecorder: Monitor of PC&MIC
#
#Descrição:
#   loopback1-dispositivo de entrada de áudio
#   loopback2-dispositivo monitor de audio (sons que saem do PC) 
#   PC&MIC-dispositivo que o loopback1 e loopback2 envia o som do mic e do PC
#
#Execução:
pactl load-module module-null-sink sink_name=duplex_out sink_properties=device.description="PC&MIC"
pactl load-module module-loopback sink=duplex_out
pactl load-module module-loopback sink=duplex_out
