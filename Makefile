ARCH=m328p
UART=/dev/tty.usbserial-1430
HEX=.pio/build/ATmega328P/firmware.hex

clean:
	platformio run --target clean

build:
	platformio run

serial:
	ls -l /dev/tty.*

direct:
	avrdude -c arduino -p $(ARCH) -P $(UART) -U flash:w:$(HEX):i 

usbasp:
	avrdude -c usbasp -p $(ARCH) -P usb -U flash:w:$(HEX):i -FD

info:
	avrdude -c usbasp -p $(ARCH) -P usb -v

init:
	git submodule update --init --recursive
