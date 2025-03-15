# GBSC-Builder

Build the gbs-control firmware in a docker container.

## Description

Building the gbs-control firmware with the Arduino IDE is tedious. This docker
container makes building the firmware simple.

## Getting Started

### Dependencies

This should work on any recent docker version on x86.

### Executing the build

This container image is available on Docker Hub.

You must specify an esp8266 board or use the default Wemos D1.

To select something other than Wemos D1, choose a Fully Qualified Board Name (FQBN) from
this list:

```
Board Name                      FQBN
4D Systems gen4 IoD Range       esp8266:esp8266:gen4iod
Adafruit Feather HUZZAH ESP8266 esp8266:esp8266:huzzah
Amperka WiFi Slot               esp8266:esp8266:wifi_slot
Arduino                         esp8266:esp8266:arduino-esp8266
DOIT ESP-Mx DevKit (ESP8285)    esp8266:esp8266:espmxdevkit
Digistump Oak                   esp8266:esp8266:oak
ESPDuino (ESP-13 Module)        esp8266:esp8266:espduino
ESPectro Core                   esp8266:esp8266:espectro
ESPino (ESP-12 Module)          esp8266:esp8266:espino
ESPresso Lite 1.0               esp8266:esp8266:espresso_lite_v1
ESPresso Lite 2.0               esp8266:esp8266:espresso_lite_v2
Generic ESP8266 Module          esp8266:esp8266:generic
Generic ESP8285 Module          esp8266:esp8266:esp8285
ITEAD Sonoff                    esp8266:esp8266:sonoff
Invent One                      esp8266:esp8266:inventone
LOLIN(WEMOS) D1 ESP-WROOM-02    esp8266:esp8266:d1_wroom_02
LOLIN(WEMOS) D1 R2 & mini       esp8266:esp8266:d1_mini
LOLIN(WEMOS) D1 mini (clone)    esp8266:esp8266:d1_mini_clone
LOLIN(WEMOS) D1 mini Lite       esp8266:esp8266:d1_mini_lite
LOLIN(WEMOS) D1 mini Pro        esp8266:esp8266:d1_mini_pro
LOLIN(WeMos) D1 R1              esp8266:esp8266:d1
Lifely Agrumino Lemon v4        esp8266:esp8266:agruminolemon
NodeMCU 0.9 (ESP-12 Module)     esp8266:esp8266:nodemcu
NodeMCU 1.0 (ESP-12E Module)    esp8266:esp8266:nodemcuv2
Olimex MOD-WIFI-ESP8266(-DEV)   esp8266:esp8266:modwifi
Phoenix 1.0                     esp8266:esp8266:phoenix_v1
Phoenix 2.0                     esp8266:esp8266:phoenix_v2
Schirmilabs Eduino WiFi         esp8266:esp8266:eduinowifi
Seeed Wio Link                  esp8266:esp8266:wiolink
SparkFun Blynk Board            esp8266:esp8266:blynk
SparkFun ESP8266 Thing          esp8266:esp8266:thing
SparkFun ESP8266 Thing Dev      esp8266:esp8266:thingdev
SweetPea ESP-210                esp8266:esp8266:esp210
ThaiEasyElec's ESPino           esp8266:esp8266:espinotee
WiFi Kit 8                      esp8266:esp8266:wifi_kit_8
WiFiduino                       esp8266:esp8266:wifiduino
WifInfo                         esp8266:esp8266:wifinfo
XinaBox CW01                    esp8266:esp8266:cw01
```

Note that these are the board provided by the esp8266 board manager. I suspect
many of these boards will not work with gbs-control so consult the [gbs-control
documentation](https://ramapcsx2.github.io/gbs-control/) if you are unsure.

You must mount a directory the container uses to output a binary. The directory
inside the container is /app/output.


Example `docker run` using the Wemos D1.
```
docker run -v output:/app/output gbsc-builder
```

Example `docker run` using the nodemcu
```
docker run -v output:/app/output gbsc-builder esp8266:esp8266:nodemcu
```

## Help

Message Jeff.L. on the ConsoleMods wiki or email me.


## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the Apache License 2.0 - see the LICENSE.txt file for details

## Acknowledgments

Credits to rama for sharing the [gbs-control firmware](https://github.com/ramapcsx2/gbs-control).
