FROM debian:bookworm-slim

WORKDIR /app
ARG ARDUINO_CLI=/app/bin/arduino-cli
COPY arduino-cli.yaml /app/arduino-cli.yaml

RUN apt update && apt install curl git python3 -y && \
apt-get clean autoclean && apt-get autoremove --yes && \
rm -rf /var/lib/{apt,dpkg,cache,log}/ && mkdir /app/output

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh && \
$ARDUINO_CLI core install esp8266:esp8266 --config-file /app/arduino-cli.yaml && \
$ARDUINO_CLI lib install ESPAsyncTCP && \
$ARDUINO_CLI lib install ESPAsyncWebServer && \
$ARDUINO_CLI lib install "ESP8266 and ESP32 OLED driver for SSD1306 displays"

COPY run.sh /app/bin/run.sh

ENTRYPOINT ["./bin/run.sh"]
