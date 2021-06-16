MCU=atmega8
FCPU=16000000

CC=avr-gcc
CFLAGS=-Wall -g -Os -mmcu=$(MCU) -DF_CPU=$(FCPU)

OBJCOPY=avr-objcopy
OFLAGS=-j .text -j .data -O ihex

SIZE=avr-size
SFLAGS=-C

DUDE=avrdude
DFLAGS=-p $(MCU) -c usbasp-clone -P usb



atmega8.hex: atmega8.bin
	$(OBJCOPY) $(OFLAGS) atmega8.bin atmega8.hex

atmega8.bin: atmega8.c
	$(CC) $(CFLAGS) -o atmega8.bin atmega8.c
	$(SIZE) $(SFLAGS) atmega8.bin

.PHONY: clean

clean:
	rm -rf *.bin *.hex

.PHONY: flash

flash:
	$(DUDE) $(DFLAGS) -U flash:w:atmega8.hex:i
