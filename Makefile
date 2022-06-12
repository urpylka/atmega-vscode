ARCH=m328p
UART=/dev/tty.usbserial-1430
RATE=115200
HEX=.pio/build/ATmega328P/firmware.hex

init:
	git submodule update --init --recursive

setup:
	# Only for macOS
	brew install avrdude screen

all: upload

upload:
	platformio run --target upload

clean:
	platformio run --target clean

build:
	platformio run

list:
	ls -l /dev/tty.*

monitor:
	screen $(UART) $(RATE)

direct:
	avrdude -c arduino -p $(ARCH) -P $(UART) -U flash:w:$(HEX):i 

usbasp:
	avrdude -c usbasp -p $(ARCH) -P usb -U flash:w:$(HEX):i -FD

info:
	avrdude -c usbasp -p $(ARCH) -P usb -v
